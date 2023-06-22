import pkg/shell
import std/[strutils, options, strformat, with]
import std/[tempfiles, streams, os]
import helpers

const
  generatorDir = currentSourcePath.parentDir
  wgpuDir = generatorDir/"wgpu-native"
  
  projectDir = currentSourcePath.parentDir.parentDir
  projectName = projectDir.lastPathPart
  outDir = projectDir/"src"/projectName/"wgpu_native"


  wgpuLibPath = ".."/"src"/projectName/"wgpu_native"/"wgpu-native"/"target"/"release"  

type
  Generator = object
    step: BuildStep
    status: BuildStatus

  BuildStatus = object
    wgpuBuildErrMsg: Option[string]
    c2nimSuc: bool
  
  BuildStep {.pure.} = enum
    BuildWgpuNativeLib
    PreprocWebgpuHeader
    RunC2NimOnWebgpuHeader
    PreprocWgpuHeader
    RunC2NimOnWgpuHeader

    CopyWgpuNativeDir
    CopyGeneratedNimFiles

    Final

using self: var Generator

proc buildWgpuNativeLib(self)=
  var cargoOut: string

  shellAssign:
    cargoOut = one:
      cd ($wgpuDir)
      cargo build -r --lib
  
  self.status.wgpuBuildErrMsg = 
    if "Finished" in cargoOut:
      none(string)
    else:
      some(cargoOut)

  inc self.step

const linkLib = """
when defined(WGPU_NATIVE_DYNLIB):
  const wgpudll = "$wgpuLibPath$/" & (
    when defined(windows):
      "./wgpu_native.dll"
    elif defined(macosx):
      "./libwgpu_native.dylib"
    else:
      "./libwgpu_native.so"
  )
  
  {.pragma: clib, cdecl, dynlib: wgpudll.}
else:
  {.pragma: clib.}
  {.passl: "$wgpuLibPath$/" & "./libwgpu_native.a"}
""".fmt('$', '$')

proc preprocWebgpuHeader(self): string=
  const headerPath = wgpuDir/"ffi"/"webgpu-headers"/"webgpu.h"
  let
    strm = newFileStream(headerPath)
    header = strm.readAll()
  strm.close
  
  let headerBody = header
    .withSkipUntil("#define WGPU_ARRAY_LAYER_COUNT_UNDEFINED")
    .cropBetween(
      "typedef struct",
      "typedef enum"
    )
    .multiReplace(
      ("typedef void const * ", "typedef void"),
      ("#endif // WEBGPU_H_", ""),

      ("// !defined(WGPU_SKIP_PROCS)", ""),
      ("// !defined(WGPU_SKIP_DECLARATIONS)", "")
    )
  const
    headerPrelude = """
#@
{.experimental: "codeReordering".}

$linkLib$

@#

#clibuserpragma
#mangle SIZE_MAX "sizeof(csize_t)"
#stdints

#define WGPU_EXPORT

#define WGPU_OBJECT_ATTRIBUTE
#define WGPU_ENUM_ATTRIBUTE
#define WGPU_STRUCTURE_ATTRIBUTE
#define WGPU_FUNCTION_ATTRIBUTE
#define WGPU_NULLABLE

#@
type
  WGPUAdapter* = distinct pointer
  WGPUBindGroup* = distinct pointer
  WGPUBindGroupLayout* = distinct pointer
  WGPUBuffer* = distinct pointer
  WGPUCommandBuffer* = distinct pointer
  WGPUCommandEncoder* = distinct pointer
  WGPUComputePassEncoder* = distinct pointer
  WGPUComputePipeline* = distinct pointer
  WGPUDevice* = distinct pointer
  WGPUInstance* = distinct pointer
  WGPUPipelineLayout* = distinct pointer
  WGPUQuerySet* = distinct pointer
  WGPUQueue* = distinct pointer
  WGPURenderBundle* = distinct pointer
  WGPURenderBundleEncoder* = distinct pointer
  WGPURenderPassEncoder* = distinct pointer
  WGPURenderPipeline* = distinct pointer
  WGPUSampler* = distinct pointer
  WGPUShaderModule* = distinct pointer
  WGPUSurface* = distinct pointer
  WGPUSwapChain* = distinct pointer
  WGPUTexture* = distinct pointer
  WGPUTextureView* = distinct pointer
@#

""".fmt('$', '$')
  
  inc self.step

  headerPrelude & headerBody

proc preprocWgpuHeader(self): string=
  const headerPath = wgpuDir/"ffi"/"wgpu.h"
  let
    strm = newFileStream(headerPath)
    header = strm.readAll()
  strm.close

  const
    headerPrelude = """
#skipinclude
#stdints
#clibuserpragma


#@
import webgpu

$linkLib$

type
  WGPUInstanceBackend* {.size: sizeof(cint).} = enum
    WGPUInstanceBackend_None = 0x00000000
    WGPUInstanceBackend_Vulkan = 1 shl 1
    WGPUInstanceBackend_Metal = 1 shl 2
    WGPUInstanceBackend_DX12 = 1 shl 3
    WGPUInstanceBackend_DX11 = 1 shl 4
    WGPUInstanceBackend_GL = 1 shl 5

    WGPUInstanceBackend_Secondary = 
        WGPUInstanceBackend_GL.cint or
        WGPUInstanceBackend_DX11.cint

    WGPUInstanceBackend_BrowserWebGPU = 1 shl 6
    WGPUInstanceBackend_Primary =
        WGPUInstanceBackend_Vulkan.cint or
        WGPUInstanceBackend_Metal.cint or
        WGPUInstanceBackend_DX12.cint or
        WGPUInstanceBackend_BrowserWebGPU.cint
    
    WGPUInstanceBackend_Force32 = 0x7FFFFFFF
@#
""".fmt('$', '$')

  inc self.step

  headerPrelude & header.cropBetween(
    "typedef enum WGPUInstanceBackend",
    "typedef WGPUFlags WGPUInstanceBackendFlags"
  )


proc runC2Nim(self; s: string, resPath: string = s)=
  let
    (cfile, path) = createTempFile("webgpugen_", ".tmp")
    strm = newFileStream(cfile)
  strm.write s
  strm.close

  let o = "-o:" & resPath
  var msg: string

  shellAssign:
    msg = c2nim ($path) --strict ($o)
  
  self.status.c2nimSuc = self.status.c2nimSuc and ("successful" in msg)
  inc self.step

proc copyWgpuNativeDir(self)=
  #copy only necessary files from wgpu-native dir 
  const dir = outDir/"wgpu-native"
  createDir(dir)
  
  createDir(dir/"ffi")
  createDir(dir/"ffi"/"webgpu-headers")

  createDir(dir/"target")
  createDir(dir/"target"/"release")

  copyFileToDir(
    wgpuDir/"ffi"/"webgpu-headers"/"webgpu.h", 
    dir/"ffi"/"webgpu-headers")
  copyFileToDir(
    wgpuDir/"ffi"/"wgpu.h", 
    dir/"ffi")
  
  copyFileToDir(
    wgpuDir/"target"/"release"/"libwgpu_native.a", 
    dir/"target"/"release")
  copyFileToDir(
    wgpuDir/"target"/"release"/(DynlibFormat % "wgpu_native"), 
    dir/"target"/"release")

  inc self.step

proc copyGeneratedNimFiles(self; paths: varargs[string])=
  for i in paths:
    copyFileToDir(i, outDir)

  inc self.step

const
  resPathWebgpu = "webgpu.nim"
  resPathWgpu = "wgpu.nim"

var generator: Generator
generator.status.c2nimSuc = true

with generator:
  buildWgpuNativeLib

  runC2Nim generator.preprocWebgpuHeader, resPathWebgpu
  runC2Nim generator.preprocWgpuHeader,   resPathWgpu

  copyWgpuNativeDir
  copyGeneratedNimFiles resPathWebgpu, resPathWgpu

assert generator.step == Final