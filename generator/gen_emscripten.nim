import common, helpers

import pkg/oolib
import std/[options, os]

class pub EmscriptenGenerator:
  var
    settings*: GeneratorSettings
    emscriptenDir*: string
    
    webgpuHeader: string
  
  func preproc =
    self.webgpuHeader = preprocWebgpuHeader(
      self.webgpuHeader,
      "", "importc"
    )
  
  proc generate: GeneratedFile =
    self.webgpuHeader = readFile(
      self.emscriptenDir/"system/include/webgpu/webgpu.h"
    )
    self.preproc()
    
    ("webgpu.nim", c2nim(self.webgpuHeader).get)
  
  iterator virtualFS*(): GeneratedFile=
    yield self.generate()