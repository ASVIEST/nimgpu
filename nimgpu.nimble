# Package

version       = "0.1.0"
author        = "ASVIEST"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"


# Dependencies

requires "nim >= 1.9.3"

task generate, "generate webgpu bindings":
  exec "nim c -r -d:release generator/gen_wgpu"

taskRequires "generate", "shell"
taskRequires "generate", "https://github.com/ASVIEST/c2nim#fix-clib"
