import common, helpers

import pkg/oolib
import std/[os, strutils, options]

class pub WgpuGenerator:
  var
    settings*: GeneratorSettings
    wgpuDir*: string
  
    webgpuHeader, wgpuHeader: string
  
  const
    headerPrelude = dedent"""
      import std/os
      const wgpuLib = currentSourcePath.parentDir/"wgpu-native/target/$1/"

      when defined(WGPU_NATIVE_DYNLIB):
        const wgpudll = wgpuLib & "./" & (DynlibFormat % "wgpu_native")  
        {.pragma: clib, cdecl, dynlib: wgpudll.}
      else:
        {.pragma: clib.}
        {.passl: wgpuLib & "./libwgpu_native.a"}
    """
  
  func targetString: string =
    if self.settings.genReleaseBuild:
      "release"
    else:
      "debug"

  proc preproc* =
    self.webgpuHeader = preprocWebgpuHeader(
      self.webgpuHeader,
      self.headerPrelude % self.targetString,
      "clibuserpragma"
    )

    self.wgpuHeader = preprocWgpuHeader(
      self.wgpuHeader,
      self.headerPrelude % self.targetString,
      "clibuserpragma"
    )
  
  proc generate: auto =
    discard cargoBuild(self.wgpuDir, self.settings.genReleaseBuild)

    self.webgpuHeader = readFile(
      self.wgpuDir/"ffi/webgpu-headers/webgpu.h"
    )

    self.wgpuHeader = readFile(
      self.wgpuDir/"ffi/wgpu.h"
    )

    self.preproc()

    [
      ("webgpu.nim", c2nim(self.webgpuHeader).get),
      ("wgpu.nim", c2nim(self.wgpuHeader).get)
    ]

  iterator virtualFS*(): GeneratedFile=
    for i in self.generate():
      yield i
    
    let
      dynLibPath = "target"/self.targetString/(DynlibFormat % "wgpu_native")
      staticLibPath = "target"/self.targetString/(StaticLibFormat % "wgpu_native")

    yield ("wgpu-native"/dynLibPath, readFile(self.wgpuDir/dynLibPath))
    yield ("wgpu-native"/staticLibPath, readFile(self.wgpuDir/staticLibPath))
