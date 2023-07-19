import common
import gen_wgpu
import gen_dawn

import std/os
import pkg/cligen

type Bindings {.pure.} = enum
  `wgpu-native`
  dawn

func generatedFolder(b: Bindings): string=
  case b:
    of dawn:
      "dawn"
    of `wgpu-native`:
      "wgpu_native"

proc cli(bindings: Bindings, release: bool = false, `out`: string)=
  const generatorDir = currentSourcePath.parentDir
  
  
  let settings = GeneratorSettings(
    genReleaseBuild: release,
    generatedFolder: bindings.generatedFolder
  )

  case bindings:
    of dawn:
      DawnGenerator(
        settings: settings,
        dawnDir: generatorDir/"dawn"
      ).generate(`out`)

    of `wgpu-native`:
      WgpuGenerator(
        settings: settings,
        wgpuDir: generatorDir/"wgpu-native"
      ).generate(`out`)

dispatch cli