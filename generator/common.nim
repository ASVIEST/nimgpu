import std/os

type
  GeneratedFile* = tuple[path, data: string]
  GeneratorSettings* = object
    genReleaseBuild*: bool = true
    generatedFolder*: string

  Generator* = concept x
    for i in x.virtualFS:
      i is GeneratedFile

    x.settings is GeneratorSettings

proc create*(f: GeneratedFile, srcDir: string = "")=
  createDir(srcDir/f.path.parentDir)  
  writeFile(srcDir/f.path, f.data)

proc generate*(generator: Generator, dirPath: string)=
  for i in generator.virtualFS:
    i.create(dirPath/generator.settings.generatedFolder)