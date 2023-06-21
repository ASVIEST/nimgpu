{.experimental: "codeReordering".}

{.define: WGPU_NATIVE_DYNLIB.}

when defined(WGPU_NATIVE_DYNLIB):
  const wgpudll = "wgpu-native/target/release/" & (
    when defined(windows):
      "./wgpu_native.dll"
    elif defined(macosx):
      "./libwgpu_native.dylib"
    else:
      "./libwgpu_native.so"
  )

  {.pragma: clib, cdecl, dynlib: wgpudll.}
else:
  {.pragma: clib.}
  {.passl: "wgpu-native/target/release/" & "./libwgpu_native.a"}


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
  WGPUAdapterType* {.size: sizeof(cint).} = enum
    WGPUAdapterType_DiscreteGPU = 0x00000000,
    WGPUAdapterType_IntegratedGPU = 0x00000001,
    WGPUAdapterType_CPU = 0x00000002, WGPUAdapterType_Unknown = 0x00000003,
    WGPUAdapterType_Force32 = 0x7FFFFFFF
  WGPUAddressMode* {.size: sizeof(cint).} = enum
    WGPUAddressMode_Repeat = 0x00000000,
    WGPUAddressMode_MirrorRepeat = 0x00000001,
    WGPUAddressMode_ClampToEdge = 0x00000002,
    WGPUAddressMode_Force32 = 0x7FFFFFFF
  WGPUBackendType* {.size: sizeof(cint).} = enum
    WGPUBackendType_Null = 0x00000000, WGPUBackendType_WebGPU = 0x00000001,
    WGPUBackendType_D3D11 = 0x00000002, WGPUBackendType_D3D12 = 0x00000003,
    WGPUBackendType_Metal = 0x00000004, WGPUBackendType_Vulkan = 0x00000005,
    WGPUBackendType_OpenGL = 0x00000006, WGPUBackendType_OpenGLES = 0x00000007,
    WGPUBackendType_Force32 = 0x7FFFFFFF
  WGPUBlendFactor* {.size: sizeof(cint).} = enum
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
  WGPUBlendOperation* {.size: sizeof(cint).} = enum
    WGPUBlendOperation_Add = 0x00000000,
    WGPUBlendOperation_Subtract = 0x00000001,
    WGPUBlendOperation_ReverseSubtract = 0x00000002,
    WGPUBlendOperation_Min = 0x00000003, WGPUBlendOperation_Max = 0x00000004,
    WGPUBlendOperation_Force32 = 0x7FFFFFFF
  WGPUBufferBindingType* {.size: sizeof(cint).} = enum
    WGPUBufferBindingType_Undefined = 0x00000000,
    WGPUBufferBindingType_Uniform = 0x00000001,
    WGPUBufferBindingType_Storage = 0x00000002,
    WGPUBufferBindingType_ReadOnlyStorage = 0x00000003,
    WGPUBufferBindingType_Force32 = 0x7FFFFFFF
  WGPUBufferMapAsyncStatus* {.size: sizeof(cint).} = enum
    WGPUBufferMapAsyncStatus_Success = 0x00000000,
    WGPUBufferMapAsyncStatus_Error = 0x00000001,
    WGPUBufferMapAsyncStatus_Unknown = 0x00000002,
    WGPUBufferMapAsyncStatus_DeviceLost = 0x00000003,
    WGPUBufferMapAsyncStatus_DestroyedBeforeCallback = 0x00000004,
    WGPUBufferMapAsyncStatus_UnmappedBeforeCallback = 0x00000005,
    WGPUBufferMapAsyncStatus_Force32 = 0x7FFFFFFF
  WGPUBufferMapState* {.size: sizeof(cint).} = enum
    WGPUBufferMapState_Unmapped = 0x00000000,
    WGPUBufferMapState_Pending = 0x00000001,
    WGPUBufferMapState_Mapped = 0x00000002,
    WGPUBufferMapState_Force32 = 0x7FFFFFFF
  WGPUCompareFunction* {.size: sizeof(cint).} = enum
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
  WGPUCompilationInfoRequestStatus* {.size: sizeof(cint).} = enum
    WGPUCompilationInfoRequestStatus_Success = 0x00000000,
    WGPUCompilationInfoRequestStatus_Error = 0x00000001,
    WGPUCompilationInfoRequestStatus_DeviceLost = 0x00000002,
    WGPUCompilationInfoRequestStatus_Unknown = 0x00000003,
    WGPUCompilationInfoRequestStatus_Force32 = 0x7FFFFFFF
  WGPUCompilationMessageType* {.size: sizeof(cint).} = enum
    WGPUCompilationMessageType_Error = 0x00000000,
    WGPUCompilationMessageType_Warning = 0x00000001,
    WGPUCompilationMessageType_Info = 0x00000002,
    WGPUCompilationMessageType_Force32 = 0x7FFFFFFF
  WGPUComputePassTimestampLocation* {.size: sizeof(cint).} = enum
    WGPUComputePassTimestampLocation_Beginning = 0x00000000,
    WGPUComputePassTimestampLocation_End = 0x00000001,
    WGPUComputePassTimestampLocation_Force32 = 0x7FFFFFFF
  WGPUCreatePipelineAsyncStatus* {.size: sizeof(cint).} = enum
    WGPUCreatePipelineAsyncStatus_Success = 0x00000000,
    WGPUCreatePipelineAsyncStatus_ValidationError = 0x00000001,
    WGPUCreatePipelineAsyncStatus_InternalError = 0x00000002,
    WGPUCreatePipelineAsyncStatus_DeviceLost = 0x00000003,
    WGPUCreatePipelineAsyncStatus_DeviceDestroyed = 0x00000004,
    WGPUCreatePipelineAsyncStatus_Unknown = 0x00000005,
    WGPUCreatePipelineAsyncStatus_Force32 = 0x7FFFFFFF
  WGPUCullMode* {.size: sizeof(cint).} = enum
    WGPUCullMode_None = 0x00000000, WGPUCullMode_Front = 0x00000001,
    WGPUCullMode_Back = 0x00000002, WGPUCullMode_Force32 = 0x7FFFFFFF
  WGPUDeviceLostReason* {.size: sizeof(cint).} = enum
    WGPUDeviceLostReason_Undefined = 0x00000000,
    WGPUDeviceLostReason_Destroyed = 0x00000001,
    WGPUDeviceLostReason_Force32 = 0x7FFFFFFF
  WGPUErrorFilter* {.size: sizeof(cint).} = enum
    WGPUErrorFilter_Validation = 0x00000000,
    WGPUErrorFilter_OutOfMemory = 0x00000001,
    WGPUErrorFilter_Internal = 0x00000002, WGPUErrorFilter_Force32 = 0x7FFFFFFF
  WGPUErrorType* {.size: sizeof(cint).} = enum
    WGPUErrorType_NoError = 0x00000000, WGPUErrorType_Validation = 0x00000001,
    WGPUErrorType_OutOfMemory = 0x00000002, WGPUErrorType_Internal = 0x00000003,
    WGPUErrorType_Unknown = 0x00000004, WGPUErrorType_DeviceLost = 0x00000005,
    WGPUErrorType_Force32 = 0x7FFFFFFF
  WGPUFeatureName* {.size: sizeof(cint).} = enum
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
  WGPUFilterMode* {.size: sizeof(cint).} = enum
    WGPUFilterMode_Nearest = 0x00000000, WGPUFilterMode_Linear = 0x00000001,
    WGPUFilterMode_Force32 = 0x7FFFFFFF
  WGPUFrontFace* {.size: sizeof(cint).} = enum
    WGPUFrontFace_CCW = 0x00000000, WGPUFrontFace_CW = 0x00000001,
    WGPUFrontFace_Force32 = 0x7FFFFFFF
  WGPUIndexFormat* {.size: sizeof(cint).} = enum
    WGPUIndexFormat_Undefined = 0x00000000, WGPUIndexFormat_Uint16 = 0x00000001,
    WGPUIndexFormat_Uint32 = 0x00000002, WGPUIndexFormat_Force32 = 0x7FFFFFFF
  WGPULoadOp* {.size: sizeof(cint).} = enum
    WGPULoadOp_Undefined = 0x00000000, WGPULoadOp_Clear = 0x00000001,
    WGPULoadOp_Load = 0x00000002, WGPULoadOp_Force32 = 0x7FFFFFFF
  WGPUMipmapFilterMode* {.size: sizeof(cint).} = enum
    WGPUMipmapFilterMode_Nearest = 0x00000000,
    WGPUMipmapFilterMode_Linear = 0x00000001,
    WGPUMipmapFilterMode_Force32 = 0x7FFFFFFF
  WGPUPipelineStatisticName* {.size: sizeof(cint).} = enum
    WGPUPipelineStatisticName_VertexShaderInvocations = 0x00000000,
    WGPUPipelineStatisticName_ClipperInvocations = 0x00000001,
    WGPUPipelineStatisticName_ClipperPrimitivesOut = 0x00000002,
    WGPUPipelineStatisticName_FragmentShaderInvocations = 0x00000003,
    WGPUPipelineStatisticName_ComputeShaderInvocations = 0x00000004,
    WGPUPipelineStatisticName_Force32 = 0x7FFFFFFF
  WGPUPowerPreference* {.size: sizeof(cint).} = enum
    WGPUPowerPreference_Undefined = 0x00000000,
    WGPUPowerPreference_LowPower = 0x00000001,
    WGPUPowerPreference_HighPerformance = 0x00000002,
    WGPUPowerPreference_Force32 = 0x7FFFFFFF
  WGPUPresentMode* {.size: sizeof(cint).} = enum
    WGPUPresentMode_Immediate = 0x00000000,
    WGPUPresentMode_Mailbox = 0x00000001, WGPUPresentMode_Fifo = 0x00000002,
    WGPUPresentMode_Force32 = 0x7FFFFFFF
  WGPUPrimitiveTopology* {.size: sizeof(cint).} = enum
    WGPUPrimitiveTopology_PointList = 0x00000000,
    WGPUPrimitiveTopology_LineList = 0x00000001,
    WGPUPrimitiveTopology_LineStrip = 0x00000002,
    WGPUPrimitiveTopology_TriangleList = 0x00000003,
    WGPUPrimitiveTopology_TriangleStrip = 0x00000004,
    WGPUPrimitiveTopology_Force32 = 0x7FFFFFFF
  WGPUQueryType* {.size: sizeof(cint).} = enum
    WGPUQueryType_Occlusion = 0x00000000,
    WGPUQueryType_PipelineStatistics = 0x00000001,
    WGPUQueryType_Timestamp = 0x00000002, WGPUQueryType_Force32 = 0x7FFFFFFF
  WGPUQueueWorkDoneStatus* {.size: sizeof(cint).} = enum
    WGPUQueueWorkDoneStatus_Success = 0x00000000,
    WGPUQueueWorkDoneStatus_Error = 0x00000001,
    WGPUQueueWorkDoneStatus_Unknown = 0x00000002,
    WGPUQueueWorkDoneStatus_DeviceLost = 0x00000003,
    WGPUQueueWorkDoneStatus_Force32 = 0x7FFFFFFF
  WGPURenderPassTimestampLocation* {.size: sizeof(cint).} = enum
    WGPURenderPassTimestampLocation_Beginning = 0x00000000,
    WGPURenderPassTimestampLocation_End = 0x00000001,
    WGPURenderPassTimestampLocation_Force32 = 0x7FFFFFFF
  WGPURequestAdapterStatus* {.size: sizeof(cint).} = enum
    WGPURequestAdapterStatus_Success = 0x00000000,
    WGPURequestAdapterStatus_Unavailable = 0x00000001,
    WGPURequestAdapterStatus_Error = 0x00000002,
    WGPURequestAdapterStatus_Unknown = 0x00000003,
    WGPURequestAdapterStatus_Force32 = 0x7FFFFFFF
  WGPURequestDeviceStatus* {.size: sizeof(cint).} = enum
    WGPURequestDeviceStatus_Success = 0x00000000,
    WGPURequestDeviceStatus_Error = 0x00000001,
    WGPURequestDeviceStatus_Unknown = 0x00000002,
    WGPURequestDeviceStatus_Force32 = 0x7FFFFFFF
  WGPUSType* {.size: sizeof(cint).} = enum
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
  WGPUSamplerBindingType* {.size: sizeof(cint).} = enum
    WGPUSamplerBindingType_Undefined = 0x00000000,
    WGPUSamplerBindingType_Filtering = 0x00000001,
    WGPUSamplerBindingType_NonFiltering = 0x00000002,
    WGPUSamplerBindingType_Comparison = 0x00000003,
    WGPUSamplerBindingType_Force32 = 0x7FFFFFFF
  WGPUStencilOperation* {.size: sizeof(cint).} = enum
    WGPUStencilOperation_Keep = 0x00000000,
    WGPUStencilOperation_Zero = 0x00000001,
    WGPUStencilOperation_Replace = 0x00000002,
    WGPUStencilOperation_Invert = 0x00000003,
    WGPUStencilOperation_IncrementClamp = 0x00000004,
    WGPUStencilOperation_DecrementClamp = 0x00000005,
    WGPUStencilOperation_IncrementWrap = 0x00000006,
    WGPUStencilOperation_DecrementWrap = 0x00000007,
    WGPUStencilOperation_Force32 = 0x7FFFFFFF
  WGPUStorageTextureAccess* {.size: sizeof(cint).} = enum
    WGPUStorageTextureAccess_Undefined = 0x00000000,
    WGPUStorageTextureAccess_WriteOnly = 0x00000001,
    WGPUStorageTextureAccess_Force32 = 0x7FFFFFFF
  WGPUStoreOp* {.size: sizeof(cint).} = enum
    WGPUStoreOp_Undefined = 0x00000000, WGPUStoreOp_Store = 0x00000001,
    WGPUStoreOp_Discard = 0x00000002, WGPUStoreOp_Force32 = 0x7FFFFFFF
  WGPUTextureAspect* {.size: sizeof(cint).} = enum
    WGPUTextureAspect_All = 0x00000000,
    WGPUTextureAspect_StencilOnly = 0x00000001,
    WGPUTextureAspect_DepthOnly = 0x00000002,
    WGPUTextureAspect_Force32 = 0x7FFFFFFF
  WGPUTextureComponentType* {.size: sizeof(cint).} = enum
    WGPUTextureComponentType_Float = 0x00000000,
    WGPUTextureComponentType_Sint = 0x00000001,
    WGPUTextureComponentType_Uint = 0x00000002,
    WGPUTextureComponentType_DepthComparison = 0x00000003,
    WGPUTextureComponentType_Force32 = 0x7FFFFFFF
  WGPUTextureDimension* {.size: sizeof(cint).} = enum
    WGPUTextureDimension_1D = 0x00000000, WGPUTextureDimension_2D = 0x00000001,
    WGPUTextureDimension_3D = 0x00000002,
    WGPUTextureDimension_Force32 = 0x7FFFFFFF
  WGPUTextureFormat* {.size: sizeof(cint).} = enum
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
  WGPUTextureSampleType* {.size: sizeof(cint).} = enum
    WGPUTextureSampleType_Undefined = 0x00000000,
    WGPUTextureSampleType_Float = 0x00000001,
    WGPUTextureSampleType_UnfilterableFloat = 0x00000002,
    WGPUTextureSampleType_Depth = 0x00000003,
    WGPUTextureSampleType_Sint = 0x00000004,
    WGPUTextureSampleType_Uint = 0x00000005,
    WGPUTextureSampleType_Force32 = 0x7FFFFFFF
  WGPUTextureViewDimension* {.size: sizeof(cint).} = enum
    WGPUTextureViewDimension_Undefined = 0x00000000,
    WGPUTextureViewDimension_1D = 0x00000001,
    WGPUTextureViewDimension_2D = 0x00000002,
    WGPUTextureViewDimension_2DArray = 0x00000003,
    WGPUTextureViewDimension_Cube = 0x00000004,
    WGPUTextureViewDimension_CubeArray = 0x00000005,
    WGPUTextureViewDimension_3D = 0x00000006,
    WGPUTextureViewDimension_Force32 = 0x7FFFFFFF
  WGPUVertexFormat* {.size: sizeof(cint).} = enum
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
  WGPUVertexStepMode* {.size: sizeof(cint).} = enum
    WGPUVertexStepMode_Vertex = 0x00000000,
    WGPUVertexStepMode_Instance = 0x00000001,
    WGPUVertexStepMode_VertexBufferNotUsed = 0x00000002,
    WGPUVertexStepMode_Force32 = 0x7FFFFFFF
  WGPUBufferUsage* {.size: sizeof(cint).} = enum
    WGPUBufferUsage_None = 0x00000000, WGPUBufferUsage_MapRead = 0x00000001,
    WGPUBufferUsage_MapWrite = 0x00000002, WGPUBufferUsage_CopySrc = 0x00000004,
    WGPUBufferUsage_CopyDst = 0x00000008, WGPUBufferUsage_Index = 0x00000010,
    WGPUBufferUsage_Vertex = 0x00000020, WGPUBufferUsage_Uniform = 0x00000040,
    WGPUBufferUsage_Storage = 0x00000080, WGPUBufferUsage_Indirect = 0x00000100,
    WGPUBufferUsage_QueryResolve = 0x00000200,
    WGPUBufferUsage_Force32 = 0x7FFFFFFF
  WGPUBufferUsageFlags* = WGPUFlags
  WGPUColorWriteMask* {.size: sizeof(cint).} = enum
    WGPUColorWriteMask_None = 0x00000000, WGPUColorWriteMask_Red = 0x00000001,
    WGPUColorWriteMask_Green = 0x00000002, WGPUColorWriteMask_Blue = 0x00000004,
    WGPUColorWriteMask_Alpha = 0x00000008, WGPUColorWriteMask_All = 0x0000000F,
    WGPUColorWriteMask_Force32 = 0x7FFFFFFF
  WGPUColorWriteMaskFlags* = WGPUFlags
  WGPUMapMode* {.size: sizeof(cint).} = enum
    WGPUMapMode_None = 0x00000000, WGPUMapMode_Read = 0x00000001,
    WGPUMapMode_Write = 0x00000002, WGPUMapMode_Force32 = 0x7FFFFFFF
  WGPUMapModeFlags* = WGPUFlags
  WGPUShaderStage* {.size: sizeof(cint).} = enum
    WGPUShaderStage_None = 0x00000000, WGPUShaderStage_Vertex = 0x00000001,
    WGPUShaderStage_Fragment = 0x00000002, WGPUShaderStage_Compute = 0x00000004,
    WGPUShaderStage_Force32 = 0x7FFFFFFF
  WGPUShaderStageFlags* = WGPUFlags
  WGPUTextureUsage* {.size: sizeof(cint).} = enum
    WGPUTextureUsage_None = 0x00000000, WGPUTextureUsage_CopySrc = 0x00000001,
    WGPUTextureUsage_CopyDst = 0x00000002,
    WGPUTextureUsage_TextureBinding = 0x00000004,
    WGPUTextureUsage_StorageBinding = 0x00000008,
    WGPUTextureUsage_RenderAttachment = 0x00000010,
    WGPUTextureUsage_Force32 = 0x7FFFFFFF
  WGPUTextureUsageFlags* = WGPUFlags
  WGPUChainedStruct* {.importc: "WGPUChainedStruct",
                       header: "wgpu-native/ffi/webgpu-headers/webgpu.h", bycopy.} = object
    next* {.importc: "next".}: ptr WGPUChainedStruct
    sType* {.importc: "sType".}: WGPUSType

  WGPUChainedStructOut* {.importc: "WGPUChainedStructOut",
                          header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                          bycopy.} = object
    next* {.importc: "next".}: ptr WGPUChainedStructOut
    sType* {.importc: "sType".}: WGPUSType

  WGPUAdapterProperties* {.importc: "WGPUAdapterProperties",
                           header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                           bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStructOut
    vendorID* {.importc: "vendorID".}: uint32
    vendorName* {.importc: "vendorName".}: cstring
    architecture* {.importc: "architecture".}: cstring
    deviceID* {.importc: "deviceID".}: uint32
    name* {.importc: "name".}: cstring
    driverDescription* {.importc: "driverDescription".}: cstring
    adapterType* {.importc: "adapterType".}: WGPUAdapterType
    backendType* {.importc: "backendType".}: WGPUBackendType

  WGPUBindGroupEntry* {.importc: "WGPUBindGroupEntry",
                        header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                        bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    binding* {.importc: "binding".}: uint32
    buffer* {.importc: "buffer".}: WGPUBuffer
    ##  nullable
    offset* {.importc: "offset".}: uint64
    size* {.importc: "size".}: uint64
    sampler* {.importc: "sampler".}: WGPUSampler
    ##  nullable
    textureView* {.importc: "textureView".}: WGPUTextureView
    ##  nullable

  WGPUBlendComponent* {.importc: "WGPUBlendComponent",
                        header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                        bycopy.} = object
    operation* {.importc: "operation".}: WGPUBlendOperation
    srcFactor* {.importc: "srcFactor".}: WGPUBlendFactor
    dstFactor* {.importc: "dstFactor".}: WGPUBlendFactor

  WGPUBufferBindingLayout* {.importc: "WGPUBufferBindingLayout",
                             header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                             bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    `type`* {.importc: "type".}: WGPUBufferBindingType
    hasDynamicOffset* {.importc: "hasDynamicOffset".}: bool
    minBindingSize* {.importc: "minBindingSize".}: uint64

  WGPUBufferDescriptor* {.importc: "WGPUBufferDescriptor",
                          header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                          bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    label* {.importc: "label".}: cstring
    ##  nullable
    usage* {.importc: "usage".}: WGPUBufferUsageFlags
    size* {.importc: "size".}: uint64
    mappedAtCreation* {.importc: "mappedAtCreation".}: bool

  WGPUColor* {.importc: "WGPUColor",
               header: "wgpu-native/ffi/webgpu-headers/webgpu.h", bycopy.} = object
    r* {.importc: "r".}: cdouble
    g* {.importc: "g".}: cdouble
    b* {.importc: "b".}: cdouble
    a* {.importc: "a".}: cdouble

  WGPUCommandBufferDescriptor* {.importc: "WGPUCommandBufferDescriptor", header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                                 bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    label* {.importc: "label".}: cstring
    ##  nullable

  WGPUCommandEncoderDescriptor* {.importc: "WGPUCommandEncoderDescriptor", header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                                  bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    label* {.importc: "label".}: cstring
    ##  nullable

  WGPUCompilationMessage* {.importc: "WGPUCompilationMessage",
                            header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                            bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    message* {.importc: "message".}: cstring
    ##  nullable
    `type`* {.importc: "type".}: WGPUCompilationMessageType
    lineNum* {.importc: "lineNum".}: uint64
    linePos* {.importc: "linePos".}: uint64
    offset* {.importc: "offset".}: uint64
    length* {.importc: "length".}: uint64
    utf16LinePos* {.importc: "utf16LinePos".}: uint64
    utf16Offset* {.importc: "utf16Offset".}: uint64
    utf16Length* {.importc: "utf16Length".}: uint64

  WGPUComputePassTimestampWrite* {.importc: "WGPUComputePassTimestampWrite", header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                                   bycopy.} = object
    querySet* {.importc: "querySet".}: WGPUQuerySet
    queryIndex* {.importc: "queryIndex".}: uint32
    location* {.importc: "location".}: WGPUComputePassTimestampLocation

  WGPUConstantEntry* {.importc: "WGPUConstantEntry",
                       header: "wgpu-native/ffi/webgpu-headers/webgpu.h", bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    key* {.importc: "key".}: cstring
    value* {.importc: "value".}: cdouble

  WGPUExtent3D* {.importc: "WGPUExtent3D",
                  header: "wgpu-native/ffi/webgpu-headers/webgpu.h", bycopy.} = object
    width* {.importc: "width".}: uint32
    height* {.importc: "height".}: uint32
    depthOrArrayLayers* {.importc: "depthOrArrayLayers".}: uint32

  WGPUInstanceDescriptor* {.importc: "WGPUInstanceDescriptor",
                            header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                            bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct

  WGPULimits* {.importc: "WGPULimits",
                header: "wgpu-native/ffi/webgpu-headers/webgpu.h", bycopy.} = object
    maxTextureDimension1D* {.importc: "maxTextureDimension1D".}: uint32
    maxTextureDimension2D* {.importc: "maxTextureDimension2D".}: uint32
    maxTextureDimension3D* {.importc: "maxTextureDimension3D".}: uint32
    maxTextureArrayLayers* {.importc: "maxTextureArrayLayers".}: uint32
    maxBindGroups* {.importc: "maxBindGroups".}: uint32
    maxBindingsPerBindGroup* {.importc: "maxBindingsPerBindGroup".}: uint32
    maxDynamicUniformBuffersPerPipelineLayout*
        {.importc: "maxDynamicUniformBuffersPerPipelineLayout".}: uint32
    maxDynamicStorageBuffersPerPipelineLayout*
        {.importc: "maxDynamicStorageBuffersPerPipelineLayout".}: uint32
    maxSampledTexturesPerShaderStage* {.importc: "maxSampledTexturesPerShaderStage".}: uint32
    maxSamplersPerShaderStage* {.importc: "maxSamplersPerShaderStage".}: uint32
    maxStorageBuffersPerShaderStage* {.importc: "maxStorageBuffersPerShaderStage".}: uint32
    maxStorageTexturesPerShaderStage* {.importc: "maxStorageTexturesPerShaderStage".}: uint32
    maxUniformBuffersPerShaderStage* {.importc: "maxUniformBuffersPerShaderStage".}: uint32
    maxUniformBufferBindingSize* {.importc: "maxUniformBufferBindingSize".}: uint64
    maxStorageBufferBindingSize* {.importc: "maxStorageBufferBindingSize".}: uint64
    minUniformBufferOffsetAlignment* {.importc: "minUniformBufferOffsetAlignment".}: uint32
    minStorageBufferOffsetAlignment* {.importc: "minStorageBufferOffsetAlignment".}: uint32
    maxVertexBuffers* {.importc: "maxVertexBuffers".}: uint32
    maxBufferSize* {.importc: "maxBufferSize".}: uint64
    maxVertexAttributes* {.importc: "maxVertexAttributes".}: uint32
    maxVertexBufferArrayStride* {.importc: "maxVertexBufferArrayStride".}: uint32
    maxInterStageShaderComponents* {.importc: "maxInterStageShaderComponents".}: uint32
    maxInterStageShaderVariables* {.importc: "maxInterStageShaderVariables".}: uint32
    maxColorAttachments* {.importc: "maxColorAttachments".}: uint32
    maxColorAttachmentBytesPerSample* {.importc: "maxColorAttachmentBytesPerSample".}: uint32
    maxComputeWorkgroupStorageSize* {.importc: "maxComputeWorkgroupStorageSize".}: uint32
    maxComputeInvocationsPerWorkgroup* {.
        importc: "maxComputeInvocationsPerWorkgroup".}: uint32
    maxComputeWorkgroupSizeX* {.importc: "maxComputeWorkgroupSizeX".}: uint32
    maxComputeWorkgroupSizeY* {.importc: "maxComputeWorkgroupSizeY".}: uint32
    maxComputeWorkgroupSizeZ* {.importc: "maxComputeWorkgroupSizeZ".}: uint32
    maxComputeWorkgroupsPerDimension* {.importc: "maxComputeWorkgroupsPerDimension".}: uint32

  WGPUMultisampleState* {.importc: "WGPUMultisampleState",
                          header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                          bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    count* {.importc: "count".}: uint32
    mask* {.importc: "mask".}: uint32
    alphaToCoverageEnabled* {.importc: "alphaToCoverageEnabled".}: bool

  WGPUOrigin3D* {.importc: "WGPUOrigin3D",
                  header: "wgpu-native/ffi/webgpu-headers/webgpu.h", bycopy.} = object
    x* {.importc: "x".}: uint32
    y* {.importc: "y".}: uint32
    z* {.importc: "z".}: uint32

  WGPUPipelineLayoutDescriptor* {.importc: "WGPUPipelineLayoutDescriptor", header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                                  bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    label* {.importc: "label".}: cstring
    ##  nullable
    bindGroupLayoutCount* {.importc: "bindGroupLayoutCount".}: uint32
    bindGroupLayouts* {.importc: "bindGroupLayouts".}: ptr WGPUBindGroupLayout




















































##  Can be chained in WGPUPrimitiveState

type
  WGPUPrimitiveDepthClipControl* {.importc: "WGPUPrimitiveDepthClipControl", header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                                   bycopy.} = object
    chain* {.importc: "chain".}: WGPUChainedStruct
    unclippedDepth* {.importc: "unclippedDepth".}: bool

  WGPUPrimitiveState* {.importc: "WGPUPrimitiveState",
                        header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                        bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    topology* {.importc: "topology".}: WGPUPrimitiveTopology
    stripIndexFormat* {.importc: "stripIndexFormat".}: WGPUIndexFormat
    frontFace* {.importc: "frontFace".}: WGPUFrontFace
    cullMode* {.importc: "cullMode".}: WGPUCullMode

  WGPUQuerySetDescriptor* {.importc: "WGPUQuerySetDescriptor",
                            header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                            bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    label* {.importc: "label".}: cstring
    ##  nullable
    `type`* {.importc: "type".}: WGPUQueryType
    count* {.importc: "count".}: uint32
    pipelineStatistics* {.importc: "pipelineStatistics".}: ptr WGPUPipelineStatisticName
    pipelineStatisticsCount* {.importc: "pipelineStatisticsCount".}: uint32

  WGPUQueueDescriptor* {.importc: "WGPUQueueDescriptor",
                         header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                         bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    label* {.importc: "label".}: cstring
    ##  nullable

  WGPURenderBundleDescriptor* {.importc: "WGPURenderBundleDescriptor", header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                                bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    label* {.importc: "label".}: cstring
    ##  nullable

  WGPURenderBundleEncoderDescriptor* {.importc: "WGPURenderBundleEncoderDescriptor", header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                                       bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    label* {.importc: "label".}: cstring
    ##  nullable
    colorFormatsCount* {.importc: "colorFormatsCount".}: uint32
    colorFormats* {.importc: "colorFormats".}: ptr WGPUTextureFormat
    depthStencilFormat* {.importc: "depthStencilFormat".}: WGPUTextureFormat
    sampleCount* {.importc: "sampleCount".}: uint32
    depthReadOnly* {.importc: "depthReadOnly".}: bool
    stencilReadOnly* {.importc: "stencilReadOnly".}: bool

  WGPURenderPassDepthStencilAttachment* {.
      importc: "WGPURenderPassDepthStencilAttachment",
      header: "wgpu-native/ffi/webgpu-headers/webgpu.h", bycopy.} = object
    view* {.importc: "view".}: WGPUTextureView
    depthLoadOp* {.importc: "depthLoadOp".}: WGPULoadOp
    depthStoreOp* {.importc: "depthStoreOp".}: WGPUStoreOp
    depthClearValue* {.importc: "depthClearValue".}: cfloat
    depthReadOnly* {.importc: "depthReadOnly".}: bool
    stencilLoadOp* {.importc: "stencilLoadOp".}: WGPULoadOp
    stencilStoreOp* {.importc: "stencilStoreOp".}: WGPUStoreOp
    stencilClearValue* {.importc: "stencilClearValue".}: uint32
    stencilReadOnly* {.importc: "stencilReadOnly".}: bool


##  Can be chained in WGPURenderPassDescriptor

type
  WGPURenderPassDescriptorMaxDrawCount* {.
      importc: "WGPURenderPassDescriptorMaxDrawCount",
      header: "wgpu-native/ffi/webgpu-headers/webgpu.h", bycopy.} = object
    chain* {.importc: "chain".}: WGPUChainedStruct
    maxDrawCount* {.importc: "maxDrawCount".}: uint64

  WGPURenderPassTimestampWrite* {.importc: "WGPURenderPassTimestampWrite", header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                                  bycopy.} = object
    querySet* {.importc: "querySet".}: WGPUQuerySet
    queryIndex* {.importc: "queryIndex".}: uint32
    location* {.importc: "location".}: WGPURenderPassTimestampLocation

  WGPURequestAdapterOptions* {.importc: "WGPURequestAdapterOptions", header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                               bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    compatibleSurface* {.importc: "compatibleSurface".}: WGPUSurface
    ##  nullable
    powerPreference* {.importc: "powerPreference".}: WGPUPowerPreference
    forceFallbackAdapter* {.importc: "forceFallbackAdapter".}: bool

  WGPUSamplerBindingLayout* {.importc: "WGPUSamplerBindingLayout", header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                              bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    `type`* {.importc: "type".}: WGPUSamplerBindingType

  WGPUSamplerDescriptor* {.importc: "WGPUSamplerDescriptor",
                           header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                           bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    label* {.importc: "label".}: cstring
    ##  nullable
    addressModeU* {.importc: "addressModeU".}: WGPUAddressMode
    addressModeV* {.importc: "addressModeV".}: WGPUAddressMode
    addressModeW* {.importc: "addressModeW".}: WGPUAddressMode
    magFilter* {.importc: "magFilter".}: WGPUFilterMode
    minFilter* {.importc: "minFilter".}: WGPUFilterMode
    mipmapFilter* {.importc: "mipmapFilter".}: WGPUMipmapFilterMode
    lodMinClamp* {.importc: "lodMinClamp".}: cfloat
    lodMaxClamp* {.importc: "lodMaxClamp".}: cfloat
    compare* {.importc: "compare".}: WGPUCompareFunction
    maxAnisotropy* {.importc: "maxAnisotropy".}: uint16

  WGPUShaderModuleCompilationHint* {.importc: "WGPUShaderModuleCompilationHint", header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                                     bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    entryPoint* {.importc: "entryPoint".}: cstring
    layout* {.importc: "layout".}: WGPUPipelineLayout


##  Can be chained in WGPUShaderModuleDescriptor

type
  WGPUShaderModuleSPIRVDescriptor* {.importc: "WGPUShaderModuleSPIRVDescriptor", header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                                     bycopy.} = object
    chain* {.importc: "chain".}: WGPUChainedStruct
    codeSize* {.importc: "codeSize".}: uint32
    code* {.importc: "code".}: ptr uint32


##  Can be chained in WGPUShaderModuleDescriptor

type
  WGPUShaderModuleWGSLDescriptor* {.importc: "WGPUShaderModuleWGSLDescriptor", header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                                    bycopy.} = object
    chain* {.importc: "chain".}: WGPUChainedStruct
    code* {.importc: "code".}: cstring

  WGPUStencilFaceState* {.importc: "WGPUStencilFaceState",
                          header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                          bycopy.} = object
    compare* {.importc: "compare".}: WGPUCompareFunction
    failOp* {.importc: "failOp".}: WGPUStencilOperation
    depthFailOp* {.importc: "depthFailOp".}: WGPUStencilOperation
    passOp* {.importc: "passOp".}: WGPUStencilOperation

  WGPUStorageTextureBindingLayout* {.importc: "WGPUStorageTextureBindingLayout", header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                                     bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    access* {.importc: "access".}: WGPUStorageTextureAccess
    format* {.importc: "format".}: WGPUTextureFormat
    viewDimension* {.importc: "viewDimension".}: WGPUTextureViewDimension

  WGPUSurfaceDescriptor* {.importc: "WGPUSurfaceDescriptor",
                           header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                           bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    label* {.importc: "label".}: cstring
    ##  nullable


##  Can be chained in WGPUSurfaceDescriptor

type
  WGPUSurfaceDescriptorFromAndroidNativeWindow* {.
      importc: "WGPUSurfaceDescriptorFromAndroidNativeWindow",
      header: "wgpu-native/ffi/webgpu-headers/webgpu.h", bycopy.} = object
    chain* {.importc: "chain".}: WGPUChainedStruct
    window* {.importc: "window".}: pointer


##  Can be chained in WGPUSurfaceDescriptor

type
  WGPUSurfaceDescriptorFromCanvasHTMLSelector* {.
      importc: "WGPUSurfaceDescriptorFromCanvasHTMLSelector",
      header: "wgpu-native/ffi/webgpu-headers/webgpu.h", bycopy.} = object
    chain* {.importc: "chain".}: WGPUChainedStruct
    selector* {.importc: "selector".}: cstring


##  Can be chained in WGPUSurfaceDescriptor

type
  WGPUSurfaceDescriptorFromMetalLayer* {.
      importc: "WGPUSurfaceDescriptorFromMetalLayer",
      header: "wgpu-native/ffi/webgpu-headers/webgpu.h", bycopy.} = object
    chain* {.importc: "chain".}: WGPUChainedStruct
    layer* {.importc: "layer".}: pointer


##  Can be chained in WGPUSurfaceDescriptor

type
  WGPUSurfaceDescriptorFromWaylandSurface* {.
      importc: "WGPUSurfaceDescriptorFromWaylandSurface",
      header: "wgpu-native/ffi/webgpu-headers/webgpu.h", bycopy.} = object
    chain* {.importc: "chain".}: WGPUChainedStruct
    display* {.importc: "display".}: pointer
    surface* {.importc: "surface".}: pointer


##  Can be chained in WGPUSurfaceDescriptor

type
  WGPUSurfaceDescriptorFromWindowsHWND* {.
      importc: "WGPUSurfaceDescriptorFromWindowsHWND",
      header: "wgpu-native/ffi/webgpu-headers/webgpu.h", bycopy.} = object
    chain* {.importc: "chain".}: WGPUChainedStruct
    hinstance* {.importc: "hinstance".}: pointer
    hwnd* {.importc: "hwnd".}: pointer


##  Can be chained in WGPUSurfaceDescriptor

type
  WGPUSurfaceDescriptorFromXcbWindow* {.importc: "WGPUSurfaceDescriptorFromXcbWindow", header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                                        bycopy.} = object
    chain* {.importc: "chain".}: WGPUChainedStruct
    connection* {.importc: "connection".}: pointer
    window* {.importc: "window".}: uint32


##  Can be chained in WGPUSurfaceDescriptor

type
  WGPUSurfaceDescriptorFromXlibWindow* {.
      importc: "WGPUSurfaceDescriptorFromXlibWindow",
      header: "wgpu-native/ffi/webgpu-headers/webgpu.h", bycopy.} = object
    chain* {.importc: "chain".}: WGPUChainedStruct
    display* {.importc: "display".}: pointer
    window* {.importc: "window".}: uint32

  WGPUSwapChainDescriptor* {.importc: "WGPUSwapChainDescriptor",
                             header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                             bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    label* {.importc: "label".}: cstring
    ##  nullable
    usage* {.importc: "usage".}: WGPUTextureUsageFlags
    format* {.importc: "format".}: WGPUTextureFormat
    width* {.importc: "width".}: uint32
    height* {.importc: "height".}: uint32
    presentMode* {.importc: "presentMode".}: WGPUPresentMode

  WGPUTextureBindingLayout* {.importc: "WGPUTextureBindingLayout", header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                              bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    sampleType* {.importc: "sampleType".}: WGPUTextureSampleType
    viewDimension* {.importc: "viewDimension".}: WGPUTextureViewDimension
    multisampled* {.importc: "multisampled".}: bool

  WGPUTextureDataLayout* {.importc: "WGPUTextureDataLayout",
                           header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                           bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    offset* {.importc: "offset".}: uint64
    bytesPerRow* {.importc: "bytesPerRow".}: uint32
    rowsPerImage* {.importc: "rowsPerImage".}: uint32

  WGPUTextureViewDescriptor* {.importc: "WGPUTextureViewDescriptor", header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                               bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    label* {.importc: "label".}: cstring
    ##  nullable
    format* {.importc: "format".}: WGPUTextureFormat
    dimension* {.importc: "dimension".}: WGPUTextureViewDimension
    baseMipLevel* {.importc: "baseMipLevel".}: uint32
    mipLevelCount* {.importc: "mipLevelCount".}: uint32
    baseArrayLayer* {.importc: "baseArrayLayer".}: uint32
    arrayLayerCount* {.importc: "arrayLayerCount".}: uint32
    aspect* {.importc: "aspect".}: WGPUTextureAspect

  WGPUVertexAttribute* {.importc: "WGPUVertexAttribute",
                         header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                         bycopy.} = object
    format* {.importc: "format".}: WGPUVertexFormat
    offset* {.importc: "offset".}: uint64
    shaderLocation* {.importc: "shaderLocation".}: uint32

  WGPUBindGroupDescriptor* {.importc: "WGPUBindGroupDescriptor",
                             header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                             bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    label* {.importc: "label".}: cstring
    ##  nullable
    layout* {.importc: "layout".}: WGPUBindGroupLayout
    entryCount* {.importc: "entryCount".}: uint32
    entries* {.importc: "entries".}: ptr WGPUBindGroupEntry

  WGPUBindGroupLayoutEntry* {.importc: "WGPUBindGroupLayoutEntry", header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                              bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    binding* {.importc: "binding".}: uint32
    visibility* {.importc: "visibility".}: WGPUShaderStageFlags
    buffer* {.importc: "buffer".}: WGPUBufferBindingLayout
    sampler* {.importc: "sampler".}: WGPUSamplerBindingLayout
    texture* {.importc: "texture".}: WGPUTextureBindingLayout
    storageTexture* {.importc: "storageTexture".}: WGPUStorageTextureBindingLayout

  WGPUBlendState* {.importc: "WGPUBlendState",
                    header: "wgpu-native/ffi/webgpu-headers/webgpu.h", bycopy.} = object
    color* {.importc: "color".}: WGPUBlendComponent
    alpha* {.importc: "alpha".}: WGPUBlendComponent

  WGPUCompilationInfo* {.importc: "WGPUCompilationInfo",
                         header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                         bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    messageCount* {.importc: "messageCount".}: uint32
    messages* {.importc: "messages".}: ptr WGPUCompilationMessage

  WGPUComputePassDescriptor* {.importc: "WGPUComputePassDescriptor", header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                               bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    label* {.importc: "label".}: cstring
    ##  nullable
    timestampWriteCount* {.importc: "timestampWriteCount".}: uint32
    timestampWrites* {.importc: "timestampWrites".}: ptr WGPUComputePassTimestampWrite

  WGPUDepthStencilState* {.importc: "WGPUDepthStencilState",
                           header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                           bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    format* {.importc: "format".}: WGPUTextureFormat
    depthWriteEnabled* {.importc: "depthWriteEnabled".}: bool
    depthCompare* {.importc: "depthCompare".}: WGPUCompareFunction
    stencilFront* {.importc: "stencilFront".}: WGPUStencilFaceState
    stencilBack* {.importc: "stencilBack".}: WGPUStencilFaceState
    stencilReadMask* {.importc: "stencilReadMask".}: uint32
    stencilWriteMask* {.importc: "stencilWriteMask".}: uint32
    depthBias* {.importc: "depthBias".}: int32
    depthBiasSlopeScale* {.importc: "depthBiasSlopeScale".}: cfloat
    depthBiasClamp* {.importc: "depthBiasClamp".}: cfloat

  WGPUImageCopyBuffer* {.importc: "WGPUImageCopyBuffer",
                         header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                         bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    layout* {.importc: "layout".}: WGPUTextureDataLayout
    buffer* {.importc: "buffer".}: WGPUBuffer

  WGPUImageCopyTexture* {.importc: "WGPUImageCopyTexture",
                          header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                          bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    texture* {.importc: "texture".}: WGPUTexture
    mipLevel* {.importc: "mipLevel".}: uint32
    origin* {.importc: "origin".}: WGPUOrigin3D
    aspect* {.importc: "aspect".}: WGPUTextureAspect

  WGPUProgrammableStageDescriptor* {.importc: "WGPUProgrammableStageDescriptor", header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                                     bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    module* {.importc: "module".}: WGPUShaderModule
    entryPoint* {.importc: "entryPoint".}: cstring
    constantCount* {.importc: "constantCount".}: uint32
    constants* {.importc: "constants".}: ptr WGPUConstantEntry

  WGPURenderPassColorAttachment* {.importc: "WGPURenderPassColorAttachment", header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                                   bycopy.} = object
    view* {.importc: "view".}: WGPUTextureView
    ##  nullable
    resolveTarget* {.importc: "resolveTarget".}: WGPUTextureView
    ##  nullable
    loadOp* {.importc: "loadOp".}: WGPULoadOp
    storeOp* {.importc: "storeOp".}: WGPUStoreOp
    clearValue* {.importc: "clearValue".}: WGPUColor

  WGPURequiredLimits* {.importc: "WGPURequiredLimits",
                        header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                        bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    limits* {.importc: "limits".}: WGPULimits

  WGPUShaderModuleDescriptor* {.importc: "WGPUShaderModuleDescriptor", header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                                bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    label* {.importc: "label".}: cstring
    ##  nullable
    hintCount* {.importc: "hintCount".}: uint32
    hints* {.importc: "hints".}: ptr WGPUShaderModuleCompilationHint

  WGPUSupportedLimits* {.importc: "WGPUSupportedLimits",
                         header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                         bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStructOut
    limits* {.importc: "limits".}: WGPULimits

  WGPUTextureDescriptor* {.importc: "WGPUTextureDescriptor",
                           header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                           bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    label* {.importc: "label".}: cstring
    ##  nullable
    usage* {.importc: "usage".}: WGPUTextureUsageFlags
    dimension* {.importc: "dimension".}: WGPUTextureDimension
    size* {.importc: "size".}: WGPUExtent3D
    format* {.importc: "format".}: WGPUTextureFormat
    mipLevelCount* {.importc: "mipLevelCount".}: uint32
    sampleCount* {.importc: "sampleCount".}: uint32
    viewFormatCount* {.importc: "viewFormatCount".}: uint32
    viewFormats* {.importc: "viewFormats".}: ptr WGPUTextureFormat

  WGPUVertexBufferLayout* {.importc: "WGPUVertexBufferLayout",
                            header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                            bycopy.} = object
    arrayStride* {.importc: "arrayStride".}: uint64
    stepMode* {.importc: "stepMode".}: WGPUVertexStepMode
    attributeCount* {.importc: "attributeCount".}: uint32
    attributes* {.importc: "attributes".}: ptr WGPUVertexAttribute

  WGPUBindGroupLayoutDescriptor* {.importc: "WGPUBindGroupLayoutDescriptor", header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                                   bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    label* {.importc: "label".}: cstring
    ##  nullable
    entryCount* {.importc: "entryCount".}: uint32
    entries* {.importc: "entries".}: ptr WGPUBindGroupLayoutEntry

  WGPUColorTargetState* {.importc: "WGPUColorTargetState",
                          header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                          bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    format* {.importc: "format".}: WGPUTextureFormat
    blend* {.importc: "blend".}: ptr WGPUBlendState
    ##  nullable
    writeMask* {.importc: "writeMask".}: WGPUColorWriteMaskFlags

  WGPUComputePipelineDescriptor* {.importc: "WGPUComputePipelineDescriptor", header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                                   bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    label* {.importc: "label".}: cstring
    ##  nullable
    layout* {.importc: "layout".}: WGPUPipelineLayout
    ##  nullable
    compute* {.importc: "compute".}: WGPUProgrammableStageDescriptor

  WGPUDeviceDescriptor* {.importc: "WGPUDeviceDescriptor",
                          header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                          bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    label* {.importc: "label".}: cstring
    ##  nullable
    requiredFeaturesCount* {.importc: "requiredFeaturesCount".}: uint32
    requiredFeatures* {.importc: "requiredFeatures".}: ptr WGPUFeatureName
    requiredLimits* {.importc: "requiredLimits".}: ptr WGPURequiredLimits
    ##  nullable
    defaultQueue* {.importc: "defaultQueue".}: WGPUQueueDescriptor

  WGPURenderPassDescriptor* {.importc: "WGPURenderPassDescriptor", header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                              bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    label* {.importc: "label".}: cstring
    ##  nullable
    colorAttachmentCount* {.importc: "colorAttachmentCount".}: uint32
    colorAttachments* {.importc: "colorAttachments".}: ptr WGPURenderPassColorAttachment
    depthStencilAttachment* {.importc: "depthStencilAttachment".}: ptr WGPURenderPassDepthStencilAttachment
    ##  nullable
    occlusionQuerySet* {.importc: "occlusionQuerySet".}: WGPUQuerySet
    ##  nullable
    timestampWriteCount* {.importc: "timestampWriteCount".}: uint32
    timestampWrites* {.importc: "timestampWrites".}: ptr WGPURenderPassTimestampWrite

  WGPUVertexState* {.importc: "WGPUVertexState",
                     header: "wgpu-native/ffi/webgpu-headers/webgpu.h", bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    module* {.importc: "module".}: WGPUShaderModule
    entryPoint* {.importc: "entryPoint".}: cstring
    constantCount* {.importc: "constantCount".}: uint32
    constants* {.importc: "constants".}: ptr WGPUConstantEntry
    bufferCount* {.importc: "bufferCount".}: uint32
    buffers* {.importc: "buffers".}: ptr WGPUVertexBufferLayout

  WGPUFragmentState* {.importc: "WGPUFragmentState",
                       header: "wgpu-native/ffi/webgpu-headers/webgpu.h", bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    module* {.importc: "module".}: WGPUShaderModule
    entryPoint* {.importc: "entryPoint".}: cstring
    constantCount* {.importc: "constantCount".}: uint32
    constants* {.importc: "constants".}: ptr WGPUConstantEntry
    targetCount* {.importc: "targetCount".}: uint32
    targets* {.importc: "targets".}: ptr WGPUColorTargetState

  WGPURenderPipelineDescriptor* {.importc: "WGPURenderPipelineDescriptor", header: "wgpu-native/ffi/webgpu-headers/webgpu.h",
                                  bycopy.} = object
    nextInChain* {.importc: "nextInChain".}: ptr WGPUChainedStruct
    label* {.importc: "label".}: cstring
    ##  nullable
    layout* {.importc: "layout".}: WGPUPipelineLayout
    ##  nullable
    vertex* {.importc: "vertex".}: WGPUVertexState
    primitive* {.importc: "primitive".}: WGPUPrimitiveState
    depthStencil* {.importc: "depthStencil".}: ptr WGPUDepthStencilState
    ##  nullable
    multisample* {.importc: "multisample".}: WGPUMultisampleState
    fragment* {.importc: "fragment".}: ptr WGPUFragmentState
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