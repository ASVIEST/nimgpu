{.experimental: "codeReordering".}

import std/os
const wgpuLib = currentSourcePath.parentDir/"wgpu-native/target/release/"

when defined(WGPU_NATIVE_DYNLIB):
  const wgpudll = wgpuLib & "./" & (DynlibFormat % "wgpu_native")
  {.pragma: clib, cdecl, dynlib: wgpudll.}
else:
  {.pragma: clib.}
  {.passl: wgpuLib & "./libwgpu_native.a"}


type
  WGPUAdapter* = distinct pointer
  WGPUBindGroup* = distinct pointer
  WGPUBindGroupLayout* = distinct pointer
  WGPUBuffer* = distinct pointer
  WGPUCommandBuffer* = distinct pointer
  WGPUCommandEncoder* = distinct pointer
  WGPUComputePassEncoder* = distinct pointer
  WGPUComputePipeline* = distinct pointer
  WGPUDevice* = distinct pointer
  WGPUExternalTexture* = distinct pointer
  WGPUInstance* = distinct pointer
  WGPUPipelineLayout* = distinct pointer
  WGPUQuerySet* = distinct pointer
  WGPUQueue* = distinct pointer
  WGPURenderBundle* = distinct pointer
  WGPURenderBundleEncoder* = distinct pointer
  WGPURenderPassEncoder* = distinct pointer
  WGPURenderPipeline* = distinct pointer
  WGPUSampler* = distinct pointer
  WGPUShaderModule* = distinct pointer
  WGPUSurface* = distinct pointer
  WGPUSwapChain* = distinct pointer
  WGPUTexture* = distinct pointer
  WGPUTextureView* = distinct pointer
const
  WGPU_ARRAY_LAYER_COUNT_UNDEFINED* = (0xffffffff)
  WGPU_COPY_STRIDE_UNDEFINED* = (0xffffffff)
  WGPU_LIMIT_U32_UNDEFINED* = (0xffffffff)
  WGPU_LIMIT_U64_UNDEFINED* = (0xffffffffffffffff'u)
  WGPU_MIP_LEVEL_COUNT_UNDEFINED* = (0xffffffff)
  WGPU_WHOLE_MAP_SIZE* = sizeof(csize_t)
  WGPU_WHOLE_SIZE* = (0xffffffffffffffff'u)

type
  WGPUFlags* = uint32
  WGPUAdapterType* = enum
    WGPUAdapterType_DiscreteGPU = 0x00000000,
    WGPUAdapterType_IntegratedGPU = 0x00000001,
    WGPUAdapterType_CPU = 0x00000002, WGPUAdapterType_Unknown = 0x00000003,
    WGPUAdapterType_Force32 = 0x7FFFFFFF
  WGPUAddressMode* = enum
    WGPUAddressMode_Repeat = 0x00000000,
    WGPUAddressMode_MirrorRepeat = 0x00000001,
    WGPUAddressMode_ClampToEdge = 0x00000002,
    WGPUAddressMode_Force32 = 0x7FFFFFFF
  WGPUBackendType* = enum
    WGPUBackendType_Null = 0x00000000, WGPUBackendType_WebGPU = 0x00000001,
    WGPUBackendType_D3D11 = 0x00000002, WGPUBackendType_D3D12 = 0x00000003,
    WGPUBackendType_Metal = 0x00000004, WGPUBackendType_Vulkan = 0x00000005,
    WGPUBackendType_OpenGL = 0x00000006, WGPUBackendType_OpenGLES = 0x00000007,
    WGPUBackendType_Force32 = 0x7FFFFFFF
  WGPUBlendFactor* = enum
    WGPUBlendFactor_Zero = 0x00000000, WGPUBlendFactor_One = 0x00000001,
    WGPUBlendFactor_Src = 0x00000002, WGPUBlendFactor_OneMinusSrc = 0x00000003,
    WGPUBlendFactor_SrcAlpha = 0x00000004,
    WGPUBlendFactor_OneMinusSrcAlpha = 0x00000005,
    WGPUBlendFactor_Dst = 0x00000006, WGPUBlendFactor_OneMinusDst = 0x00000007,
    WGPUBlendFactor_DstAlpha = 0x00000008,
    WGPUBlendFactor_OneMinusDstAlpha = 0x00000009,
    WGPUBlendFactor_SrcAlphaSaturated = 0x0000000A,
    WGPUBlendFactor_Constant = 0x0000000B,
    WGPUBlendFactor_OneMinusConstant = 0x0000000C,
    WGPUBlendFactor_Force32 = 0x7FFFFFFF
  WGPUBlendOperation* = enum
    WGPUBlendOperation_Add = 0x00000000,
    WGPUBlendOperation_Subtract = 0x00000001,
    WGPUBlendOperation_ReverseSubtract = 0x00000002,
    WGPUBlendOperation_Min = 0x00000003, WGPUBlendOperation_Max = 0x00000004,
    WGPUBlendOperation_Force32 = 0x7FFFFFFF
  WGPUBufferBindingType* = enum
    WGPUBufferBindingType_Undefined = 0x00000000,
    WGPUBufferBindingType_Uniform = 0x00000001,
    WGPUBufferBindingType_Storage = 0x00000002,
    WGPUBufferBindingType_ReadOnlyStorage = 0x00000003,
    WGPUBufferBindingType_Force32 = 0x7FFFFFFF
  WGPUBufferMapAsyncStatus* = enum
    WGPUBufferMapAsyncStatus_Success = 0x00000000,
    WGPUBufferMapAsyncStatus_Error = 0x00000001,
    WGPUBufferMapAsyncStatus_Unknown = 0x00000002,
    WGPUBufferMapAsyncStatus_DeviceLost = 0x00000003,
    WGPUBufferMapAsyncStatus_DestroyedBeforeCallback = 0x00000004,
    WGPUBufferMapAsyncStatus_UnmappedBeforeCallback = 0x00000005,
    WGPUBufferMapAsyncStatus_Force32 = 0x7FFFFFFF
  WGPUBufferMapState* = enum
    WGPUBufferMapState_Unmapped = 0x00000000,
    WGPUBufferMapState_Pending = 0x00000001,
    WGPUBufferMapState_Mapped = 0x00000002,
    WGPUBufferMapState_Force32 = 0x7FFFFFFF
  WGPUCompareFunction* = enum
    WGPUCompareFunction_Undefined = 0x00000000,
    WGPUCompareFunction_Never = 0x00000001,
    WGPUCompareFunction_Less = 0x00000002,
    WGPUCompareFunction_LessEqual = 0x00000003,
    WGPUCompareFunction_Greater = 0x00000004,
    WGPUCompareFunction_GreaterEqual = 0x00000005,
    WGPUCompareFunction_Equal = 0x00000006,
    WGPUCompareFunction_NotEqual = 0x00000007,
    WGPUCompareFunction_Always = 0x00000008,
    WGPUCompareFunction_Force32 = 0x7FFFFFFF
  WGPUCompilationInfoRequestStatus* = enum
    WGPUCompilationInfoRequestStatus_Success = 0x00000000,
    WGPUCompilationInfoRequestStatus_Error = 0x00000001,
    WGPUCompilationInfoRequestStatus_DeviceLost = 0x00000002,
    WGPUCompilationInfoRequestStatus_Unknown = 0x00000003,
    WGPUCompilationInfoRequestStatus_Force32 = 0x7FFFFFFF
  WGPUCompilationMessageType* = enum
    WGPUCompilationMessageType_Error = 0x00000000,
    WGPUCompilationMessageType_Warning = 0x00000001,
    WGPUCompilationMessageType_Info = 0x00000002,
    WGPUCompilationMessageType_Force32 = 0x7FFFFFFF
  WGPUComputePassTimestampLocation* = enum
    WGPUComputePassTimestampLocation_Beginning = 0x00000000,
    WGPUComputePassTimestampLocation_End = 0x00000001,
    WGPUComputePassTimestampLocation_Force32 = 0x7FFFFFFF
  WGPUCreatePipelineAsyncStatus* = enum
    WGPUCreatePipelineAsyncStatus_Success = 0x00000000,
    WGPUCreatePipelineAsyncStatus_ValidationError = 0x00000001,
    WGPUCreatePipelineAsyncStatus_InternalError = 0x00000002,
    WGPUCreatePipelineAsyncStatus_DeviceLost = 0x00000003,
    WGPUCreatePipelineAsyncStatus_DeviceDestroyed = 0x00000004,
    WGPUCreatePipelineAsyncStatus_Unknown = 0x00000005,
    WGPUCreatePipelineAsyncStatus_Force32 = 0x7FFFFFFF
  WGPUCullMode* = enum
    WGPUCullMode_None = 0x00000000, WGPUCullMode_Front = 0x00000001,
    WGPUCullMode_Back = 0x00000002, WGPUCullMode_Force32 = 0x7FFFFFFF
  WGPUDeviceLostReason* = enum
    WGPUDeviceLostReason_Undefined = 0x00000000,
    WGPUDeviceLostReason_Destroyed = 0x00000001,
    WGPUDeviceLostReason_Force32 = 0x7FFFFFFF
  WGPUErrorFilter* = enum
    WGPUErrorFilter_Validation = 0x00000000,
    WGPUErrorFilter_OutOfMemory = 0x00000001,
    WGPUErrorFilter_Internal = 0x00000002, WGPUErrorFilter_Force32 = 0x7FFFFFFF
  WGPUErrorType* = enum
    WGPUErrorType_NoError = 0x00000000, WGPUErrorType_Validation = 0x00000001,
    WGPUErrorType_OutOfMemory = 0x00000002, WGPUErrorType_Internal = 0x00000003,
    WGPUErrorType_Unknown = 0x00000004, WGPUErrorType_DeviceLost = 0x00000005,
    WGPUErrorType_Force32 = 0x7FFFFFFF
  WGPUFeatureName* = enum
    WGPUFeatureName_Undefined = 0x00000000,
    WGPUFeatureName_DepthClipControl = 0x00000001,
    WGPUFeatureName_Depth32FloatStencil8 = 0x00000002,
    WGPUFeatureName_TimestampQuery = 0x00000003,
    WGPUFeatureName_PipelineStatisticsQuery = 0x00000004,
    WGPUFeatureName_TextureCompressionBC = 0x00000005,
    WGPUFeatureName_TextureCompressionETC2 = 0x00000006,
    WGPUFeatureName_TextureCompressionASTC = 0x00000007,
    WGPUFeatureName_IndirectFirstInstance = 0x00000008,
    WGPUFeatureName_ShaderF16 = 0x00000009,
    WGPUFeatureName_RG11B10UfloatRenderable = 0x0000000A,
    WGPUFeatureName_BGRA8UnormStorage = 0x0000000B,
    WGPUFeatureName_Force32 = 0x7FFFFFFF
  WGPUFilterMode* = enum
    WGPUFilterMode_Nearest = 0x00000000, WGPUFilterMode_Linear = 0x00000001,
    WGPUFilterMode_Force32 = 0x7FFFFFFF
  WGPUFrontFace* = enum
    WGPUFrontFace_CCW = 0x00000000, WGPUFrontFace_CW = 0x00000001,
    WGPUFrontFace_Force32 = 0x7FFFFFFF
  WGPUIndexFormat* = enum
    WGPUIndexFormat_Undefined = 0x00000000, WGPUIndexFormat_Uint16 = 0x00000001,
    WGPUIndexFormat_Uint32 = 0x00000002, WGPUIndexFormat_Force32 = 0x7FFFFFFF
  WGPULoadOp* = enum
    WGPULoadOp_Undefined = 0x00000000, WGPULoadOp_Clear = 0x00000001,
    WGPULoadOp_Load = 0x00000002, WGPULoadOp_Force32 = 0x7FFFFFFF
  WGPUMipmapFilterMode* = enum
    WGPUMipmapFilterMode_Nearest = 0x00000000,
    WGPUMipmapFilterMode_Linear = 0x00000001,
    WGPUMipmapFilterMode_Force32 = 0x7FFFFFFF
  WGPUPipelineStatisticName* = enum
    WGPUPipelineStatisticName_VertexShaderInvocations = 0x00000000,
    WGPUPipelineStatisticName_ClipperInvocations = 0x00000001,
    WGPUPipelineStatisticName_ClipperPrimitivesOut = 0x00000002,
    WGPUPipelineStatisticName_FragmentShaderInvocations = 0x00000003,
    WGPUPipelineStatisticName_ComputeShaderInvocations = 0x00000004,
    WGPUPipelineStatisticName_Force32 = 0x7FFFFFFF
  WGPUPowerPreference* = enum
    WGPUPowerPreference_Undefined = 0x00000000,
    WGPUPowerPreference_LowPower = 0x00000001,
    WGPUPowerPreference_HighPerformance = 0x00000002,
    WGPUPowerPreference_Force32 = 0x7FFFFFFF
  WGPUPresentMode* = enum
    WGPUPresentMode_Immediate = 0x00000000,
    WGPUPresentMode_Mailbox = 0x00000001, WGPUPresentMode_Fifo = 0x00000002,
    WGPUPresentMode_Force32 = 0x7FFFFFFF
  WGPUPrimitiveTopology* = enum
    WGPUPrimitiveTopology_PointList = 0x00000000,
    WGPUPrimitiveTopology_LineList = 0x00000001,
    WGPUPrimitiveTopology_LineStrip = 0x00000002,
    WGPUPrimitiveTopology_TriangleList = 0x00000003,
    WGPUPrimitiveTopology_TriangleStrip = 0x00000004,
    WGPUPrimitiveTopology_Force32 = 0x7FFFFFFF
  WGPUQueryType* = enum
    WGPUQueryType_Occlusion = 0x00000000,
    WGPUQueryType_PipelineStatistics = 0x00000001,
    WGPUQueryType_Timestamp = 0x00000002, WGPUQueryType_Force32 = 0x7FFFFFFF
  WGPUQueueWorkDoneStatus* = enum
    WGPUQueueWorkDoneStatus_Success = 0x00000000,
    WGPUQueueWorkDoneStatus_Error = 0x00000001,
    WGPUQueueWorkDoneStatus_Unknown = 0x00000002,
    WGPUQueueWorkDoneStatus_DeviceLost = 0x00000003,
    WGPUQueueWorkDoneStatus_Force32 = 0x7FFFFFFF
  WGPURenderPassTimestampLocation* = enum
    WGPURenderPassTimestampLocation_Beginning = 0x00000000,
    WGPURenderPassTimestampLocation_End = 0x00000001,
    WGPURenderPassTimestampLocation_Force32 = 0x7FFFFFFF
  WGPURequestAdapterStatus* = enum
    WGPURequestAdapterStatus_Success = 0x00000000,
    WGPURequestAdapterStatus_Unavailable = 0x00000001,
    WGPURequestAdapterStatus_Error = 0x00000002,
    WGPURequestAdapterStatus_Unknown = 0x00000003,
    WGPURequestAdapterStatus_Force32 = 0x7FFFFFFF
  WGPURequestDeviceStatus* = enum
    WGPURequestDeviceStatus_Success = 0x00000000,
    WGPURequestDeviceStatus_Error = 0x00000001,
    WGPURequestDeviceStatus_Unknown = 0x00000002,
    WGPURequestDeviceStatus_Force32 = 0x7FFFFFFF
  WGPUSType* = enum
    WGPUSType_Invalid = 0x00000000,
    WGPUSType_SurfaceDescriptorFromMetalLayer = 0x00000001,
    WGPUSType_SurfaceDescriptorFromWindowsHWND = 0x00000002,
    WGPUSType_SurfaceDescriptorFromXlibWindow = 0x00000003,
    WGPUSType_SurfaceDescriptorFromCanvasHTMLSelector = 0x00000004,
    WGPUSType_ShaderModuleSPIRVDescriptor = 0x00000005,
    WGPUSType_ShaderModuleWGSLDescriptor = 0x00000006,
    WGPUSType_PrimitiveDepthClipControl = 0x00000007,
    WGPUSType_SurfaceDescriptorFromWaylandSurface = 0x00000008,
    WGPUSType_SurfaceDescriptorFromAndroidNativeWindow = 0x00000009,
    WGPUSType_SurfaceDescriptorFromXcbWindow = 0x0000000A,
    WGPUSType_RenderPassDescriptorMaxDrawCount = 0x0000000F,
    WGPUSType_Force32 = 0x7FFFFFFF
  WGPUSamplerBindingType* = enum
    WGPUSamplerBindingType_Undefined = 0x00000000,
    WGPUSamplerBindingType_Filtering = 0x00000001,
    WGPUSamplerBindingType_NonFiltering = 0x00000002,
    WGPUSamplerBindingType_Comparison = 0x00000003,
    WGPUSamplerBindingType_Force32 = 0x7FFFFFFF
  WGPUStencilOperation* = enum
    WGPUStencilOperation_Keep = 0x00000000,
    WGPUStencilOperation_Zero = 0x00000001,
    WGPUStencilOperation_Replace = 0x00000002,
    WGPUStencilOperation_Invert = 0x00000003,
    WGPUStencilOperation_IncrementClamp = 0x00000004,
    WGPUStencilOperation_DecrementClamp = 0x00000005,
    WGPUStencilOperation_IncrementWrap = 0x00000006,
    WGPUStencilOperation_DecrementWrap = 0x00000007,
    WGPUStencilOperation_Force32 = 0x7FFFFFFF
  WGPUStorageTextureAccess* = enum
    WGPUStorageTextureAccess_Undefined = 0x00000000,
    WGPUStorageTextureAccess_WriteOnly = 0x00000001,
    WGPUStorageTextureAccess_Force32 = 0x7FFFFFFF
  WGPUStoreOp* = enum
    WGPUStoreOp_Undefined = 0x00000000, WGPUStoreOp_Store = 0x00000001,
    WGPUStoreOp_Discard = 0x00000002, WGPUStoreOp_Force32 = 0x7FFFFFFF
  WGPUTextureAspect* = enum
    WGPUTextureAspect_All = 0x00000000,
    WGPUTextureAspect_StencilOnly = 0x00000001,
    WGPUTextureAspect_DepthOnly = 0x00000002,
    WGPUTextureAspect_Force32 = 0x7FFFFFFF
  WGPUTextureComponentType* = enum
    WGPUTextureComponentType_Float = 0x00000000,
    WGPUTextureComponentType_Sint = 0x00000001,
    WGPUTextureComponentType_Uint = 0x00000002,
    WGPUTextureComponentType_DepthComparison = 0x00000003,
    WGPUTextureComponentType_Force32 = 0x7FFFFFFF
  WGPUTextureDimension* = enum
    WGPUTextureDimension_1D = 0x00000000, WGPUTextureDimension_2D = 0x00000001,
    WGPUTextureDimension_3D = 0x00000002,
    WGPUTextureDimension_Force32 = 0x7FFFFFFF
  WGPUTextureFormat* = enum
    WGPUTextureFormat_Undefined = 0x00000000,
    WGPUTextureFormat_R8Unorm = 0x00000001,
    WGPUTextureFormat_R8Snorm = 0x00000002,
    WGPUTextureFormat_R8Uint = 0x00000003,
    WGPUTextureFormat_R8Sint = 0x00000004,
    WGPUTextureFormat_R16Uint = 0x00000005,
    WGPUTextureFormat_R16Sint = 0x00000006,
    WGPUTextureFormat_R16Float = 0x00000007,
    WGPUTextureFormat_RG8Unorm = 0x00000008,
    WGPUTextureFormat_RG8Snorm = 0x00000009,
    WGPUTextureFormat_RG8Uint = 0x0000000A,
    WGPUTextureFormat_RG8Sint = 0x0000000B,
    WGPUTextureFormat_R32Float = 0x0000000C,
    WGPUTextureFormat_R32Uint = 0x0000000D,
    WGPUTextureFormat_R32Sint = 0x0000000E,
    WGPUTextureFormat_RG16Uint = 0x0000000F,
    WGPUTextureFormat_RG16Sint = 0x00000010,
    WGPUTextureFormat_RG16Float = 0x00000011,
    WGPUTextureFormat_RGBA8Unorm = 0x00000012,
    WGPUTextureFormat_RGBA8UnormSrgb = 0x00000013,
    WGPUTextureFormat_RGBA8Snorm = 0x00000014,
    WGPUTextureFormat_RGBA8Uint = 0x00000015,
    WGPUTextureFormat_RGBA8Sint = 0x00000016,
    WGPUTextureFormat_BGRA8Unorm = 0x00000017,
    WGPUTextureFormat_BGRA8UnormSrgb = 0x00000018,
    WGPUTextureFormat_RGB10A2Unorm = 0x00000019,
    WGPUTextureFormat_RG11B10Ufloat = 0x0000001A,
    WGPUTextureFormat_RGB9E5Ufloat = 0x0000001B,
    WGPUTextureFormat_RG32Float = 0x0000001C,
    WGPUTextureFormat_RG32Uint = 0x0000001D,
    WGPUTextureFormat_RG32Sint = 0x0000001E,
    WGPUTextureFormat_RGBA16Uint = 0x0000001F,
    WGPUTextureFormat_RGBA16Sint = 0x00000020,
    WGPUTextureFormat_RGBA16Float = 0x00000021,
    WGPUTextureFormat_RGBA32Float = 0x00000022,
    WGPUTextureFormat_RGBA32Uint = 0x00000023,
    WGPUTextureFormat_RGBA32Sint = 0x00000024,
    WGPUTextureFormat_Stencil8 = 0x00000025,
    WGPUTextureFormat_Depth16Unorm = 0x00000026,
    WGPUTextureFormat_Depth24Plus = 0x00000027,
    WGPUTextureFormat_Depth24PlusStencil8 = 0x00000028,
    WGPUTextureFormat_Depth32Float = 0x00000029,
    WGPUTextureFormat_Depth32FloatStencil8 = 0x0000002A,
    WGPUTextureFormat_BC1RGBAUnorm = 0x0000002B,
    WGPUTextureFormat_BC1RGBAUnormSrgb = 0x0000002C,
    WGPUTextureFormat_BC2RGBAUnorm = 0x0000002D,
    WGPUTextureFormat_BC2RGBAUnormSrgb = 0x0000002E,
    WGPUTextureFormat_BC3RGBAUnorm = 0x0000002F,
    WGPUTextureFormat_BC3RGBAUnormSrgb = 0x00000030,
    WGPUTextureFormat_BC4RUnorm = 0x00000031,
    WGPUTextureFormat_BC4RSnorm = 0x00000032,
    WGPUTextureFormat_BC5RGUnorm = 0x00000033,
    WGPUTextureFormat_BC5RGSnorm = 0x00000034,
    WGPUTextureFormat_BC6HRGBUfloat = 0x00000035,
    WGPUTextureFormat_BC6HRGBFloat = 0x00000036,
    WGPUTextureFormat_BC7RGBAUnorm = 0x00000037,
    WGPUTextureFormat_BC7RGBAUnormSrgb = 0x00000038,
    WGPUTextureFormat_ETC2RGB8Unorm = 0x00000039,
    WGPUTextureFormat_ETC2RGB8UnormSrgb = 0x0000003A,
    WGPUTextureFormat_ETC2RGB8A1Unorm = 0x0000003B,
    WGPUTextureFormat_ETC2RGB8A1UnormSrgb = 0x0000003C,
    WGPUTextureFormat_ETC2RGBA8Unorm = 0x0000003D,
    WGPUTextureFormat_ETC2RGBA8UnormSrgb = 0x0000003E,
    WGPUTextureFormat_EACR11Unorm = 0x0000003F,
    WGPUTextureFormat_EACR11Snorm = 0x00000040,
    WGPUTextureFormat_EACRG11Unorm = 0x00000041,
    WGPUTextureFormat_EACRG11Snorm = 0x00000042,
    WGPUTextureFormat_ASTC4x4Unorm = 0x00000043,
    WGPUTextureFormat_ASTC4x4UnormSrgb = 0x00000044,
    WGPUTextureFormat_ASTC5x4Unorm = 0x00000045,
    WGPUTextureFormat_ASTC5x4UnormSrgb = 0x00000046,
    WGPUTextureFormat_ASTC5x5Unorm = 0x00000047,
    WGPUTextureFormat_ASTC5x5UnormSrgb = 0x00000048,
    WGPUTextureFormat_ASTC6x5Unorm = 0x00000049,
    WGPUTextureFormat_ASTC6x5UnormSrgb = 0x0000004A,
    WGPUTextureFormat_ASTC6x6Unorm = 0x0000004B,
    WGPUTextureFormat_ASTC6x6UnormSrgb = 0x0000004C,
    WGPUTextureFormat_ASTC8x5Unorm = 0x0000004D,
    WGPUTextureFormat_ASTC8x5UnormSrgb = 0x0000004E,
    WGPUTextureFormat_ASTC8x6Unorm = 0x0000004F,
    WGPUTextureFormat_ASTC8x6UnormSrgb = 0x00000050,
    WGPUTextureFormat_ASTC8x8Unorm = 0x00000051,
    WGPUTextureFormat_ASTC8x8UnormSrgb = 0x00000052,
    WGPUTextureFormat_ASTC10x5Unorm = 0x00000053,
    WGPUTextureFormat_ASTC10x5UnormSrgb = 0x00000054,
    WGPUTextureFormat_ASTC10x6Unorm = 0x00000055,
    WGPUTextureFormat_ASTC10x6UnormSrgb = 0x00000056,
    WGPUTextureFormat_ASTC10x8Unorm = 0x00000057,
    WGPUTextureFormat_ASTC10x8UnormSrgb = 0x00000058,
    WGPUTextureFormat_ASTC10x10Unorm = 0x00000059,
    WGPUTextureFormat_ASTC10x10UnormSrgb = 0x0000005A,
    WGPUTextureFormat_ASTC12x10Unorm = 0x0000005B,
    WGPUTextureFormat_ASTC12x10UnormSrgb = 0x0000005C,
    WGPUTextureFormat_ASTC12x12Unorm = 0x0000005D,
    WGPUTextureFormat_ASTC12x12UnormSrgb = 0x0000005E,
    WGPUTextureFormat_Force32 = 0x7FFFFFFF
  WGPUTextureSampleType* = enum
    WGPUTextureSampleType_Undefined = 0x00000000,
    WGPUTextureSampleType_Float = 0x00000001,
    WGPUTextureSampleType_UnfilterableFloat = 0x00000002,
    WGPUTextureSampleType_Depth = 0x00000003,
    WGPUTextureSampleType_Sint = 0x00000004,
    WGPUTextureSampleType_Uint = 0x00000005,
    WGPUTextureSampleType_Force32 = 0x7FFFFFFF
  WGPUTextureViewDimension* = enum
    WGPUTextureViewDimension_Undefined = 0x00000000,
    WGPUTextureViewDimension_1D = 0x00000001,
    WGPUTextureViewDimension_2D = 0x00000002,
    WGPUTextureViewDimension_2DArray = 0x00000003,
    WGPUTextureViewDimension_Cube = 0x00000004,
    WGPUTextureViewDimension_CubeArray = 0x00000005,
    WGPUTextureViewDimension_3D = 0x00000006,
    WGPUTextureViewDimension_Force32 = 0x7FFFFFFF
  WGPUVertexFormat* = enum
    WGPUVertexFormat_Undefined = 0x00000000,
    WGPUVertexFormat_Uint8x2 = 0x00000001,
    WGPUVertexFormat_Uint8x4 = 0x00000002,
    WGPUVertexFormat_Sint8x2 = 0x00000003,
    WGPUVertexFormat_Sint8x4 = 0x00000004,
    WGPUVertexFormat_Unorm8x2 = 0x00000005,
    WGPUVertexFormat_Unorm8x4 = 0x00000006,
    WGPUVertexFormat_Snorm8x2 = 0x00000007,
    WGPUVertexFormat_Snorm8x4 = 0x00000008,
    WGPUVertexFormat_Uint16x2 = 0x00000009,
    WGPUVertexFormat_Uint16x4 = 0x0000000A,
    WGPUVertexFormat_Sint16x2 = 0x0000000B,
    WGPUVertexFormat_Sint16x4 = 0x0000000C,
    WGPUVertexFormat_Unorm16x2 = 0x0000000D,
    WGPUVertexFormat_Unorm16x4 = 0x0000000E,
    WGPUVertexFormat_Snorm16x2 = 0x0000000F,
    WGPUVertexFormat_Snorm16x4 = 0x00000010,
    WGPUVertexFormat_Float16x2 = 0x00000011,
    WGPUVertexFormat_Float16x4 = 0x00000012,
    WGPUVertexFormat_Float32 = 0x00000013,
    WGPUVertexFormat_Float32x2 = 0x00000014,
    WGPUVertexFormat_Float32x3 = 0x00000015,
    WGPUVertexFormat_Float32x4 = 0x00000016,
    WGPUVertexFormat_Uint32 = 0x00000017,
    WGPUVertexFormat_Uint32x2 = 0x00000018,
    WGPUVertexFormat_Uint32x3 = 0x00000019,
    WGPUVertexFormat_Uint32x4 = 0x0000001A,
    WGPUVertexFormat_Sint32 = 0x0000001B,
    WGPUVertexFormat_Sint32x2 = 0x0000001C,
    WGPUVertexFormat_Sint32x3 = 0x0000001D,
    WGPUVertexFormat_Sint32x4 = 0x0000001E,
    WGPUVertexFormat_Force32 = 0x7FFFFFFF
  WGPUVertexStepMode* = enum
    WGPUVertexStepMode_Vertex = 0x00000000,
    WGPUVertexStepMode_Instance = 0x00000001,
    WGPUVertexStepMode_VertexBufferNotUsed = 0x00000002,
    WGPUVertexStepMode_Force32 = 0x7FFFFFFF
  WGPUBufferUsage* = enum
    WGPUBufferUsage_None = 0x00000000, WGPUBufferUsage_MapRead = 0x00000001,
    WGPUBufferUsage_MapWrite = 0x00000002, WGPUBufferUsage_CopySrc = 0x00000004,
    WGPUBufferUsage_CopyDst = 0x00000008, WGPUBufferUsage_Index = 0x00000010,
    WGPUBufferUsage_Vertex = 0x00000020, WGPUBufferUsage_Uniform = 0x00000040,
    WGPUBufferUsage_Storage = 0x00000080, WGPUBufferUsage_Indirect = 0x00000100,
    WGPUBufferUsage_QueryResolve = 0x00000200,
    WGPUBufferUsage_Force32 = 0x7FFFFFFF
  WGPUBufferUsageFlags* = WGPUFlags
  WGPUColorWriteMask* = enum
    WGPUColorWriteMask_None = 0x00000000, WGPUColorWriteMask_Red = 0x00000001,
    WGPUColorWriteMask_Green = 0x00000002, WGPUColorWriteMask_Blue = 0x00000004,
    WGPUColorWriteMask_Alpha = 0x00000008, WGPUColorWriteMask_All = 0x0000000F,
    WGPUColorWriteMask_Force32 = 0x7FFFFFFF
  WGPUColorWriteMaskFlags* = WGPUFlags
  WGPUMapMode* = enum
    WGPUMapMode_None = 0x00000000, WGPUMapMode_Read = 0x00000001,
    WGPUMapMode_Write = 0x00000002, WGPUMapMode_Force32 = 0x7FFFFFFF
  WGPUMapModeFlags* = WGPUFlags
  WGPUShaderStage* = enum
    WGPUShaderStage_None = 0x00000000, WGPUShaderStage_Vertex = 0x00000001,
    WGPUShaderStage_Fragment = 0x00000002, WGPUShaderStage_Compute = 0x00000004,
    WGPUShaderStage_Force32 = 0x7FFFFFFF
  WGPUShaderStageFlags* = WGPUFlags
  WGPUTextureUsage* = enum
    WGPUTextureUsage_None = 0x00000000, WGPUTextureUsage_CopySrc = 0x00000001,
    WGPUTextureUsage_CopyDst = 0x00000002,
    WGPUTextureUsage_TextureBinding = 0x00000004,
    WGPUTextureUsage_StorageBinding = 0x00000008,
    WGPUTextureUsage_RenderAttachment = 0x00000010,
    WGPUTextureUsage_Force32 = 0x7FFFFFFF
  WGPUTextureUsageFlags* = WGPUFlags
  WGPUChainedStruct* {.bycopy.} = object
    next*: ptr WGPUChainedStruct
    sType*: WGPUSType

  WGPUChainedStructOut* {.bycopy.} = object
    next*: ptr WGPUChainedStructOut
    sType*: WGPUSType

  WGPUAdapterProperties* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStructOut
    vendorID*: uint32
    vendorName*: cstring
    architecture*: cstring
    deviceID*: uint32
    name*: cstring
    driverDescription*: cstring
    adapterType*: WGPUAdapterType
    backendType*: WGPUBackendType

  WGPUBindGroupEntry* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    binding*: uint32
    buffer*: WGPUBuffer
    ##  nullable
    offset*: uint64
    size*: uint64
    sampler*: WGPUSampler
    ##  nullable
    textureView*: WGPUTextureView
    ##  nullable

  WGPUBlendComponent* {.bycopy.} = object
    operation*: WGPUBlendOperation
    srcFactor*: WGPUBlendFactor
    dstFactor*: WGPUBlendFactor

  WGPUBufferBindingLayout* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    `type`*: WGPUBufferBindingType
    hasDynamicOffset*: bool
    minBindingSize*: uint64

  WGPUBufferDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring
    ##  nullable
    usage*: WGPUBufferUsageFlags
    size*: uint64
    mappedAtCreation*: bool

  WGPUColor* {.bycopy.} = object
    r*: cdouble
    g*: cdouble
    b*: cdouble
    a*: cdouble

  WGPUCommandBufferDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring
    ##  nullable

  WGPUCommandEncoderDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring
    ##  nullable

  WGPUCompilationMessage* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    message*: cstring
    ##  nullable
    `type`*: WGPUCompilationMessageType
    lineNum*: uint64
    linePos*: uint64
    offset*: uint64
    length*: uint64
    utf16LinePos*: uint64
    utf16Offset*: uint64
    utf16Length*: uint64

  WGPUComputePassTimestampWrite* {.bycopy.} = object
    querySet*: WGPUQuerySet
    queryIndex*: uint32
    location*: WGPUComputePassTimestampLocation

  WGPUConstantEntry* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    key*: cstring
    value*: cdouble

  WGPUExtent3D* {.bycopy.} = object
    width*: uint32
    height*: uint32
    depthOrArrayLayers*: uint32

  WGPUInstanceDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct

  WGPULimits* {.bycopy.} = object
    maxTextureDimension1D*: uint32
    maxTextureDimension2D*: uint32
    maxTextureDimension3D*: uint32
    maxTextureArrayLayers*: uint32
    maxBindGroups*: uint32
    maxBindingsPerBindGroup*: uint32
    maxDynamicUniformBuffersPerPipelineLayout*: uint32
    maxDynamicStorageBuffersPerPipelineLayout*: uint32
    maxSampledTexturesPerShaderStage*: uint32
    maxSamplersPerShaderStage*: uint32
    maxStorageBuffersPerShaderStage*: uint32
    maxStorageTexturesPerShaderStage*: uint32
    maxUniformBuffersPerShaderStage*: uint32
    maxUniformBufferBindingSize*: uint64
    maxStorageBufferBindingSize*: uint64
    minUniformBufferOffsetAlignment*: uint32
    minStorageBufferOffsetAlignment*: uint32
    maxVertexBuffers*: uint32
    maxBufferSize*: uint64
    maxVertexAttributes*: uint32
    maxVertexBufferArrayStride*: uint32
    maxInterStageShaderComponents*: uint32
    maxInterStageShaderVariables*: uint32
    maxColorAttachments*: uint32
    maxColorAttachmentBytesPerSample*: uint32
    maxComputeWorkgroupStorageSize*: uint32
    maxComputeInvocationsPerWorkgroup*: uint32
    maxComputeWorkgroupSizeX*: uint32
    maxComputeWorkgroupSizeY*: uint32
    maxComputeWorkgroupSizeZ*: uint32
    maxComputeWorkgroupsPerDimension*: uint32

  WGPUMultisampleState* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    count*: uint32
    mask*: uint32
    alphaToCoverageEnabled*: bool

  WGPUOrigin3D* {.bycopy.} = object
    x*: uint32
    y*: uint32
    z*: uint32

  WGPUPipelineLayoutDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring
    ##  nullable
    bindGroupLayoutCount*: uint32
    bindGroupLayouts*: ptr WGPUBindGroupLayout




















































##  Can be chained in WGPUPrimitiveState

type
  WGPUPrimitiveDepthClipControl* {.bycopy.} = object
    chain*: WGPUChainedStruct
    unclippedDepth*: bool

  WGPUPrimitiveState* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    topology*: WGPUPrimitiveTopology
    stripIndexFormat*: WGPUIndexFormat
    frontFace*: WGPUFrontFace
    cullMode*: WGPUCullMode

  WGPUQuerySetDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring
    ##  nullable
    `type`*: WGPUQueryType
    count*: uint32
    pipelineStatistics*: ptr WGPUPipelineStatisticName
    pipelineStatisticsCount*: uint32

  WGPUQueueDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring
    ##  nullable

  WGPURenderBundleDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring
    ##  nullable

  WGPURenderBundleEncoderDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring
    ##  nullable
    colorFormatsCount*: uint32
    colorFormats*: ptr WGPUTextureFormat
    depthStencilFormat*: WGPUTextureFormat
    sampleCount*: uint32
    depthReadOnly*: bool
    stencilReadOnly*: bool

  WGPURenderPassDepthStencilAttachment* {.bycopy.} = object
    view*: WGPUTextureView
    depthLoadOp*: WGPULoadOp
    depthStoreOp*: WGPUStoreOp
    depthClearValue*: cfloat
    depthReadOnly*: bool
    stencilLoadOp*: WGPULoadOp
    stencilStoreOp*: WGPUStoreOp
    stencilClearValue*: uint32
    stencilReadOnly*: bool


##  Can be chained in WGPURenderPassDescriptor

type
  WGPURenderPassDescriptorMaxDrawCount* {.bycopy.} = object
    chain*: WGPUChainedStruct
    maxDrawCount*: uint64

  WGPURenderPassTimestampWrite* {.bycopy.} = object
    querySet*: WGPUQuerySet
    queryIndex*: uint32
    location*: WGPURenderPassTimestampLocation

  WGPURequestAdapterOptions* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    compatibleSurface*: WGPUSurface
    ##  nullable
    powerPreference*: WGPUPowerPreference
    forceFallbackAdapter*: bool

  WGPUSamplerBindingLayout* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    `type`*: WGPUSamplerBindingType

  WGPUSamplerDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring
    ##  nullable
    addressModeU*: WGPUAddressMode
    addressModeV*: WGPUAddressMode
    addressModeW*: WGPUAddressMode
    magFilter*: WGPUFilterMode
    minFilter*: WGPUFilterMode
    mipmapFilter*: WGPUMipmapFilterMode
    lodMinClamp*: cfloat
    lodMaxClamp*: cfloat
    compare*: WGPUCompareFunction
    maxAnisotropy*: uint16

  WGPUShaderModuleCompilationHint* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    entryPoint*: cstring
    layout*: WGPUPipelineLayout


##  Can be chained in WGPUShaderModuleDescriptor

type
  WGPUShaderModuleSPIRVDescriptor* {.bycopy.} = object
    chain*: WGPUChainedStruct
    codeSize*: uint32
    code*: ptr uint32


##  Can be chained in WGPUShaderModuleDescriptor

type
  WGPUShaderModuleWGSLDescriptor* {.bycopy.} = object
    chain*: WGPUChainedStruct
    code*: cstring

  WGPUStencilFaceState* {.bycopy.} = object
    compare*: WGPUCompareFunction
    failOp*: WGPUStencilOperation
    depthFailOp*: WGPUStencilOperation
    passOp*: WGPUStencilOperation

  WGPUStorageTextureBindingLayout* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    access*: WGPUStorageTextureAccess
    format*: WGPUTextureFormat
    viewDimension*: WGPUTextureViewDimension

  WGPUSurfaceDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring
    ##  nullable


##  Can be chained in WGPUSurfaceDescriptor

type
  WGPUSurfaceDescriptorFromAndroidNativeWindow* {.bycopy.} = object
    chain*: WGPUChainedStruct
    window*: pointer


##  Can be chained in WGPUSurfaceDescriptor

type
  WGPUSurfaceDescriptorFromCanvasHTMLSelector* {.bycopy.} = object
    chain*: WGPUChainedStruct
    selector*: cstring


##  Can be chained in WGPUSurfaceDescriptor

type
  WGPUSurfaceDescriptorFromMetalLayer* {.bycopy.} = object
    chain*: WGPUChainedStruct
    layer*: pointer


##  Can be chained in WGPUSurfaceDescriptor

type
  WGPUSurfaceDescriptorFromWaylandSurface* {.bycopy.} = object
    chain*: WGPUChainedStruct
    display*: pointer
    surface*: pointer


##  Can be chained in WGPUSurfaceDescriptor

type
  WGPUSurfaceDescriptorFromWindowsHWND* {.bycopy.} = object
    chain*: WGPUChainedStruct
    hinstance*: pointer
    hwnd*: pointer


##  Can be chained in WGPUSurfaceDescriptor

type
  WGPUSurfaceDescriptorFromXcbWindow* {.bycopy.} = object
    chain*: WGPUChainedStruct
    connection*: pointer
    window*: uint32


##  Can be chained in WGPUSurfaceDescriptor

type
  WGPUSurfaceDescriptorFromXlibWindow* {.bycopy.} = object
    chain*: WGPUChainedStruct
    display*: pointer
    window*: uint32

  WGPUSwapChainDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring
    ##  nullable
    usage*: WGPUTextureUsageFlags
    format*: WGPUTextureFormat
    width*: uint32
    height*: uint32
    presentMode*: WGPUPresentMode

  WGPUTextureBindingLayout* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    sampleType*: WGPUTextureSampleType
    viewDimension*: WGPUTextureViewDimension
    multisampled*: bool

  WGPUTextureDataLayout* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    offset*: uint64
    bytesPerRow*: uint32
    rowsPerImage*: uint32

  WGPUTextureViewDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring
    ##  nullable
    format*: WGPUTextureFormat
    dimension*: WGPUTextureViewDimension
    baseMipLevel*: uint32
    mipLevelCount*: uint32
    baseArrayLayer*: uint32
    arrayLayerCount*: uint32
    aspect*: WGPUTextureAspect

  WGPUVertexAttribute* {.bycopy.} = object
    format*: WGPUVertexFormat
    offset*: uint64
    shaderLocation*: uint32

  WGPUBindGroupDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring
    ##  nullable
    layout*: WGPUBindGroupLayout
    entryCount*: uint32
    entries*: ptr WGPUBindGroupEntry

  WGPUBindGroupLayoutEntry* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    binding*: uint32
    visibility*: WGPUShaderStageFlags
    buffer*: WGPUBufferBindingLayout
    sampler*: WGPUSamplerBindingLayout
    texture*: WGPUTextureBindingLayout
    storageTexture*: WGPUStorageTextureBindingLayout

  WGPUBlendState* {.bycopy.} = object
    color*: WGPUBlendComponent
    alpha*: WGPUBlendComponent

  WGPUCompilationInfo* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    messageCount*: uint32
    messages*: ptr WGPUCompilationMessage

  WGPUComputePassDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring
    ##  nullable
    timestampWriteCount*: uint32
    timestampWrites*: ptr WGPUComputePassTimestampWrite

  WGPUDepthStencilState* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    format*: WGPUTextureFormat
    depthWriteEnabled*: bool
    depthCompare*: WGPUCompareFunction
    stencilFront*: WGPUStencilFaceState
    stencilBack*: WGPUStencilFaceState
    stencilReadMask*: uint32
    stencilWriteMask*: uint32
    depthBias*: int32
    depthBiasSlopeScale*: cfloat
    depthBiasClamp*: cfloat

  WGPUImageCopyBuffer* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    layout*: WGPUTextureDataLayout
    buffer*: WGPUBuffer

  WGPUImageCopyTexture* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    texture*: WGPUTexture
    mipLevel*: uint32
    origin*: WGPUOrigin3D
    aspect*: WGPUTextureAspect

  WGPUProgrammableStageDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    module*: WGPUShaderModule
    entryPoint*: cstring
    constantCount*: uint32
    constants*: ptr WGPUConstantEntry

  WGPURenderPassColorAttachment* {.bycopy.} = object
    view*: WGPUTextureView
    ##  nullable
    resolveTarget*: WGPUTextureView
    ##  nullable
    loadOp*: WGPULoadOp
    storeOp*: WGPUStoreOp
    clearValue*: WGPUColor

  WGPURequiredLimits* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    limits*: WGPULimits

  WGPUShaderModuleDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring
    ##  nullable
    hintCount*: uint32
    hints*: ptr WGPUShaderModuleCompilationHint

  WGPUSupportedLimits* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStructOut
    limits*: WGPULimits

  WGPUTextureDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring
    ##  nullable
    usage*: WGPUTextureUsageFlags
    dimension*: WGPUTextureDimension
    size*: WGPUExtent3D
    format*: WGPUTextureFormat
    mipLevelCount*: uint32
    sampleCount*: uint32
    viewFormatCount*: uint32
    viewFormats*: ptr WGPUTextureFormat

  WGPUVertexBufferLayout* {.bycopy.} = object
    arrayStride*: uint64
    stepMode*: WGPUVertexStepMode
    attributeCount*: uint32
    attributes*: ptr WGPUVertexAttribute

  WGPUBindGroupLayoutDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring
    ##  nullable
    entryCount*: uint32
    entries*: ptr WGPUBindGroupLayoutEntry

  WGPUColorTargetState* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    format*: WGPUTextureFormat
    blend*: ptr WGPUBlendState
    ##  nullable
    writeMask*: WGPUColorWriteMaskFlags

  WGPUComputePipelineDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring
    ##  nullable
    layout*: WGPUPipelineLayout
    ##  nullable
    compute*: WGPUProgrammableStageDescriptor

  WGPUDeviceDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring
    ##  nullable
    requiredFeaturesCount*: uint32
    requiredFeatures*: ptr WGPUFeatureName
    requiredLimits*: ptr WGPURequiredLimits
    ##  nullable
    defaultQueue*: WGPUQueueDescriptor

  WGPURenderPassDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring
    ##  nullable
    colorAttachmentCount*: uint32
    colorAttachments*: ptr WGPURenderPassColorAttachment
    depthStencilAttachment*: ptr WGPURenderPassDepthStencilAttachment
    ##  nullable
    occlusionQuerySet*: WGPUQuerySet
    ##  nullable
    timestampWriteCount*: uint32
    timestampWrites*: ptr WGPURenderPassTimestampWrite

  WGPUVertexState* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    module*: WGPUShaderModule
    entryPoint*: cstring
    constantCount*: uint32
    constants*: ptr WGPUConstantEntry
    bufferCount*: uint32
    buffers*: ptr WGPUVertexBufferLayout

  WGPUFragmentState* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    module*: WGPUShaderModule
    entryPoint*: cstring
    constantCount*: uint32
    constants*: ptr WGPUConstantEntry
    targetCount*: uint32
    targets*: ptr WGPUColorTargetState

  WGPURenderPipelineDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring
    ##  nullable
    layout*: WGPUPipelineLayout
    ##  nullable
    vertex*: WGPUVertexState
    primitive*: WGPUPrimitiveState
    depthStencil*: ptr WGPUDepthStencilState
    ##  nullable
    multisample*: WGPUMultisampleState
    fragment*: ptr WGPUFragmentState
    ##  nullable

  WGPUBufferMapCallback* = proc (status: WGPUBufferMapAsyncStatus;
                                 userdata: pointer)
  WGPUCompilationInfoCallback* = proc (status: WGPUCompilationInfoRequestStatus;
      compilationInfo: ptr WGPUCompilationInfo; userdata: pointer)
  WGPUCreateComputePipelineAsyncCallback* = proc (
      status: WGPUCreatePipelineAsyncStatus; pipeline: WGPUComputePipeline;
      message: cstring; userdata: pointer)
  WGPUCreateRenderPipelineAsyncCallback* = proc (
      status: WGPUCreatePipelineAsyncStatus; pipeline: WGPURenderPipeline;
      message: cstring; userdata: pointer)
  WGPUDeviceLostCallback* = proc (reason: WGPUDeviceLostReason;
                                  message: cstring; userdata: pointer)
  WGPUErrorCallback* = proc (`type`: WGPUErrorType; message: cstring;
                             userdata: pointer)
  WGPUProc* = proc ()
  WGPUQueueWorkDoneCallback* = proc (status: WGPUQueueWorkDoneStatus;
                                     userdata: pointer)
  WGPURequestAdapterCallback* = proc (status: WGPURequestAdapterStatus;
                                      adapter: WGPUAdapter; message: cstring;
                                      userdata: pointer)
  WGPURequestDeviceCallback* = proc (status: WGPURequestDeviceStatus;
                                     device: WGPUDevice; message: cstring;
                                     userdata: pointer)

when not defined(WGPU_SKIP_PROCS):
  type
    WGPUProcCreateInstance* = proc (descriptor: ptr WGPUInstanceDescriptor): WGPUInstance
    WGPUProcGetProcAddress* = proc (device: WGPUDevice; procName: cstring): WGPUProc
  ##  Procs of Adapter
  type
    WGPUProcAdapterEnumerateFeatures* = proc (adapter: WGPUAdapter;
        features: ptr WGPUFeatureName): csize_t
    WGPUProcAdapterGetLimits* = proc (adapter: WGPUAdapter;
                                      limits: ptr WGPUSupportedLimits): bool
    WGPUProcAdapterGetProperties* = proc (adapter: WGPUAdapter;
        properties: ptr WGPUAdapterProperties)
    WGPUProcAdapterHasFeature* = proc (adapter: WGPUAdapter;
                                       feature: WGPUFeatureName): bool
    WGPUProcAdapterRequestDevice* = proc (adapter: WGPUAdapter; descriptor: ptr WGPUDeviceDescriptor; ##  nullable
        callback: WGPURequestDeviceCallback; userdata: pointer)
  ##  Procs of BindGroup
  type
    WGPUProcBindGroupSetLabel* = proc (bindGroup: WGPUBindGroup; label: cstring)
  ##  Procs of BindGroupLayout
  type
    WGPUProcBindGroupLayoutSetLabel* = proc (
        bindGroupLayout: WGPUBindGroupLayout; label: cstring)
  ##  Procs of Buffer
  type
    WGPUProcBufferDestroy* = proc (buffer: WGPUBuffer)
    WGPUProcBufferGetConstMappedRange* = proc (buffer: WGPUBuffer;
        offset: csize_t; size: csize_t)
    WGPUProcBufferGetMapState* = proc (buffer: WGPUBuffer): WGPUBufferMapState
    WGPUProcBufferGetMappedRange* = proc (buffer: WGPUBuffer; offset: csize_t;
        size: csize_t): pointer
    WGPUProcBufferGetSize* = proc (buffer: WGPUBuffer): uint64
    WGPUProcBufferGetUsage* = proc (buffer: WGPUBuffer): WGPUBufferUsage
    WGPUProcBufferMapAsync* = proc (buffer: WGPUBuffer; mode: WGPUMapModeFlags;
                                    offset: csize_t; size: csize_t;
                                    callback: WGPUBufferMapCallback;
                                    userdata: pointer)
    WGPUProcBufferSetLabel* = proc (buffer: WGPUBuffer; label: cstring)
    WGPUProcBufferUnmap* = proc (buffer: WGPUBuffer)
  ##  Procs of CommandBuffer
  type
    WGPUProcCommandBufferSetLabel* = proc (commandBuffer: WGPUCommandBuffer;
        label: cstring)
  ##  Procs of CommandEncoder
  type
    WGPUProcCommandEncoderBeginComputePass* = proc (
        commandEncoder: WGPUCommandEncoder; descriptor: ptr WGPUComputePassDescriptor): WGPUComputePassEncoder ##  nullable
    WGPUProcCommandEncoderBeginRenderPass* = proc (
        commandEncoder: WGPUCommandEncoder;
        descriptor: ptr WGPURenderPassDescriptor): WGPURenderPassEncoder
    WGPUProcCommandEncoderClearBuffer* = proc (
        commandEncoder: WGPUCommandEncoder; buffer: WGPUBuffer; offset: uint64;
        size: uint64)
    WGPUProcCommandEncoderCopyBufferToBuffer* = proc (
        commandEncoder: WGPUCommandEncoder; source: WGPUBuffer;
        sourceOffset: uint64; destination: WGPUBuffer;
        destinationOffset: uint64; size: uint64)
    WGPUProcCommandEncoderCopyBufferToTexture* = proc (
        commandEncoder: WGPUCommandEncoder; source: ptr WGPUImageCopyBuffer;
        destination: ptr WGPUImageCopyTexture; copySize: ptr WGPUExtent3D)
    WGPUProcCommandEncoderCopyTextureToBuffer* = proc (
        commandEncoder: WGPUCommandEncoder; source: ptr WGPUImageCopyTexture;
        destination: ptr WGPUImageCopyBuffer; copySize: ptr WGPUExtent3D)
    WGPUProcCommandEncoderCopyTextureToTexture* = proc (
        commandEncoder: WGPUCommandEncoder; source: ptr WGPUImageCopyTexture;
        destination: ptr WGPUImageCopyTexture; copySize: ptr WGPUExtent3D)
    WGPUProcCommandEncoderFinish* = proc (commandEncoder: WGPUCommandEncoder; descriptor: ptr WGPUCommandBufferDescriptor): WGPUCommandBuffer ##  nullable
    WGPUProcCommandEncoderInsertDebugMarker* = proc (
        commandEncoder: WGPUCommandEncoder; markerLabel: cstring)
    WGPUProcCommandEncoderPopDebugGroup* = proc (
        commandEncoder: WGPUCommandEncoder)
    WGPUProcCommandEncoderPushDebugGroup* = proc (
        commandEncoder: WGPUCommandEncoder; groupLabel: cstring)
    WGPUProcCommandEncoderResolveQuerySet* = proc (
        commandEncoder: WGPUCommandEncoder; querySet: WGPUQuerySet;
        firstQuery: uint32; queryCount: uint32; destination: WGPUBuffer;
        destinationOffset: uint64)
    WGPUProcCommandEncoderSetLabel* = proc (commandEncoder: WGPUCommandEncoder;
        label: cstring)
    WGPUProcCommandEncoderWriteTimestamp* = proc (
        commandEncoder: WGPUCommandEncoder; querySet: WGPUQuerySet;
        queryIndex: uint32)
  ##  Procs of ComputePassEncoder
  type
    WGPUProcComputePassEncoderBeginPipelineStatisticsQuery* = proc (
        computePassEncoder: WGPUComputePassEncoder; querySet: WGPUQuerySet;
        queryIndex: uint32)
    WGPUProcComputePassEncoderDispatchWorkgroups* = proc (
        computePassEncoder: WGPUComputePassEncoder; workgroupCountX: uint32;
        workgroupCountY: uint32; workgroupCountZ: uint32)
    WGPUProcComputePassEncoderDispatchWorkgroupsIndirect* = proc (
        computePassEncoder: WGPUComputePassEncoder; indirectBuffer: WGPUBuffer;
        indirectOffset: uint64)
    WGPUProcComputePassEncoderEnd* = proc (
        computePassEncoder: WGPUComputePassEncoder)
    WGPUProcComputePassEncoderEndPipelineStatisticsQuery* = proc (
        computePassEncoder: WGPUComputePassEncoder)
    WGPUProcComputePassEncoderInsertDebugMarker* = proc (
        computePassEncoder: WGPUComputePassEncoder; markerLabel: cstring)
    WGPUProcComputePassEncoderPopDebugGroup* = proc (
        computePassEncoder: WGPUComputePassEncoder)
    WGPUProcComputePassEncoderPushDebugGroup* = proc (
        computePassEncoder: WGPUComputePassEncoder; groupLabel: cstring)
    WGPUProcComputePassEncoderSetBindGroup* = proc (
        computePassEncoder: WGPUComputePassEncoder; groupIndex: uint32;
        group: WGPUBindGroup; dynamicOffsetCount: uint32;
        dynamicOffsets: ptr uint32)
    WGPUProcComputePassEncoderSetLabel* = proc (
        computePassEncoder: WGPUComputePassEncoder; label: cstring)
    WGPUProcComputePassEncoderSetPipeline* = proc (
        computePassEncoder: WGPUComputePassEncoder;
        pipeline: WGPUComputePipeline)
  ##  Procs of ComputePipeline
  type
    WGPUProcComputePipelineGetBindGroupLayout* = proc (
        computePipeline: WGPUComputePipeline; groupIndex: uint32): WGPUBindGroupLayout
    WGPUProcComputePipelineSetLabel* = proc (
        computePipeline: WGPUComputePipeline; label: cstring)
  ##  Procs of Device
  type
    WGPUProcDeviceCreateBindGroup* = proc (device: WGPUDevice;
        descriptor: ptr WGPUBindGroupDescriptor): WGPUBindGroup
    WGPUProcDeviceCreateBindGroupLayout* = proc (device: WGPUDevice;
        descriptor: ptr WGPUBindGroupLayoutDescriptor): WGPUBindGroupLayout
    WGPUProcDeviceCreateBuffer* = proc (device: WGPUDevice;
                                        descriptor: ptr WGPUBufferDescriptor): WGPUBuffer
    WGPUProcDeviceCreateCommandEncoder* = proc (device: WGPUDevice; descriptor: ptr WGPUCommandEncoderDescriptor): WGPUCommandEncoder ##  nullable
    WGPUProcDeviceCreateComputePipeline* = proc (device: WGPUDevice;
        descriptor: ptr WGPUComputePipelineDescriptor): WGPUComputePipeline
    WGPUProcDeviceCreateComputePipelineAsync* = proc (device: WGPUDevice;
        descriptor: ptr WGPUComputePipelineDescriptor;
        callback: WGPUCreateComputePipelineAsyncCallback; userdata: pointer)
    WGPUProcDeviceCreatePipelineLayout* = proc (device: WGPUDevice;
        descriptor: ptr WGPUPipelineLayoutDescriptor): WGPUPipelineLayout
    WGPUProcDeviceCreateQuerySet* = proc (device: WGPUDevice;
        descriptor: ptr WGPUQuerySetDescriptor): WGPUQuerySet
    WGPUProcDeviceCreateRenderBundleEncoder* = proc (device: WGPUDevice;
        descriptor: ptr WGPURenderBundleEncoderDescriptor): WGPURenderBundleEncoder
    WGPUProcDeviceCreateRenderPipeline* = proc (device: WGPUDevice;
        descriptor: ptr WGPURenderPipelineDescriptor): WGPURenderPipeline
    WGPUProcDeviceCreateRenderPipelineAsync* = proc (device: WGPUDevice;
        descriptor: ptr WGPURenderPipelineDescriptor;
        callback: WGPUCreateRenderPipelineAsyncCallback; userdata: pointer)
    WGPUProcDeviceCreateSampler* = proc (device: WGPUDevice; descriptor: ptr WGPUSamplerDescriptor): WGPUSampler ##  nullable
    WGPUProcDeviceCreateShaderModule* = proc (device: WGPUDevice;
        descriptor: ptr WGPUShaderModuleDescriptor): WGPUShaderModule
    WGPUProcDeviceCreateSwapChain* = proc (device: WGPUDevice;
        surface: WGPUSurface; descriptor: ptr WGPUSwapChainDescriptor): WGPUSwapChain
    WGPUProcDeviceCreateTexture* = proc (device: WGPUDevice;
        descriptor: ptr WGPUTextureDescriptor): WGPUTexture
    WGPUProcDeviceDestroy* = proc (device: WGPUDevice)
    WGPUProcDeviceEnumerateFeatures* = proc (device: WGPUDevice;
        features: ptr WGPUFeatureName): csize_t
    WGPUProcDeviceGetLimits* = proc (device: WGPUDevice;
                                     limits: ptr WGPUSupportedLimits): bool
    WGPUProcDeviceGetQueue* = proc (device: WGPUDevice): WGPUQueue
    WGPUProcDeviceHasFeature* = proc (device: WGPUDevice;
                                      feature: WGPUFeatureName): bool
    WGPUProcDevicePopErrorScope* = proc (device: WGPUDevice;
        callback: WGPUErrorCallback; userdata: pointer): bool
    WGPUProcDevicePushErrorScope* = proc (device: WGPUDevice;
        filter: WGPUErrorFilter)
    WGPUProcDeviceSetDeviceLostCallback* = proc (device: WGPUDevice;
        callback: WGPUDeviceLostCallback; userdata: pointer)
    WGPUProcDeviceSetLabel* = proc (device: WGPUDevice; label: cstring)
    WGPUProcDeviceSetUncapturedErrorCallback* = proc (device: WGPUDevice;
        callback: WGPUErrorCallback; userdata: pointer)
  ##  Procs of Instance
  type
    WGPUProcInstanceCreateSurface* = proc (instance: WGPUInstance;
        descriptor: ptr WGPUSurfaceDescriptor): WGPUSurface
    WGPUProcInstanceProcessEvents* = proc (instance: WGPUInstance)
    WGPUProcInstanceRequestAdapter* = proc (instance: WGPUInstance; options: ptr WGPURequestAdapterOptions; ##  nullable
        callback: WGPURequestAdapterCallback; userdata: pointer)
  ##  Procs of PipelineLayout
  type
    WGPUProcPipelineLayoutSetLabel* = proc (pipelineLayout: WGPUPipelineLayout;
        label: cstring)
  ##  Procs of QuerySet
  type
    WGPUProcQuerySetDestroy* = proc (querySet: WGPUQuerySet)
    WGPUProcQuerySetGetCount* = proc (querySet: WGPUQuerySet): uint32
    WGPUProcQuerySetGetType* = proc (querySet: WGPUQuerySet): WGPUQueryType
    WGPUProcQuerySetSetLabel* = proc (querySet: WGPUQuerySet; label: cstring)
  ##  Procs of Queue
  type
    WGPUProcQueueOnSubmittedWorkDone* = proc (queue: WGPUQueue;
        callback: WGPUQueueWorkDoneCallback; userdata: pointer)
    WGPUProcQueueSetLabel* = proc (queue: WGPUQueue; label: cstring)
    WGPUProcQueueSubmit* = proc (queue: WGPUQueue; commandCount: uint32;
                                 commands: ptr WGPUCommandBuffer)
    WGPUProcQueueWriteBuffer* = proc (queue: WGPUQueue; buffer: WGPUBuffer;
                                      bufferOffset: uint64; data: pointer;
                                      size: csize_t)
    WGPUProcQueueWriteTexture* = proc (queue: WGPUQueue;
                                       destination: ptr WGPUImageCopyTexture;
                                       data: pointer; dataSize: csize_t;
                                       dataLayout: ptr WGPUTextureDataLayout;
                                       writeSize: ptr WGPUExtent3D)
  ##  Procs of RenderBundleEncoder
  type
    WGPUProcRenderBundleEncoderDraw* = proc (
        renderBundleEncoder: WGPURenderBundleEncoder; vertexCount: uint32;
        instanceCount: uint32; firstVertex: uint32; firstInstance: uint32)
    WGPUProcRenderBundleEncoderDrawIndexed* = proc (
        renderBundleEncoder: WGPURenderBundleEncoder; indexCount: uint32;
        instanceCount: uint32; firstIndex: uint32; baseVertex: int32;
        firstInstance: uint32)
    WGPUProcRenderBundleEncoderDrawIndexedIndirect* = proc (
        renderBundleEncoder: WGPURenderBundleEncoder;
        indirectBuffer: WGPUBuffer; indirectOffset: uint64)
    WGPUProcRenderBundleEncoderDrawIndirect* = proc (
        renderBundleEncoder: WGPURenderBundleEncoder;
        indirectBuffer: WGPUBuffer; indirectOffset: uint64)
    WGPUProcRenderBundleEncoderFinish* = proc (
        renderBundleEncoder: WGPURenderBundleEncoder; descriptor: ptr WGPURenderBundleDescriptor): WGPURenderBundle ##  nullable
    WGPUProcRenderBundleEncoderInsertDebugMarker* = proc (
        renderBundleEncoder: WGPURenderBundleEncoder; markerLabel: cstring)
    WGPUProcRenderBundleEncoderPopDebugGroup* = proc (
        renderBundleEncoder: WGPURenderBundleEncoder)
    WGPUProcRenderBundleEncoderPushDebugGroup* = proc (
        renderBundleEncoder: WGPURenderBundleEncoder; groupLabel: cstring)
    WGPUProcRenderBundleEncoderSetBindGroup* = proc (
        renderBundleEncoder: WGPURenderBundleEncoder; groupIndex: uint32;
        group: WGPUBindGroup; dynamicOffsetCount: uint32;
        dynamicOffsets: ptr uint32)
    WGPUProcRenderBundleEncoderSetIndexBuffer* = proc (
        renderBundleEncoder: WGPURenderBundleEncoder; buffer: WGPUBuffer;
        format: WGPUIndexFormat; offset: uint64; size: uint64)
    WGPUProcRenderBundleEncoderSetLabel* = proc (
        renderBundleEncoder: WGPURenderBundleEncoder; label: cstring)
    WGPUProcRenderBundleEncoderSetPipeline* = proc (
        renderBundleEncoder: WGPURenderBundleEncoder;
        pipeline: WGPURenderPipeline)
    WGPUProcRenderBundleEncoderSetVertexBuffer* = proc (
        renderBundleEncoder: WGPURenderBundleEncoder; slot: uint32;
        buffer: WGPUBuffer; offset: uint64; size: uint64)
  ##  Procs of RenderPassEncoder
  type
    WGPUProcRenderPassEncoderBeginOcclusionQuery* = proc (
        renderPassEncoder: WGPURenderPassEncoder; queryIndex: uint32)
    WGPUProcRenderPassEncoderBeginPipelineStatisticsQuery* = proc (
        renderPassEncoder: WGPURenderPassEncoder; querySet: WGPUQuerySet;
        queryIndex: uint32)
    WGPUProcRenderPassEncoderDraw* = proc (
        renderPassEncoder: WGPURenderPassEncoder; vertexCount: uint32;
        instanceCount: uint32; firstVertex: uint32; firstInstance: uint32)
    WGPUProcRenderPassEncoderDrawIndexed* = proc (
        renderPassEncoder: WGPURenderPassEncoder; indexCount: uint32;
        instanceCount: uint32; firstIndex: uint32; baseVertex: int32;
        firstInstance: uint32)
    WGPUProcRenderPassEncoderDrawIndexedIndirect* = proc (
        renderPassEncoder: WGPURenderPassEncoder; indirectBuffer: WGPUBuffer;
        indirectOffset: uint64)
    WGPUProcRenderPassEncoderDrawIndirect* = proc (
        renderPassEncoder: WGPURenderPassEncoder; indirectBuffer: WGPUBuffer;
        indirectOffset: uint64)
    WGPUProcRenderPassEncoderEnd* = proc (
        renderPassEncoder: WGPURenderPassEncoder)
    WGPUProcRenderPassEncoderEndOcclusionQuery* = proc (
        renderPassEncoder: WGPURenderPassEncoder)
    WGPUProcRenderPassEncoderEndPipelineStatisticsQuery* = proc (
        renderPassEncoder: WGPURenderPassEncoder)
    WGPUProcRenderPassEncoderExecuteBundles* = proc (
        renderPassEncoder: WGPURenderPassEncoder; bundleCount: uint32;
        bundles: ptr WGPURenderBundle)
    WGPUProcRenderPassEncoderInsertDebugMarker* = proc (
        renderPassEncoder: WGPURenderPassEncoder; markerLabel: cstring)
    WGPUProcRenderPassEncoderPopDebugGroup* = proc (
        renderPassEncoder: WGPURenderPassEncoder)
    WGPUProcRenderPassEncoderPushDebugGroup* = proc (
        renderPassEncoder: WGPURenderPassEncoder; groupLabel: cstring)
    WGPUProcRenderPassEncoderSetBindGroup* = proc (
        renderPassEncoder: WGPURenderPassEncoder; groupIndex: uint32;
        group: WGPUBindGroup; dynamicOffsetCount: uint32;
        dynamicOffsets: ptr uint32)
    WGPUProcRenderPassEncoderSetBlendConstant* = proc (
        renderPassEncoder: WGPURenderPassEncoder; color: ptr WGPUColor)
    WGPUProcRenderPassEncoderSetIndexBuffer* = proc (
        renderPassEncoder: WGPURenderPassEncoder; buffer: WGPUBuffer;
        format: WGPUIndexFormat; offset: uint64; size: uint64)
    WGPUProcRenderPassEncoderSetLabel* = proc (
        renderPassEncoder: WGPURenderPassEncoder; label: cstring)
    WGPUProcRenderPassEncoderSetPipeline* = proc (
        renderPassEncoder: WGPURenderPassEncoder; pipeline: WGPURenderPipeline)
    WGPUProcRenderPassEncoderSetScissorRect* = proc (
        renderPassEncoder: WGPURenderPassEncoder; x: uint32; y: uint32;
        width: uint32; height: uint32)
    WGPUProcRenderPassEncoderSetStencilReference* = proc (
        renderPassEncoder: WGPURenderPassEncoder; reference: uint32)
    WGPUProcRenderPassEncoderSetVertexBuffer* = proc (
        renderPassEncoder: WGPURenderPassEncoder; slot: uint32;
        buffer: WGPUBuffer; offset: uint64; size: uint64)
    WGPUProcRenderPassEncoderSetViewport* = proc (
        renderPassEncoder: WGPURenderPassEncoder; x: cfloat; y: cfloat;
        width: cfloat; height: cfloat; minDepth: cfloat; maxDepth: cfloat)
  ##  Procs of RenderPipeline
  type
    WGPUProcRenderPipelineGetBindGroupLayout* = proc (
        renderPipeline: WGPURenderPipeline; groupIndex: uint32): WGPUBindGroupLayout
    WGPUProcRenderPipelineSetLabel* = proc (renderPipeline: WGPURenderPipeline;
        label: cstring)
  ##  Procs of Sampler
  type
    WGPUProcSamplerSetLabel* = proc (sampler: WGPUSampler; label: cstring)
  ##  Procs of ShaderModule
  type
    WGPUProcShaderModuleGetCompilationInfo* = proc (
        shaderModule: WGPUShaderModule; callback: WGPUCompilationInfoCallback;
        userdata: pointer)
    WGPUProcShaderModuleSetLabel* = proc (shaderModule: WGPUShaderModule;
        label: cstring)
  ##  Procs of Surface
  type
    WGPUProcSurfaceGetPreferredFormat* = proc (surface: WGPUSurface;
        adapter: WGPUAdapter): WGPUTextureFormat
  ##  Procs of SwapChain
  type
    WGPUProcSwapChainGetCurrentTextureView* = proc (swapChain: WGPUSwapChain): WGPUTextureView
    WGPUProcSwapChainPresent* = proc (swapChain: WGPUSwapChain)
  ##  Procs of Texture
  type
    WGPUProcTextureCreateView* = proc (texture: WGPUTexture; descriptor: ptr WGPUTextureViewDescriptor): WGPUTextureView ##  nullable
    WGPUProcTextureDestroy* = proc (texture: WGPUTexture)
    WGPUProcTextureGetDepthOrArrayLayers* = proc (texture: WGPUTexture): uint32
    WGPUProcTextureGetDimension* = proc (texture: WGPUTexture): WGPUTextureDimension
    WGPUProcTextureGetFormat* = proc (texture: WGPUTexture): WGPUTextureFormat
    WGPUProcTextureGetHeight* = proc (texture: WGPUTexture): uint32
    WGPUProcTextureGetMipLevelCount* = proc (texture: WGPUTexture): uint32
    WGPUProcTextureGetSampleCount* = proc (texture: WGPUTexture): uint32
    WGPUProcTextureGetUsage* = proc (texture: WGPUTexture): WGPUTextureUsage
    WGPUProcTextureGetWidth* = proc (texture: WGPUTexture): uint32
    WGPUProcTextureSetLabel* = proc (texture: WGPUTexture; label: cstring)
  ##  Procs of TextureView
  type
    WGPUProcTextureViewSetLabel* = proc (textureView: WGPUTextureView;
        label: cstring)
when not defined(WGPU_SKIP_DECLARATIONS):
  proc wgpuCreateInstance*(descriptor: ptr WGPUInstanceDescriptor): WGPUInstance {.
      importc: "wgpuCreateInstance", clib.}
  proc wgpuGetProcAddress*(device: WGPUDevice; procName: cstring): WGPUProc {.
      importc: "wgpuGetProcAddress", clib.}
  ##  Methods of Adapter
  proc wgpuAdapterEnumerateFeatures*(adapter: WGPUAdapter;
                                     features: ptr WGPUFeatureName): csize_t {.
      importc: "wgpuAdapterEnumerateFeatures", clib.}
  proc wgpuAdapterGetLimits*(adapter: WGPUAdapter;
                             limits: ptr WGPUSupportedLimits): bool {.
      importc: "wgpuAdapterGetLimits", clib.}
  proc wgpuAdapterGetProperties*(adapter: WGPUAdapter;
                                 properties: ptr WGPUAdapterProperties) {.
      importc: "wgpuAdapterGetProperties", clib.}
  proc wgpuAdapterHasFeature*(adapter: WGPUAdapter; feature: WGPUFeatureName): bool {.
      importc: "wgpuAdapterHasFeature", clib.}
  proc wgpuAdapterRequestDevice*(adapter: WGPUAdapter; descriptor: ptr WGPUDeviceDescriptor; ##  nullable
                                 callback: WGPURequestDeviceCallback;
                                 userdata: pointer) {.
      importc: "wgpuAdapterRequestDevice", clib.}
  ##  Methods of BindGroup
  proc wgpuBindGroupSetLabel*(bindGroup: WGPUBindGroup; label: cstring) {.
      importc: "wgpuBindGroupSetLabel", clib.}
  ##  Methods of BindGroupLayout
  proc wgpuBindGroupLayoutSetLabel*(bindGroupLayout: WGPUBindGroupLayout;
                                    label: cstring) {.
      importc: "wgpuBindGroupLayoutSetLabel", clib.}
  ##  Methods of Buffer
  proc wgpuBufferDestroy*(buffer: WGPUBuffer) {.importc: "wgpuBufferDestroy",
      clib.}
  proc wgpuBufferGetConstMappedRange*(buffer: WGPUBuffer; offset: csize_t;
                                      size: csize_t): pointer {.
      importc: "wgpuBufferGetConstMappedRange", clib.}
  proc wgpuBufferGetMapState*(buffer: WGPUBuffer): WGPUBufferMapState {.
      importc: "wgpuBufferGetMapState", clib.}
  proc wgpuBufferGetMappedRange*(buffer: WGPUBuffer; offset: csize_t;
                                 size: csize_t): pointer {.
      importc: "wgpuBufferGetMappedRange", clib.}
  proc wgpuBufferGetSize*(buffer: WGPUBuffer): uint64 {.
      importc: "wgpuBufferGetSize", clib.}
  proc wgpuBufferGetUsage*(buffer: WGPUBuffer): WGPUBufferUsage {.
      importc: "wgpuBufferGetUsage", clib.}
  proc wgpuBufferMapAsync*(buffer: WGPUBuffer; mode: WGPUMapModeFlags;
                           offset: csize_t; size: csize_t;
                           callback: WGPUBufferMapCallback; userdata: pointer) {.
      importc: "wgpuBufferMapAsync", clib.}
  proc wgpuBufferSetLabel*(buffer: WGPUBuffer; label: cstring) {.
      importc: "wgpuBufferSetLabel", clib.}
  proc wgpuBufferUnmap*(buffer: WGPUBuffer) {.importc: "wgpuBufferUnmap", clib.}
  ##  Methods of CommandBuffer
  proc wgpuCommandBufferSetLabel*(commandBuffer: WGPUCommandBuffer;
                                  label: cstring) {.
      importc: "wgpuCommandBufferSetLabel", clib.}
  ##  Methods of CommandEncoder
  proc wgpuCommandEncoderBeginComputePass*(commandEncoder: WGPUCommandEncoder; descriptor: ptr WGPUComputePassDescriptor): WGPUComputePassEncoder {.
      importc: "wgpuCommandEncoderBeginComputePass", clib.}
    ##  nullable
  proc wgpuCommandEncoderBeginRenderPass*(commandEncoder: WGPUCommandEncoder;
      descriptor: ptr WGPURenderPassDescriptor): WGPURenderPassEncoder {.
      importc: "wgpuCommandEncoderBeginRenderPass", clib.}
  proc wgpuCommandEncoderClearBuffer*(commandEncoder: WGPUCommandEncoder;
                                      buffer: WGPUBuffer; offset: uint64;
                                      size: uint64) {.
      importc: "wgpuCommandEncoderClearBuffer", clib.}
  proc wgpuCommandEncoderCopyBufferToBuffer*(commandEncoder: WGPUCommandEncoder;
      source: WGPUBuffer; sourceOffset: uint64; destination: WGPUBuffer;
      destinationOffset: uint64; size: uint64) {.
      importc: "wgpuCommandEncoderCopyBufferToBuffer", clib.}
  proc wgpuCommandEncoderCopyBufferToTexture*(
      commandEncoder: WGPUCommandEncoder; source: ptr WGPUImageCopyBuffer;
      destination: ptr WGPUImageCopyTexture; copySize: ptr WGPUExtent3D) {.
      importc: "wgpuCommandEncoderCopyBufferToTexture", clib.}
  proc wgpuCommandEncoderCopyTextureToBuffer*(
      commandEncoder: WGPUCommandEncoder; source: ptr WGPUImageCopyTexture;
      destination: ptr WGPUImageCopyBuffer; copySize: ptr WGPUExtent3D) {.
      importc: "wgpuCommandEncoderCopyTextureToBuffer", clib.}
  proc wgpuCommandEncoderCopyTextureToTexture*(
      commandEncoder: WGPUCommandEncoder; source: ptr WGPUImageCopyTexture;
      destination: ptr WGPUImageCopyTexture; copySize: ptr WGPUExtent3D) {.
      importc: "wgpuCommandEncoderCopyTextureToTexture", clib.}
  proc wgpuCommandEncoderFinish*(commandEncoder: WGPUCommandEncoder; descriptor: ptr WGPUCommandBufferDescriptor): WGPUCommandBuffer {.
      importc: "wgpuCommandEncoderFinish", clib.}
    ##  nullable
  proc wgpuCommandEncoderInsertDebugMarker*(commandEncoder: WGPUCommandEncoder;
      markerLabel: cstring) {.importc: "wgpuCommandEncoderInsertDebugMarker",
                              clib.}
  proc wgpuCommandEncoderPopDebugGroup*(commandEncoder: WGPUCommandEncoder) {.
      importc: "wgpuCommandEncoderPopDebugGroup", clib.}
  proc wgpuCommandEncoderPushDebugGroup*(commandEncoder: WGPUCommandEncoder;
      groupLabel: cstring) {.importc: "wgpuCommandEncoderPushDebugGroup", clib.}
  proc wgpuCommandEncoderResolveQuerySet*(commandEncoder: WGPUCommandEncoder;
      querySet: WGPUQuerySet; firstQuery: uint32; queryCount: uint32;
      destination: WGPUBuffer; destinationOffset: uint64) {.
      importc: "wgpuCommandEncoderResolveQuerySet", clib.}
  proc wgpuCommandEncoderSetLabel*(commandEncoder: WGPUCommandEncoder;
                                   label: cstring) {.
      importc: "wgpuCommandEncoderSetLabel", clib.}
  proc wgpuCommandEncoderWriteTimestamp*(commandEncoder: WGPUCommandEncoder;
      querySet: WGPUQuerySet; queryIndex: uint32) {.
      importc: "wgpuCommandEncoderWriteTimestamp", clib.}
  ##  Methods of ComputePassEncoder
  proc wgpuComputePassEncoderBeginPipelineStatisticsQuery*(
      computePassEncoder: WGPUComputePassEncoder; querySet: WGPUQuerySet;
      queryIndex: uint32) {.importc: "wgpuComputePassEncoderBeginPipelineStatisticsQuery",
                            clib.}
  proc wgpuComputePassEncoderDispatchWorkgroups*(
      computePassEncoder: WGPUComputePassEncoder; workgroupCountX: uint32;
      workgroupCountY: uint32; workgroupCountZ: uint32) {.
      importc: "wgpuComputePassEncoderDispatchWorkgroups", clib.}
  proc wgpuComputePassEncoderDispatchWorkgroupsIndirect*(
      computePassEncoder: WGPUComputePassEncoder; indirectBuffer: WGPUBuffer;
      indirectOffset: uint64) {.importc: "wgpuComputePassEncoderDispatchWorkgroupsIndirect",
                                clib.}
  proc wgpuComputePassEncoderEnd*(computePassEncoder: WGPUComputePassEncoder) {.
      importc: "wgpuComputePassEncoderEnd", clib.}
  proc wgpuComputePassEncoderEndPipelineStatisticsQuery*(
      computePassEncoder: WGPUComputePassEncoder) {.
      importc: "wgpuComputePassEncoderEndPipelineStatisticsQuery", clib.}
  proc wgpuComputePassEncoderInsertDebugMarker*(
      computePassEncoder: WGPUComputePassEncoder; markerLabel: cstring) {.
      importc: "wgpuComputePassEncoderInsertDebugMarker", clib.}
  proc wgpuComputePassEncoderPopDebugGroup*(
      computePassEncoder: WGPUComputePassEncoder) {.
      importc: "wgpuComputePassEncoderPopDebugGroup", clib.}
  proc wgpuComputePassEncoderPushDebugGroup*(
      computePassEncoder: WGPUComputePassEncoder; groupLabel: cstring) {.
      importc: "wgpuComputePassEncoderPushDebugGroup", clib.}
  proc wgpuComputePassEncoderSetBindGroup*(
      computePassEncoder: WGPUComputePassEncoder; groupIndex: uint32;
      group: WGPUBindGroup; dynamicOffsetCount: uint32;
      dynamicOffsets: ptr uint32) {.importc: "wgpuComputePassEncoderSetBindGroup",
                                    clib.}
  proc wgpuComputePassEncoderSetLabel*(computePassEncoder: WGPUComputePassEncoder;
                                       label: cstring) {.
      importc: "wgpuComputePassEncoderSetLabel", clib.}
  proc wgpuComputePassEncoderSetPipeline*(
      computePassEncoder: WGPUComputePassEncoder; pipeline: WGPUComputePipeline) {.
      importc: "wgpuComputePassEncoderSetPipeline", clib.}
  ##  Methods of ComputePipeline
  proc wgpuComputePipelineGetBindGroupLayout*(
      computePipeline: WGPUComputePipeline; groupIndex: uint32): WGPUBindGroupLayout {.
      importc: "wgpuComputePipelineGetBindGroupLayout", clib.}
  proc wgpuComputePipelineSetLabel*(computePipeline: WGPUComputePipeline;
                                    label: cstring) {.
      importc: "wgpuComputePipelineSetLabel", clib.}
  ##  Methods of Device
  proc wgpuDeviceCreateBindGroup*(device: WGPUDevice;
                                  descriptor: ptr WGPUBindGroupDescriptor): WGPUBindGroup {.
      importc: "wgpuDeviceCreateBindGroup", clib.}
  proc wgpuDeviceCreateBindGroupLayout*(device: WGPUDevice; descriptor: ptr WGPUBindGroupLayoutDescriptor): WGPUBindGroupLayout {.
      importc: "wgpuDeviceCreateBindGroupLayout", clib.}
  proc wgpuDeviceCreateBuffer*(device: WGPUDevice;
                               descriptor: ptr WGPUBufferDescriptor): WGPUBuffer {.
      importc: "wgpuDeviceCreateBuffer", clib.}
  proc wgpuDeviceCreateCommandEncoder*(device: WGPUDevice; descriptor: ptr WGPUCommandEncoderDescriptor): WGPUCommandEncoder {.
      importc: "wgpuDeviceCreateCommandEncoder", clib.}
    ##  nullable
  proc wgpuDeviceCreateComputePipeline*(device: WGPUDevice; descriptor: ptr WGPUComputePipelineDescriptor): WGPUComputePipeline {.
      importc: "wgpuDeviceCreateComputePipeline", clib.}
  proc wgpuDeviceCreateComputePipelineAsync*(device: WGPUDevice;
      descriptor: ptr WGPUComputePipelineDescriptor;
      callback: WGPUCreateComputePipelineAsyncCallback; userdata: pointer) {.
      importc: "wgpuDeviceCreateComputePipelineAsync", clib.}
  proc wgpuDeviceCreatePipelineLayout*(device: WGPUDevice; descriptor: ptr WGPUPipelineLayoutDescriptor): WGPUPipelineLayout {.
      importc: "wgpuDeviceCreatePipelineLayout", clib.}
  proc wgpuDeviceCreateQuerySet*(device: WGPUDevice;
                                 descriptor: ptr WGPUQuerySetDescriptor): WGPUQuerySet {.
      importc: "wgpuDeviceCreateQuerySet", clib.}
  proc wgpuDeviceCreateRenderBundleEncoder*(device: WGPUDevice;
      descriptor: ptr WGPURenderBundleEncoderDescriptor): WGPURenderBundleEncoder {.
      importc: "wgpuDeviceCreateRenderBundleEncoder", clib.}
  proc wgpuDeviceCreateRenderPipeline*(device: WGPUDevice; descriptor: ptr WGPURenderPipelineDescriptor): WGPURenderPipeline {.
      importc: "wgpuDeviceCreateRenderPipeline", clib.}
  proc wgpuDeviceCreateRenderPipelineAsync*(device: WGPUDevice;
      descriptor: ptr WGPURenderPipelineDescriptor;
      callback: WGPUCreateRenderPipelineAsyncCallback; userdata: pointer) {.
      importc: "wgpuDeviceCreateRenderPipelineAsync", clib.}
  proc wgpuDeviceCreateSampler*(device: WGPUDevice; descriptor: ptr WGPUSamplerDescriptor): WGPUSampler {.
      importc: "wgpuDeviceCreateSampler", clib.}
    ##  nullable
  proc wgpuDeviceCreateShaderModule*(device: WGPUDevice;
                                     descriptor: ptr WGPUShaderModuleDescriptor): WGPUShaderModule {.
      importc: "wgpuDeviceCreateShaderModule", clib.}
  proc wgpuDeviceCreateSwapChain*(device: WGPUDevice; surface: WGPUSurface;
                                  descriptor: ptr WGPUSwapChainDescriptor): WGPUSwapChain {.
      importc: "wgpuDeviceCreateSwapChain", clib.}
  proc wgpuDeviceCreateTexture*(device: WGPUDevice;
                                descriptor: ptr WGPUTextureDescriptor): WGPUTexture {.
      importc: "wgpuDeviceCreateTexture", clib.}
  proc wgpuDeviceDestroy*(device: WGPUDevice) {.importc: "wgpuDeviceDestroy",
      clib.}
  proc wgpuDeviceEnumerateFeatures*(device: WGPUDevice;
                                    features: ptr WGPUFeatureName): csize_t {.
      importc: "wgpuDeviceEnumerateFeatures", clib.}
  proc wgpuDeviceGetLimits*(device: WGPUDevice; limits: ptr WGPUSupportedLimits): bool {.
      importc: "wgpuDeviceGetLimits", clib.}
  proc wgpuDeviceGetQueue*(device: WGPUDevice): WGPUQueue {.
      importc: "wgpuDeviceGetQueue", clib.}
  proc wgpuDeviceHasFeature*(device: WGPUDevice; feature: WGPUFeatureName): bool {.
      importc: "wgpuDeviceHasFeature", clib.}
  proc wgpuDevicePopErrorScope*(device: WGPUDevice; callback: WGPUErrorCallback;
                                userdata: pointer): bool {.
      importc: "wgpuDevicePopErrorScope", clib.}
  proc wgpuDevicePushErrorScope*(device: WGPUDevice; filter: WGPUErrorFilter) {.
      importc: "wgpuDevicePushErrorScope", clib.}
  proc wgpuDeviceSetDeviceLostCallback*(device: WGPUDevice;
                                        callback: WGPUDeviceLostCallback;
                                        userdata: pointer) {.
      importc: "wgpuDeviceSetDeviceLostCallback", clib.}
  proc wgpuDeviceSetLabel*(device: WGPUDevice; label: cstring) {.
      importc: "wgpuDeviceSetLabel", clib.}
  proc wgpuDeviceSetUncapturedErrorCallback*(device: WGPUDevice;
      callback: WGPUErrorCallback; userdata: pointer) {.
      importc: "wgpuDeviceSetUncapturedErrorCallback", clib.}
  ##  Methods of Instance
  proc wgpuInstanceCreateSurface*(instance: WGPUInstance;
                                  descriptor: ptr WGPUSurfaceDescriptor): WGPUSurface {.
      importc: "wgpuInstanceCreateSurface", clib.}
  proc wgpuInstanceProcessEvents*(instance: WGPUInstance) {.
      importc: "wgpuInstanceProcessEvents", clib.}
  proc wgpuInstanceRequestAdapter*(instance: WGPUInstance; options: ptr WGPURequestAdapterOptions; ##  nullable
                                   callback: WGPURequestAdapterCallback;
                                   userdata: pointer) {.
      importc: "wgpuInstanceRequestAdapter", clib.}
  ##  Methods of PipelineLayout
  proc wgpuPipelineLayoutSetLabel*(pipelineLayout: WGPUPipelineLayout;
                                   label: cstring) {.
      importc: "wgpuPipelineLayoutSetLabel", clib.}
  ##  Methods of QuerySet
  proc wgpuQuerySetDestroy*(querySet: WGPUQuerySet) {.
      importc: "wgpuQuerySetDestroy", clib.}
  proc wgpuQuerySetGetCount*(querySet: WGPUQuerySet): uint32 {.
      importc: "wgpuQuerySetGetCount", clib.}
  proc wgpuQuerySetGetType*(querySet: WGPUQuerySet): WGPUQueryType {.
      importc: "wgpuQuerySetGetType", clib.}
  proc wgpuQuerySetSetLabel*(querySet: WGPUQuerySet; label: cstring) {.
      importc: "wgpuQuerySetSetLabel", clib.}
  ##  Methods of Queue
  proc wgpuQueueOnSubmittedWorkDone*(queue: WGPUQueue;
                                     callback: WGPUQueueWorkDoneCallback;
                                     userdata: pointer) {.
      importc: "wgpuQueueOnSubmittedWorkDone", clib.}
  proc wgpuQueueSetLabel*(queue: WGPUQueue; label: cstring) {.
      importc: "wgpuQueueSetLabel", clib.}
  proc wgpuQueueSubmit*(queue: WGPUQueue; commandCount: uint32;
                        commands: ptr WGPUCommandBuffer) {.
      importc: "wgpuQueueSubmit", clib.}
  proc wgpuQueueWriteBuffer*(queue: WGPUQueue; buffer: WGPUBuffer;
                             bufferOffset: uint64; data: pointer; size: csize_t) {.
      importc: "wgpuQueueWriteBuffer", clib.}
  proc wgpuQueueWriteTexture*(queue: WGPUQueue;
                              destination: ptr WGPUImageCopyTexture;
                              data: pointer; dataSize: csize_t;
                              dataLayout: ptr WGPUTextureDataLayout;
                              writeSize: ptr WGPUExtent3D) {.
      importc: "wgpuQueueWriteTexture", clib.}
  ##  Methods of RenderBundleEncoder
  proc wgpuRenderBundleEncoderDraw*(renderBundleEncoder: WGPURenderBundleEncoder;
                                    vertexCount: uint32; instanceCount: uint32;
                                    firstVertex: uint32; firstInstance: uint32) {.
      importc: "wgpuRenderBundleEncoderDraw", clib.}
  proc wgpuRenderBundleEncoderDrawIndexed*(
      renderBundleEncoder: WGPURenderBundleEncoder; indexCount: uint32;
      instanceCount: uint32; firstIndex: uint32; baseVertex: int32;
      firstInstance: uint32) {.importc: "wgpuRenderBundleEncoderDrawIndexed",
                               clib.}
  proc wgpuRenderBundleEncoderDrawIndexedIndirect*(
      renderBundleEncoder: WGPURenderBundleEncoder; indirectBuffer: WGPUBuffer;
      indirectOffset: uint64) {.importc: "wgpuRenderBundleEncoderDrawIndexedIndirect",
                                clib.}
  proc wgpuRenderBundleEncoderDrawIndirect*(
      renderBundleEncoder: WGPURenderBundleEncoder; indirectBuffer: WGPUBuffer;
      indirectOffset: uint64) {.importc: "wgpuRenderBundleEncoderDrawIndirect",
                                clib.}
  proc wgpuRenderBundleEncoderFinish*(renderBundleEncoder: WGPURenderBundleEncoder; descriptor: ptr WGPURenderBundleDescriptor): WGPURenderBundle {.
      importc: "wgpuRenderBundleEncoderFinish", clib.}
    ##  nullable
  proc wgpuRenderBundleEncoderInsertDebugMarker*(
      renderBundleEncoder: WGPURenderBundleEncoder; markerLabel: cstring) {.
      importc: "wgpuRenderBundleEncoderInsertDebugMarker", clib.}
  proc wgpuRenderBundleEncoderPopDebugGroup*(
      renderBundleEncoder: WGPURenderBundleEncoder) {.
      importc: "wgpuRenderBundleEncoderPopDebugGroup", clib.}
  proc wgpuRenderBundleEncoderPushDebugGroup*(
      renderBundleEncoder: WGPURenderBundleEncoder; groupLabel: cstring) {.
      importc: "wgpuRenderBundleEncoderPushDebugGroup", clib.}
  proc wgpuRenderBundleEncoderSetBindGroup*(
      renderBundleEncoder: WGPURenderBundleEncoder; groupIndex: uint32;
      group: WGPUBindGroup; dynamicOffsetCount: uint32;
      dynamicOffsets: ptr uint32) {.importc: "wgpuRenderBundleEncoderSetBindGroup",
                                    clib.}
  proc wgpuRenderBundleEncoderSetIndexBuffer*(
      renderBundleEncoder: WGPURenderBundleEncoder; buffer: WGPUBuffer;
      format: WGPUIndexFormat; offset: uint64; size: uint64) {.
      importc: "wgpuRenderBundleEncoderSetIndexBuffer", clib.}
  proc wgpuRenderBundleEncoderSetLabel*(renderBundleEncoder: WGPURenderBundleEncoder;
                                        label: cstring) {.
      importc: "wgpuRenderBundleEncoderSetLabel", clib.}
  proc wgpuRenderBundleEncoderSetPipeline*(
      renderBundleEncoder: WGPURenderBundleEncoder; pipeline: WGPURenderPipeline) {.
      importc: "wgpuRenderBundleEncoderSetPipeline", clib.}
  proc wgpuRenderBundleEncoderSetVertexBuffer*(
      renderBundleEncoder: WGPURenderBundleEncoder; slot: uint32;
      buffer: WGPUBuffer; offset: uint64; size: uint64) {.
      importc: "wgpuRenderBundleEncoderSetVertexBuffer", clib.}
  ##  Methods of RenderPassEncoder
  proc wgpuRenderPassEncoderBeginOcclusionQuery*(
      renderPassEncoder: WGPURenderPassEncoder; queryIndex: uint32) {.
      importc: "wgpuRenderPassEncoderBeginOcclusionQuery", clib.}
  proc wgpuRenderPassEncoderBeginPipelineStatisticsQuery*(
      renderPassEncoder: WGPURenderPassEncoder; querySet: WGPUQuerySet;
      queryIndex: uint32) {.importc: "wgpuRenderPassEncoderBeginPipelineStatisticsQuery",
                            clib.}
  proc wgpuRenderPassEncoderDraw*(renderPassEncoder: WGPURenderPassEncoder;
                                  vertexCount: uint32; instanceCount: uint32;
                                  firstVertex: uint32; firstInstance: uint32) {.
      importc: "wgpuRenderPassEncoderDraw", clib.}
  proc wgpuRenderPassEncoderDrawIndexed*(
      renderPassEncoder: WGPURenderPassEncoder; indexCount: uint32;
      instanceCount: uint32; firstIndex: uint32; baseVertex: int32;
      firstInstance: uint32) {.importc: "wgpuRenderPassEncoderDrawIndexed", clib.}
  proc wgpuRenderPassEncoderDrawIndexedIndirect*(
      renderPassEncoder: WGPURenderPassEncoder; indirectBuffer: WGPUBuffer;
      indirectOffset: uint64) {.importc: "wgpuRenderPassEncoderDrawIndexedIndirect",
                                clib.}
  proc wgpuRenderPassEncoderDrawIndirect*(
      renderPassEncoder: WGPURenderPassEncoder; indirectBuffer: WGPUBuffer;
      indirectOffset: uint64) {.importc: "wgpuRenderPassEncoderDrawIndirect",
                                clib.}
  proc wgpuRenderPassEncoderEnd*(renderPassEncoder: WGPURenderPassEncoder) {.
      importc: "wgpuRenderPassEncoderEnd", clib.}
  proc wgpuRenderPassEncoderEndOcclusionQuery*(
      renderPassEncoder: WGPURenderPassEncoder) {.
      importc: "wgpuRenderPassEncoderEndOcclusionQuery", clib.}
  proc wgpuRenderPassEncoderEndPipelineStatisticsQuery*(
      renderPassEncoder: WGPURenderPassEncoder) {.
      importc: "wgpuRenderPassEncoderEndPipelineStatisticsQuery", clib.}
  proc wgpuRenderPassEncoderExecuteBundles*(
      renderPassEncoder: WGPURenderPassEncoder; bundleCount: uint32;
      bundles: ptr WGPURenderBundle) {.importc: "wgpuRenderPassEncoderExecuteBundles",
                                       clib.}
  proc wgpuRenderPassEncoderInsertDebugMarker*(
      renderPassEncoder: WGPURenderPassEncoder; markerLabel: cstring) {.
      importc: "wgpuRenderPassEncoderInsertDebugMarker", clib.}
  proc wgpuRenderPassEncoderPopDebugGroup*(
      renderPassEncoder: WGPURenderPassEncoder) {.
      importc: "wgpuRenderPassEncoderPopDebugGroup", clib.}
  proc wgpuRenderPassEncoderPushDebugGroup*(
      renderPassEncoder: WGPURenderPassEncoder; groupLabel: cstring) {.
      importc: "wgpuRenderPassEncoderPushDebugGroup", clib.}
  proc wgpuRenderPassEncoderSetBindGroup*(
      renderPassEncoder: WGPURenderPassEncoder; groupIndex: uint32;
      group: WGPUBindGroup; dynamicOffsetCount: uint32;
      dynamicOffsets: ptr uint32) {.importc: "wgpuRenderPassEncoderSetBindGroup",
                                    clib.}
  proc wgpuRenderPassEncoderSetBlendConstant*(
      renderPassEncoder: WGPURenderPassEncoder; color: ptr WGPUColor) {.
      importc: "wgpuRenderPassEncoderSetBlendConstant", clib.}
  proc wgpuRenderPassEncoderSetIndexBuffer*(
      renderPassEncoder: WGPURenderPassEncoder; buffer: WGPUBuffer;
      format: WGPUIndexFormat; offset: uint64; size: uint64) {.
      importc: "wgpuRenderPassEncoderSetIndexBuffer", clib.}
  proc wgpuRenderPassEncoderSetLabel*(renderPassEncoder: WGPURenderPassEncoder;
                                      label: cstring) {.
      importc: "wgpuRenderPassEncoderSetLabel", clib.}
  proc wgpuRenderPassEncoderSetPipeline*(
      renderPassEncoder: WGPURenderPassEncoder; pipeline: WGPURenderPipeline) {.
      importc: "wgpuRenderPassEncoderSetPipeline", clib.}
  proc wgpuRenderPassEncoderSetScissorRect*(
      renderPassEncoder: WGPURenderPassEncoder; x: uint32; y: uint32;
      width: uint32; height: uint32) {.importc: "wgpuRenderPassEncoderSetScissorRect",
                                       clib.}
  proc wgpuRenderPassEncoderSetStencilReference*(
      renderPassEncoder: WGPURenderPassEncoder; reference: uint32) {.
      importc: "wgpuRenderPassEncoderSetStencilReference", clib.}
  proc wgpuRenderPassEncoderSetVertexBuffer*(
      renderPassEncoder: WGPURenderPassEncoder; slot: uint32;
      buffer: WGPUBuffer; offset: uint64; size: uint64) {.
      importc: "wgpuRenderPassEncoderSetVertexBuffer", clib.}
  proc wgpuRenderPassEncoderSetViewport*(
      renderPassEncoder: WGPURenderPassEncoder; x: cfloat; y: cfloat;
      width: cfloat; height: cfloat; minDepth: cfloat; maxDepth: cfloat) {.
      importc: "wgpuRenderPassEncoderSetViewport", clib.}
  ##  Methods of RenderPipeline
  proc wgpuRenderPipelineGetBindGroupLayout*(renderPipeline: WGPURenderPipeline;
      groupIndex: uint32): WGPUBindGroupLayout {.
      importc: "wgpuRenderPipelineGetBindGroupLayout", clib.}
  proc wgpuRenderPipelineSetLabel*(renderPipeline: WGPURenderPipeline;
                                   label: cstring) {.
      importc: "wgpuRenderPipelineSetLabel", clib.}
  ##  Methods of Sampler
  proc wgpuSamplerSetLabel*(sampler: WGPUSampler; label: cstring) {.
      importc: "wgpuSamplerSetLabel", clib.}
  ##  Methods of ShaderModule
  proc wgpuShaderModuleGetCompilationInfo*(shaderModule: WGPUShaderModule;
      callback: WGPUCompilationInfoCallback; userdata: pointer) {.
      importc: "wgpuShaderModuleGetCompilationInfo", clib.}
  proc wgpuShaderModuleSetLabel*(shaderModule: WGPUShaderModule; label: cstring) {.
      importc: "wgpuShaderModuleSetLabel", clib.}
  ##  Methods of Surface
  proc wgpuSurfaceGetPreferredFormat*(surface: WGPUSurface; adapter: WGPUAdapter): WGPUTextureFormat {.
      importc: "wgpuSurfaceGetPreferredFormat", clib.}
  ##  Methods of SwapChain
  proc wgpuSwapChainGetCurrentTextureView*(swapChain: WGPUSwapChain): WGPUTextureView {.
      importc: "wgpuSwapChainGetCurrentTextureView", clib.}
  proc wgpuSwapChainPresent*(swapChain: WGPUSwapChain) {.
      importc: "wgpuSwapChainPresent", clib.}
  ##  Methods of Texture
  proc wgpuTextureCreateView*(texture: WGPUTexture; descriptor: ptr WGPUTextureViewDescriptor): WGPUTextureView {.
      importc: "wgpuTextureCreateView", clib.}
    ##  nullable
  proc wgpuTextureDestroy*(texture: WGPUTexture) {.
      importc: "wgpuTextureDestroy", clib.}
  proc wgpuTextureGetDepthOrArrayLayers*(texture: WGPUTexture): uint32 {.
      importc: "wgpuTextureGetDepthOrArrayLayers", clib.}
  proc wgpuTextureGetDimension*(texture: WGPUTexture): WGPUTextureDimension {.
      importc: "wgpuTextureGetDimension", clib.}
  proc wgpuTextureGetFormat*(texture: WGPUTexture): WGPUTextureFormat {.
      importc: "wgpuTextureGetFormat", clib.}
  proc wgpuTextureGetHeight*(texture: WGPUTexture): uint32 {.
      importc: "wgpuTextureGetHeight", clib.}
  proc wgpuTextureGetMipLevelCount*(texture: WGPUTexture): uint32 {.
      importc: "wgpuTextureGetMipLevelCount", clib.}
  proc wgpuTextureGetSampleCount*(texture: WGPUTexture): uint32 {.
      importc: "wgpuTextureGetSampleCount", clib.}
  proc wgpuTextureGetUsage*(texture: WGPUTexture): WGPUTextureUsage {.
      importc: "wgpuTextureGetUsage", clib.}
  proc wgpuTextureGetWidth*(texture: WGPUTexture): uint32 {.
      importc: "wgpuTextureGetWidth", clib.}
  proc wgpuTextureSetLabel*(texture: WGPUTexture; label: cstring) {.
      importc: "wgpuTextureSetLabel", clib.}
  ##  Methods of TextureView
  proc wgpuTextureViewSetLabel*(textureView: WGPUTextureView; label: cstring) {.
      importc: "wgpuTextureViewSetLabel", clib.}