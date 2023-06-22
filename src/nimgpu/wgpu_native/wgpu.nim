import webgpu

import std/[os, strutils]
const wgpuLib = currentSourcePath.parentDir/"wgpu-native"/"target"/"release/"

when defined(WGPU_NATIVE_DYNLIB):
  const wgpudll = wgpuLib & "./" & (DynlibFormat % "wgpu_native")

  {.pragma: clib, cdecl, dynlib: wgpudll.}
else:
  {.pragma: clib.}
  {.passl: wgpuLib & "./libwgpu_native.a"}


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
type                        ##  Start at 6 to prevent collisions with webgpu STypes
  WGPUNativeSType* = enum
    WGPUSType_DeviceExtras = 0x60000001, WGPUSType_AdapterExtras = 0x60000002,
    WGPUSType_RequiredLimitsExtras = 0x60000003,
    WGPUSType_PipelineLayoutExtras = 0x60000004,
    WGPUSType_ShaderModuleGLSLDescriptor = 0x60000005,
    WGPUSType_InstanceExtras = 0x60000006,
    WGPUSType_SwapChainDescriptorExtras = 0x60000007,
    WGPUNativeSType_Force32 = 0x7FFFFFFF
  WGPUNativeFeature* = enum
    WGPUNativeFeature_PushConstants = 0x60000001,
    WGPUNativeFeature_TextureAdapterSpecificFormatFeatures = 0x60000002,
    WGPUNativeFeature_MultiDrawIndirect = 0x60000003,
    WGPUNativeFeature_MultiDrawIndirectCount = 0x60000004,
    WGPUNativeFeature_VertexWritableStorage = 0x60000005,
    WGPUNativeFeature_Force32 = 0x7FFFFFFF
  WGPULogLevel* = enum
    WGPULogLevel_Off = 0x00000000, WGPULogLevel_Error = 0x00000001,
    WGPULogLevel_Warn = 0x00000002, WGPULogLevel_Info = 0x00000003,
    WGPULogLevel_Debug = 0x00000004, WGPULogLevel_Trace = 0x00000005,
    WGPULogLevel_Force32 = 0x7FFFFFFF
  WGPUInstanceBackendFlags* = WGPUFlags
  WGPUDx12Compiler* = enum
    WGPUDx12Compiler_Undefined = 0x00000000, WGPUDx12Compiler_Fxc = 0x00000001,
    WGPUDx12Compiler_Dxc = 0x00000002, WGPUDx12Compiler_Force32 = 0x7FFFFFFF
  WGPUCompositeAlphaMode* = enum
    WGPUCompositeAlphaMode_Auto = 0x00000000,
    WGPUCompositeAlphaMode_Opaque = 0x00000001,
    WGPUCompositeAlphaMode_PreMultiplied = 0x00000002,
    WGPUCompositeAlphaMode_PostMultiplied = 0x00000003,
    WGPUCompositeAlphaMode_Inherit = 0x00000004,
    WGPUCompositeAlphaMode_Force32 = 0x7FFFFFFF
  WGPUInstanceExtras* {.bycopy.} = object
    chain*: WGPUChainedStruct
    backends*: WGPUInstanceBackendFlags
    dx12ShaderCompiler*: WGPUDx12Compiler
    dxilPath*: cstring
    dxcPath*: cstring

  WGPUAdapterExtras* {.bycopy.} = object
    chain*: WGPUChainedStruct
    backend*: WGPUBackendType

  WGPUDeviceExtras* {.bycopy.} = object
    chain*: WGPUChainedStruct
    tracePath*: cstring

  WGPURequiredLimitsExtras* {.bycopy.} = object
    chain*: WGPUChainedStruct
    maxPushConstantSize*: uint32

  WGPUSupportedLimitsExtras* {.bycopy.} = object
    chain*: WGPUChainedStructOut
    maxPushConstantSize*: uint32

  WGPUPushConstantRange* {.bycopy.} = object
    stages*: WGPUShaderStageFlags
    start*: uint32
    `end`*: uint32

  WGPUPipelineLayoutExtras* {.bycopy.} = object
    chain*: WGPUChainedStruct
    pushConstantRangeCount*: uint32
    pushConstantRanges*: ptr WGPUPushConstantRange

  WGPUSubmissionIndex* = uint64
  WGPUWrappedSubmissionIndex* {.bycopy.} = object
    queue*: WGPUQueue
    submissionIndex*: WGPUSubmissionIndex

  WGPUShaderDefine* {.bycopy.} = object
    name*: cstring
    value*: cstring

  WGPUShaderModuleGLSLDescriptor* {.bycopy.} = object
    chain*: WGPUChainedStruct
    stage*: WGPUShaderStage
    code*: cstring
    defineCount*: uint32
    defines*: ptr WGPUShaderDefine

  WGPUStorageReport* {.bycopy.} = object
    numOccupied*: csize_t
    numVacant*: csize_t
    numError*: csize_t
    elementSize*: csize_t

  WGPUHubReport* {.bycopy.} = object
    adapters*: WGPUStorageReport
    devices*: WGPUStorageReport
    pipelineLayouts*: WGPUStorageReport
    shaderModules*: WGPUStorageReport
    bindGroupLayouts*: WGPUStorageReport
    bindGroups*: WGPUStorageReport
    commandBuffers*: WGPUStorageReport
    renderBundles*: WGPUStorageReport
    renderPipelines*: WGPUStorageReport
    computePipelines*: WGPUStorageReport
    querySets*: WGPUStorageReport
    buffers*: WGPUStorageReport
    textures*: WGPUStorageReport
    textureViews*: WGPUStorageReport
    samplers*: WGPUStorageReport

  WGPUGlobalReport* {.bycopy.} = object
    surfaces*: WGPUStorageReport
    backendType*: WGPUBackendType
    vulkan*: WGPUHubReport
    metal*: WGPUHubReport
    dx12*: WGPUHubReport
    dx11*: WGPUHubReport
    gl*: WGPUHubReport

  WGPUSurfaceCapabilities* {.bycopy.} = object
    formatCount*: csize_t
    formats*: ptr WGPUTextureFormat
    presentModeCount*: csize_t
    presentModes*: ptr WGPUPresentMode
    alphaModeCount*: csize_t
    alphaModes*: ptr WGPUCompositeAlphaMode

  WGPUSwapChainDescriptorExtras* {.bycopy.} = object
    chain*: WGPUChainedStruct
    alphaMode*: WGPUCompositeAlphaMode
    viewFormatCount*: csize_t
    viewFormats*: ptr WGPUTextureFormat

  WGPULogCallback* = proc (level: WGPULogLevel; message: cstring;
                           userdata: pointer)

const
  WGPUSType_SupportedLimitsExtras = WGPUSType_RequiredLimitsExtras





proc wgpuGenerateReport*(instance: WGPUInstance; report: ptr WGPUGlobalReport) {.
    importc: "wgpuGenerateReport", clib.}
proc wgpuQueueSubmitForIndex*(queue: WGPUQueue; commandCount: uint32;
                              commands: ptr WGPUCommandBuffer): WGPUSubmissionIndex {.
    importc: "wgpuQueueSubmitForIndex", clib.}
##  Returns true if the queue is empty, or false if there are more queue submissions still in flight.

proc wgpuDevicePoll*(device: WGPUDevice; wait: bool;
                     wrappedSubmissionIndex: ptr WGPUWrappedSubmissionIndex): bool {.
    importc: "wgpuDevicePoll", clib.}
proc wgpuSetLogCallback*(callback: WGPULogCallback; userdata: pointer) {.
    importc: "wgpuSetLogCallback", clib.}
proc wgpuSetLogLevel*(level: WGPULogLevel) {.importc: "wgpuSetLogLevel", clib.}
proc wgpuGetVersion*(): uint32 {.importc: "wgpuGetVersion", clib.}
proc wgpuSurfaceGetCapabilities*(surface: WGPUSurface; adapter: WGPUAdapter;
                                 capabilities: ptr WGPUSurfaceCapabilities) {.
    importc: "wgpuSurfaceGetCapabilities", clib.}
proc wgpuRenderPassEncoderSetPushConstants*(encoder: WGPURenderPassEncoder;
    stages: WGPUShaderStageFlags; offset: uint32; sizeBytes: uint32;
    data: pointer) {.importc: "wgpuRenderPassEncoderSetPushConstants", clib.}
proc wgpuRenderPassEncoderMultiDrawIndirect*(encoder: WGPURenderPassEncoder;
    buffer: WGPUBuffer; offset: uint64; count: uint32) {.
    importc: "wgpuRenderPassEncoderMultiDrawIndirect", clib.}
proc wgpuRenderPassEncoderMultiDrawIndexedIndirect*(
    encoder: WGPURenderPassEncoder; buffer: WGPUBuffer; offset: uint64;
    count: uint32) {.importc: "wgpuRenderPassEncoderMultiDrawIndexedIndirect",
                     clib.}
proc wgpuRenderPassEncoderMultiDrawIndirectCount*(
    encoder: WGPURenderPassEncoder; buffer: WGPUBuffer; offset: uint64;
    count_buffer: WGPUBuffer; count_buffer_offset: uint64; max_count: uint32) {.
    importc: "wgpuRenderPassEncoderMultiDrawIndirectCount", clib.}
proc wgpuRenderPassEncoderMultiDrawIndexedIndirectCount*(
    encoder: WGPURenderPassEncoder; buffer: WGPUBuffer; offset: uint64;
    count_buffer: WGPUBuffer; count_buffer_offset: uint64; max_count: uint32) {.
    importc: "wgpuRenderPassEncoderMultiDrawIndexedIndirectCount", clib.}
proc wgpuAdapterDrop*(adapter: WGPUAdapter) {.importc: "wgpuAdapterDrop", clib.}
proc wgpuBindGroupDrop*(bindGroup: WGPUBindGroup) {.
    importc: "wgpuBindGroupDrop", clib.}
proc wgpuBindGroupLayoutDrop*(bindGroupLayout: WGPUBindGroupLayout) {.
    importc: "wgpuBindGroupLayoutDrop", clib.}
proc wgpuBufferDrop*(buffer: WGPUBuffer) {.importc: "wgpuBufferDrop", clib.}
proc wgpuCommandBufferDrop*(commandBuffer: WGPUCommandBuffer) {.
    importc: "wgpuCommandBufferDrop", clib.}
proc wgpuCommandEncoderDrop*(commandEncoder: WGPUCommandEncoder) {.
    importc: "wgpuCommandEncoderDrop", clib.}
proc wgpuComputePassEncoderDrop*(computePassEncoder: WGPUComputePassEncoder) {.
    importc: "wgpuComputePassEncoderDrop", clib.}
proc wgpuComputePipelineDrop*(computePipeline: WGPUComputePipeline) {.
    importc: "wgpuComputePipelineDrop", clib.}
proc wgpuDeviceDrop*(device: WGPUDevice) {.importc: "wgpuDeviceDrop", clib.}
proc wgpuInstanceDrop*(instance: WGPUInstance) {.importc: "wgpuInstanceDrop",
    clib.}
proc wgpuPipelineLayoutDrop*(pipelineLayout: WGPUPipelineLayout) {.
    importc: "wgpuPipelineLayoutDrop", clib.}
proc wgpuQuerySetDrop*(querySet: WGPUQuerySet) {.importc: "wgpuQuerySetDrop",
    clib.}
proc wgpuQueueDrop*(queue: WGPUQueue) {.importc: "wgpuQueueDrop", clib.}
proc wgpuRenderBundleDrop*(renderBundle: WGPURenderBundle) {.
    importc: "wgpuRenderBundleDrop", clib.}
proc wgpuRenderBundleEncoderDrop*(renderBundleEncoder: WGPURenderBundleEncoder) {.
    importc: "wgpuRenderBundleEncoderDrop", clib.}
proc wgpuRenderPassEncoderDrop*(renderPassEncoder: WGPURenderPassEncoder) {.
    importc: "wgpuRenderPassEncoderDrop", clib.}
proc wgpuRenderPipelineDrop*(renderPipeline: WGPURenderPipeline) {.
    importc: "wgpuRenderPipelineDrop", clib.}
proc wgpuSamplerDrop*(sampler: WGPUSampler) {.importc: "wgpuSamplerDrop", clib.}
proc wgpuShaderModuleDrop*(shaderModule: WGPUShaderModule) {.
    importc: "wgpuShaderModuleDrop", clib.}
proc wgpuSurfaceDrop*(surface: WGPUSurface) {.importc: "wgpuSurfaceDrop", clib.}
proc wgpuSwapChainDrop*(swapChain: WGPUSwapChain) {.
    importc: "wgpuSwapChainDrop", clib.}
proc wgpuTextureDrop*(texture: WGPUTexture) {.importc: "wgpuTextureDrop", clib.}
proc wgpuTextureViewDrop*(textureView: WGPUTextureView) {.
    importc: "wgpuTextureViewDrop", clib.}