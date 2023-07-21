import common
import gen_wgpu
import gen_dawn
import gen_emscripten

import std/os
import pkg/cligen

type Bindings {.pure.} = enum
  `wgpu-native`
  dawn
  emscripten

func generatedFolder(b: Bindings): string=
  case b:
    of dawn:
      "dawn"
    of `wgpu-native`:
      "wgpu_native"
    of emscripten:
      "emscripten"

proc cli(bindings: Bindings, release: bool = false, `out`: string)=
  const thirdPartyDir = currentSourcePath.parentDir/"third_party"
  
  
  let settings = GeneratorSettings(
    genReleaseBuild: release,
    generatedFolder: bindings.generatedFolder
  )

  case bindings:
    of dawn:
      DawnGenerator(
        settings: settings,
        dawnDir: thirdPartyDir/"dawn"
      ).generate(`out`)

    of `wgpu-native`:
      WgpuGenerator(
        settings: settings,
        wgpuDir: thirdPartyDir/"wgpu-native"
      ).generate(`out`)
    
    of emscripten:
      EmscriptenGenerator(
        settings: settings,
        emscriptenDir: thirdPartyDir/"emscripten"
      ).generate(`out`)

dispatch cli