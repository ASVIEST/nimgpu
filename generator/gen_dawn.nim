import common, helpers

import pkg/[oolib, shell]
import std/[strutils, options, os]

class pub DawnGenerator:
  var
    settings*: GeneratorSettings
    dawnDir*: string

    webgpuHeader: string

  const headerPrelude = dedent"""
    {.compile("dawn/dawn_proc.c", "-I 'headers'").}
  """

  func preproc* =
    self.webgpuHeader = preprocWebgpuHeader(
      self.webgpuHeader,
      self.headerPrelude % self.dawnDir
    )

  proc generate: GeneratedFile =
    createDir(self.dawnDir/"out")
    shell:
      one:
        cd ($self.dawnDir)
        cp scripts/standalone.gclient ".gclient"
        gclient sync
      one:
        cd ($self.dawnDir)
        gn gen "out"
      one:
        cd ($self.dawnDir)
        ninja -C "out"
        cd "out"
        tree
    
    self.webgpuHeader = readFile(
      self.dawnDir/"out/gen/include/dawn/webgpu.h"
    )

    
    self.preproc()

    ("webgpu.nim", c2nim(self.webgpuHeader).get)
  
  iterator virtualFS*(): GeneratedFile=
    yield self.generate()

    walkDir(self.dawnDir/"out/gen/include/dawn").each i:
      yield ("headers/dawn"/i.path.extractFilename, i.path.readFile)
    
    walkDirRec(self.dawnDir/"include/dawn").each i:
      let folder = block:
        let lastPart = i.parentDir.lastPathPart
        
        if lastPart == "dawn":
          ""
        else:
          lastPart

      yield ("headers/dawn"/folder/i.extractFilename, i.readFile)
    
    walkDirRec(self.dawnDir/"out/gen/src/dawn").each i:
      let folder = block:
        let lastPart = i.parentDir.lastPathPart
        
        if lastPart == "dawn":
          ""
        else:
          lastPart
      
      yield ("dawn"/folder/i.extractFilename, i.readFile)
