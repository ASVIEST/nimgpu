# Package

version       = "0.1.0"
author        = "ASVIEST"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"


# Dependencies

requires "nim >= 1.9.3"

task generate, "generate webgpu bindings":
  exec "nim c -r -d:release generator/cli -r -b wgpu-native -o src/nimgpu"
  exec "nim c -r -d:release generator/cli -r -b dawn -o src/nimgpu"


taskRequires "generate", "shell"
taskRequires "generate", "oolib"
taskRequires "generate", "cligen"
taskRequires "generate", "https://github.com/ASVIEST/c2nim#fix-clib"
