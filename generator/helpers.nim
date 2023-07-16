import pkg/shell
import std/[parseutils, strutils, strformat, options, tempfiles, streams]

proc skipUntil*(s: string, until: string): int=
  var tmp: string
  s.parseUntil(tmp, until)

proc withSkipUntil*(s: string, until: string): string=
  let idx = s.skipUntil(until)
  s[idx..^1]

proc cropBetween*(s: string, lBound, rBound: string): string=
  let
    idxLeft  = s.skipUntil(lBound) - 1
    idxRight = s[idxLeft..^1].skipUntil(rBound)

  s[0..idxLeft] & s[idxLeft + idxRight - 1..^1]

template each*(iter: untyped, i: untyped{ident}, body: untyped): untyped=
  for i in iter:
    body

const StaticLibFormat* =
  when defined(windows):
    "$1.lib"
  else:
    "lib$1.a"

const webgpuHeaderPrelude = """
#@
{.experimental: "codeReordering".}

$1

@#

#$2
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
  WGPUExternalTexture* = distinct pointer
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

"""

proc preprocWebgpuHeader*(header, prelude: string, libPragma: string = "importc"): string=
  (webgpuHeaderPrelude % [prelude, libPragma]) &
  header
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

const wgpuHeaderPrelude = """
#skipinclude
#stdints
#$2

#@
import webgpu

$1

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
"""

proc preprocWgpuHeader*(header, prelude: string, libPragma: string = "importc"): string=
  (wgpuHeaderPrelude % [prelude, libPragma]) & header.cropBetween(
    "typedef enum WGPUInstanceBackend",
    "typedef WGPUFlags WGPUInstanceBackendFlags"
  )


proc c2nim*(s: string): Option[string]=
  let
    (inFile, path) = createTempFile("webgpugen_", ".tmp")

  block:
    let strm = newFileStream(inFile)
    strm.write s
    strm.close

  let (outFile, resPath) = createTempFile("nimout_", ".tmp")

  let o = "-o:" & resPath
  var msg: string

  shellAssign:
    msg = c2nim ($path) --strict ($o)

  if "successful" notin msg:
    return none(string)

  block:
    var strm = newFileStream(outFile)
    result = some(strm.readAll)
    strm.close

proc cargoBuild*(dirPath: string, release: bool = false): Option[string]=
  var cargoOut: string
  let r =
    if release: "-r"
    else: ""

  shellAssign:
    cargoOut = one:
      cd ($dirPath)
      cargo build ($r) --lib
  
  if "Finished" in cargoOut:
    return none(string)
  
  some(cargoOut)
