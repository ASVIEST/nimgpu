import macros

# Package

version       = "0.1.0"
author        = "ASVIEST"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"


# Dependencies

requires "nim >= 1.9.3"

macro generateTask(name: untyped{ident}, bindings: static string): untyped=
  let 
    execCmd = "nim c -r -d:release generator/cli -r -b " & bindings & " -o src/nimgpu"
    nameStr = newStrLitNode(name.strVal)
  
  quote:
    task `name`, "generate webgpu bindings":
      exec `execCmd`

    taskRequires `nameStr`, "shell"
    taskRequires `nameStr`, "oolib"
    taskRequires `nameStr`, "cligen"
    taskRequires `nameStr`, "https://github.com/ASVIEST/c2nim#fix-clib"

generateTask(generate_wgpu, "wgpu-native")
generateTask(generate_dawn, "dawn")
generateTask(generate_emscripten, "emscripten")