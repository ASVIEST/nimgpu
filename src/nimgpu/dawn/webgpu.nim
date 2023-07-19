{.experimental: "codeReordering".}

const includePaths =
    "-I '/home/runner/work/nimgpu/nimgpu/generator/dawn/out/gen/include' " &
    "-I '/home/runner/work/nimgpu/nimgpu/generator/dawn/include' "

{.compile(
    "/home/runner/work/nimgpu/nimgpu/generator/dawn/out/gen/src/dawn/dawn_proc.c",
    includePaths
).}


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
  WGPUAlphaMode* = enum
    WGPUAlphaMode_Premultiplied = 0x00000000,
    WGPUAlphaMode_Unpremultiplied = 0x00000001,
    WGPUAlphaMode_Opaque = 0x00000002, WGPUAlphaMode_Force32 = 0x7FFFFFFF
  WGPUBackendType* = enum
    WGPUBackendType_Undefined = 0x00000000, WGPUBackendType_Null = 0x00000001,
    WGPUBackendType_WebGPU = 0x00000002, WGPUBackendType_D3D11 = 0x00000003,
    WGPUBackendType_D3D12 = 0x00000004, WGPUBackendType_Metal = 0x00000005,
    WGPUBackendType_Vulkan = 0x00000006, WGPUBackendType_OpenGL = 0x00000007,
    WGPUBackendType_OpenGLES = 0x00000008, WGPUBackendType_Force32 = 0x7FFFFFFF
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
    WGPUBufferMapAsyncStatus_ValidationError = 0x00000001,
    WGPUBufferMapAsyncStatus_Unknown = 0x00000002,
    WGPUBufferMapAsyncStatus_DeviceLost = 0x00000003,
    WGPUBufferMapAsyncStatus_DestroyedBeforeCallback = 0x00000004,
    WGPUBufferMapAsyncStatus_UnmappedBeforeCallback = 0x00000005,
    WGPUBufferMapAsyncStatus_MappingAlreadyPending = 0x00000006,
    WGPUBufferMapAsyncStatus_OffsetOutOfRange = 0x00000007,
    WGPUBufferMapAsyncStatus_SizeOutOfRange = 0x00000008,
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
  WGPUExternalTextureRotation* = enum
    WGPUExternalTextureRotation_Rotate0Degrees = 0x00000000,
    WGPUExternalTextureRotation_Rotate90Degrees = 0x00000001,
    WGPUExternalTextureRotation_Rotate180Degrees = 0x00000002,
    WGPUExternalTextureRotation_Rotate270Degrees = 0x00000003,
    WGPUExternalTextureRotation_Force32 = 0x7FFFFFFF
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
    WGPUFeatureName_Float32Filterable = 0x0000000C,
    WGPUFeatureName_DawnShaderFloat16 = 0x000003E9,
    WGPUFeatureName_DawnInternalUsages = 0x000003EA,
    WGPUFeatureName_DawnMultiPlanarFormats = 0x000003EB,
    WGPUFeatureName_DawnNative = 0x000003EC,
    WGPUFeatureName_ChromiumExperimentalDp4a = 0x000003ED,
    WGPUFeatureName_TimestampQueryInsidePasses = 0x000003EE,
    WGPUFeatureName_ImplicitDeviceSynchronization = 0x000003EF,
    WGPUFeatureName_SurfaceCapabilities = 0x000003F0,
    WGPUFeatureName_TransientAttachments = 0x000003F1,
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
  WGPULoggingType* = enum
    WGPULoggingType_Verbose = 0x00000000, WGPULoggingType_Info = 0x00000001,
    WGPULoggingType_Warning = 0x00000002, WGPULoggingType_Error = 0x00000003,
    WGPULoggingType_Force32 = 0x7FFFFFFF
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
    WGPUSType_SurfaceDescriptorFromWindowsCoreWindow = 0x0000000B,
    WGPUSType_ExternalTextureBindingEntry = 0x0000000C,
    WGPUSType_ExternalTextureBindingLayout = 0x0000000D,
    WGPUSType_SurfaceDescriptorFromWindowsSwapChainPanel = 0x0000000E,
    WGPUSType_RenderPassDescriptorMaxDrawCount = 0x0000000F,
    WGPUSType_DawnTextureInternalUsageDescriptor = 0x000003E8,
    WGPUSType_DawnEncoderInternalUsageDescriptor = 0x000003EB,
    WGPUSType_DawnInstanceDescriptor = 0x000003EC,
    WGPUSType_DawnCacheDeviceDescriptor = 0x000003ED,
    WGPUSType_DawnAdapterPropertiesPowerPreference = 0x000003EE,
    WGPUSType_DawnBufferDescriptorErrorInfoFromWireClient = 0x000003EF,
    WGPUSType_DawnTogglesDescriptor = 0x000003F0,
    WGPUSType_DawnShaderModuleSPIRVOptionsDescriptor = 0x000003F1,
    WGPUSType_RequestAdapterOptionsLUID = 0x000003F2,
    WGPUSType_RequestAdapterOptionsGetGLProc = 0x000003F3,
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
    WGPUTextureAspect_Plane0Only = 0x00000003,
    WGPUTextureAspect_Plane1Only = 0x00000004,
    WGPUTextureAspect_Force32 = 0x7FFFFFFF
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
    WGPUTextureFormat_R8BG8Biplanar420Unorm = 0x0000005F,
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
    WGPUTextureUsage_TransientAttachment = 0x00000020,
    WGPUTextureUsage_Force32 = 0x7FFFFFFF
  WGPUTextureUsageFlags* = WGPUFlags
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
  WGPULoggingCallback* = proc (`type`: WGPULoggingType; message: cstring;
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
    compatibilityMode*: bool

  WGPUBindGroupEntry* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    binding*: uint32
    buffer*: WGPUBuffer
    offset*: uint64
    size*: uint64
    sampler*: WGPUSampler
    textureView*: WGPUTextureView

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

  WGPUCommandEncoderDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring

  WGPUCompilationMessage* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    message*: cstring
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

  WGPUCopyTextureForBrowserOptions* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    flipY*: bool
    needsColorSpaceConversion*: bool
    srcAlphaMode*: WGPUAlphaMode
    srcTransferFunctionParameters*: ptr cfloat
    conversionMatrix*: ptr cfloat
    dstTransferFunctionParameters*: ptr cfloat
    dstAlphaMode*: WGPUAlphaMode
    internalUsage*: bool






















































##  Can be chained in WGPUAdapterProperties

type
  WGPUDawnAdapterPropertiesPowerPreference* {.bycopy.} = object
    chain*: WGPUChainedStructOut
    powerPreference*: WGPUPowerPreference


##  Can be chained in WGPUBufferDescriptor

type
  WGPUDawnBufferDescriptorErrorInfoFromWireClient* {.bycopy.} = object
    chain*: WGPUChainedStruct
    outOfMemory*: bool


##  Can be chained in WGPUDeviceDescriptor

type
  WGPUDawnCacheDeviceDescriptor* {.bycopy.} = object
    chain*: WGPUChainedStruct
    isolationKey*: cstring


##  Can be chained in WGPUCommandEncoderDescriptor

type
  WGPUDawnEncoderInternalUsageDescriptor* {.bycopy.} = object
    chain*: WGPUChainedStruct
    useInternalUsages*: bool


##  Can be chained in WGPUShaderModuleDescriptor

type
  WGPUDawnShaderModuleSPIRVOptionsDescriptor* {.bycopy.} = object
    chain*: WGPUChainedStruct
    allowNonUniformDerivatives*: bool


##  Can be chained in WGPUTextureDescriptor

type
  WGPUDawnTextureInternalUsageDescriptor* {.bycopy.} = object
    chain*: WGPUChainedStruct
    internalUsage*: WGPUTextureUsageFlags


##  Can be chained in WGPUInstanceDescriptor
##  Can be chained in WGPURequestAdapterOptions
##  Can be chained in WGPUDeviceDescriptor

type
  WGPUDawnTogglesDescriptor* {.bycopy.} = object
    chain*: WGPUChainedStruct
    enabledTogglesCount*: csize_t
    enabledToggles*: cstringArray
    disabledTogglesCount*: csize_t
    disabledToggles*: cstringArray

  WGPUExtent2D* {.bycopy.} = object
    width*: uint32
    height*: uint32

  WGPUExtent3D* {.bycopy.} = object
    width*: uint32
    height*: uint32
    depthOrArrayLayers*: uint32


##  Can be chained in WGPUBindGroupEntry

type
  WGPUExternalTextureBindingEntry* {.bycopy.} = object
    chain*: WGPUChainedStruct
    externalTexture*: WGPUExternalTexture


##  Can be chained in WGPUBindGroupLayoutEntry

type
  WGPUExternalTextureBindingLayout* {.bycopy.} = object
    chain*: WGPUChainedStruct

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

  WGPUOrigin2D* {.bycopy.} = object
    x*: uint32
    y*: uint32

  WGPUOrigin3D* {.bycopy.} = object
    x*: uint32
    y*: uint32
    z*: uint32

  WGPUPipelineLayoutDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring
    bindGroupLayoutCount*: csize_t
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
    `type`*: WGPUQueryType
    count*: uint32
    pipelineStatistics*: ptr WGPUPipelineStatisticName
    pipelineStatisticsCount*: csize_t

  WGPUQueueDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring

  WGPURenderBundleDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring

  WGPURenderBundleEncoderDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring
    colorFormatsCount*: csize_t
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
    powerPreference*: WGPUPowerPreference
    backendType*: WGPUBackendType
    forceFallbackAdapter*: bool
    compatibilityMode*: bool

  WGPUSamplerBindingLayout* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    `type`*: WGPUSamplerBindingType

  WGPUSamplerDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring
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

  WGPUShaderModuleDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring


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
  WGPUSurfaceDescriptorFromWindowsCoreWindow* {.bycopy.} = object
    chain*: WGPUChainedStruct
    coreWindow*: pointer


##  Can be chained in WGPUSurfaceDescriptor

type
  WGPUSurfaceDescriptorFromWindowsHWND* {.bycopy.} = object
    chain*: WGPUChainedStruct
    hinstance*: pointer
    hwnd*: pointer


##  Can be chained in WGPUSurfaceDescriptor

type
  WGPUSurfaceDescriptorFromWindowsSwapChainPanel* {.bycopy.} = object
    chain*: WGPUChainedStruct
    swapChainPanel*: pointer


##  Can be chained in WGPUSurfaceDescriptor

type
  WGPUSurfaceDescriptorFromXlibWindow* {.bycopy.} = object
    chain*: WGPUChainedStruct
    display*: pointer
    window*: uint32

  WGPUSwapChainDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring
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
    layout*: WGPUBindGroupLayout
    entryCount*: csize_t
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
    messageCount*: csize_t
    messages*: ptr WGPUCompilationMessage

  WGPUComputePassDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring
    timestampWriteCount*: csize_t
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

  WGPUExternalTextureDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring
    plane0*: WGPUTextureView
    plane1*: WGPUTextureView
    visibleOrigin*: WGPUOrigin2D
    visibleSize*: WGPUExtent2D
    doYuvToRgbConversionOnly*: bool
    yuvToRgbConversionMatrix*: ptr cfloat
    srcTransferFunctionParameters*: ptr cfloat
    dstTransferFunctionParameters*: ptr cfloat
    gamutConversionMatrix*: ptr cfloat
    flipY*: bool
    rotation*: WGPUExternalTextureRotation

  WGPUImageCopyBuffer* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    layout*: WGPUTextureDataLayout
    buffer*: WGPUBuffer

  WGPUImageCopyExternalTexture* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    externalTexture*: WGPUExternalTexture
    origin*: WGPUOrigin3D
    naturalSize*: WGPUExtent2D

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
    constantCount*: csize_t
    constants*: ptr WGPUConstantEntry

  WGPURenderPassColorAttachment* {.bycopy.} = object
    view*: WGPUTextureView
    resolveTarget*: WGPUTextureView
    loadOp*: WGPULoadOp
    storeOp*: WGPUStoreOp
    clearValue*: WGPUColor

  WGPURequiredLimits* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    limits*: WGPULimits

  WGPUSupportedLimits* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStructOut
    limits*: WGPULimits

  WGPUTextureDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring
    usage*: WGPUTextureUsageFlags
    dimension*: WGPUTextureDimension
    size*: WGPUExtent3D
    format*: WGPUTextureFormat
    mipLevelCount*: uint32
    sampleCount*: uint32
    viewFormatCount*: csize_t
    viewFormats*: ptr WGPUTextureFormat

  WGPUVertexBufferLayout* {.bycopy.} = object
    arrayStride*: uint64
    stepMode*: WGPUVertexStepMode
    attributeCount*: csize_t
    attributes*: ptr WGPUVertexAttribute

  WGPUBindGroupLayoutDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring
    entryCount*: csize_t
    entries*: ptr WGPUBindGroupLayoutEntry

  WGPUColorTargetState* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    format*: WGPUTextureFormat
    blend*: ptr WGPUBlendState
    writeMask*: WGPUColorWriteMaskFlags

  WGPUComputePipelineDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring
    layout*: WGPUPipelineLayout
    compute*: WGPUProgrammableStageDescriptor

  WGPUDeviceDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring
    requiredFeaturesCount*: csize_t
    requiredFeatures*: ptr WGPUFeatureName
    requiredLimits*: ptr WGPURequiredLimits
    defaultQueue*: WGPUQueueDescriptor
    deviceLostCallback*: WGPUDeviceLostCallback
    deviceLostUserdata*: pointer

  WGPURenderPassDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring
    colorAttachmentCount*: csize_t
    colorAttachments*: ptr WGPURenderPassColorAttachment
    depthStencilAttachment*: ptr WGPURenderPassDepthStencilAttachment
    occlusionQuerySet*: WGPUQuerySet
    timestampWriteCount*: csize_t
    timestampWrites*: ptr WGPURenderPassTimestampWrite

  WGPUVertexState* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    module*: WGPUShaderModule
    entryPoint*: cstring
    constantCount*: csize_t
    constants*: ptr WGPUConstantEntry
    bufferCount*: csize_t
    buffers*: ptr WGPUVertexBufferLayout

  WGPUFragmentState* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    module*: WGPUShaderModule
    entryPoint*: cstring
    constantCount*: csize_t
    constants*: ptr WGPUConstantEntry
    targetCount*: csize_t
    targets*: ptr WGPUColorTargetState

  WGPURenderPipelineDescriptor* {.bycopy.} = object
    nextInChain*: ptr WGPUChainedStruct
    label*: cstring
    layout*: WGPUPipelineLayout
    vertex*: WGPUVertexState
    primitive*: WGPUPrimitiveState
    depthStencil*: ptr WGPUDepthStencilState
    multisample*: WGPUMultisampleState
    fragment*: ptr WGPUFragmentState


when not defined(WGPU_SKIP_PROCS):
  type
    WGPUProcCreateInstance* = proc (descriptor: ptr WGPUInstanceDescriptor): WGPUInstance
    WGPUProcGetProcAddress* = proc (device: WGPUDevice; procName: cstring): WGPUProc
  ##  Procs of Adapter
  type
    WGPUProcAdapterCreateDevice* = proc (adapter: WGPUAdapter;
        descriptor: ptr WGPUDeviceDescriptor): WGPUDevice
    WGPUProcAdapterEnumerateFeatures* = proc (adapter: WGPUAdapter;
        features: ptr WGPUFeatureName): csize_t
    WGPUProcAdapterGetInstance* = proc (adapter: WGPUAdapter): WGPUInstance
    WGPUProcAdapterGetLimits* = proc (adapter: WGPUAdapter;
                                      limits: ptr WGPUSupportedLimits): bool
    WGPUProcAdapterGetProperties* = proc (adapter: WGPUAdapter;
        properties: ptr WGPUAdapterProperties)
    WGPUProcAdapterHasFeature* = proc (adapter: WGPUAdapter;
                                       feature: WGPUFeatureName): bool
    WGPUProcAdapterRequestDevice* = proc (adapter: WGPUAdapter;
        descriptor: ptr WGPUDeviceDescriptor;
        callback: WGPURequestDeviceCallback; userdata: pointer)
    WGPUProcAdapterReference* = proc (adapter: WGPUAdapter)
    WGPUProcAdapterRelease* = proc (adapter: WGPUAdapter)
  ##  Procs of BindGroup
  type
    WGPUProcBindGroupSetLabel* = proc (bindGroup: WGPUBindGroup; label: cstring)
    WGPUProcBindGroupReference* = proc (bindGroup: WGPUBindGroup)
    WGPUProcBindGroupRelease* = proc (bindGroup: WGPUBindGroup)
  ##  Procs of BindGroupLayout
  type
    WGPUProcBindGroupLayoutSetLabel* = proc (
        bindGroupLayout: WGPUBindGroupLayout; label: cstring)
    WGPUProcBindGroupLayoutReference* = proc (
        bindGroupLayout: WGPUBindGroupLayout)
    WGPUProcBindGroupLayoutRelease* = proc (bindGroupLayout: WGPUBindGroupLayout)
  ##  Procs of Buffer
  type
    WGPUProcBufferDestroy* = proc (buffer: WGPUBuffer)
    WGPUProcBufferGetConstMappedRange* = proc (buffer: WGPUBuffer;
        offset: csize_t; size: csize_t)
    WGPUProcBufferGetMapState* = proc (buffer: WGPUBuffer): WGPUBufferMapState
    WGPUProcBufferGetMappedRange* = proc (buffer: WGPUBuffer; offset: csize_t;
        size: csize_t): pointer
    WGPUProcBufferGetSize* = proc (buffer: WGPUBuffer): uint64
    WGPUProcBufferGetUsage* = proc (buffer: WGPUBuffer): WGPUBufferUsageFlags
    WGPUProcBufferMapAsync* = proc (buffer: WGPUBuffer; mode: WGPUMapModeFlags;
                                    offset: csize_t; size: csize_t;
                                    callback: WGPUBufferMapCallback;
                                    userdata: pointer)
    WGPUProcBufferSetLabel* = proc (buffer: WGPUBuffer; label: cstring)
    WGPUProcBufferUnmap* = proc (buffer: WGPUBuffer)
    WGPUProcBufferReference* = proc (buffer: WGPUBuffer)
    WGPUProcBufferRelease* = proc (buffer: WGPUBuffer)
  ##  Procs of CommandBuffer
  type
    WGPUProcCommandBufferSetLabel* = proc (commandBuffer: WGPUCommandBuffer;
        label: cstring)
    WGPUProcCommandBufferReference* = proc (commandBuffer: WGPUCommandBuffer)
    WGPUProcCommandBufferRelease* = proc (commandBuffer: WGPUCommandBuffer)
  ##  Procs of CommandEncoder
  type
    WGPUProcCommandEncoderBeginComputePass* = proc (
        commandEncoder: WGPUCommandEncoder;
        descriptor: ptr WGPUComputePassDescriptor): WGPUComputePassEncoder
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
    WGPUProcCommandEncoderCopyTextureToTextureInternal* = proc (
        commandEncoder: WGPUCommandEncoder; source: ptr WGPUImageCopyTexture;
        destination: ptr WGPUImageCopyTexture; copySize: ptr WGPUExtent3D)
    WGPUProcCommandEncoderFinish* = proc (commandEncoder: WGPUCommandEncoder;
        descriptor: ptr WGPUCommandBufferDescriptor): WGPUCommandBuffer
    WGPUProcCommandEncoderInjectValidationError* = proc (
        commandEncoder: WGPUCommandEncoder; message: cstring)
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
    WGPUProcCommandEncoderWriteBuffer* = proc (
        commandEncoder: WGPUCommandEncoder; buffer: WGPUBuffer;
        bufferOffset: uint64; data: ptr uint8; size: uint64)
    WGPUProcCommandEncoderWriteTimestamp* = proc (
        commandEncoder: WGPUCommandEncoder; querySet: WGPUQuerySet;
        queryIndex: uint32)
    WGPUProcCommandEncoderReference* = proc (commandEncoder: WGPUCommandEncoder)
    WGPUProcCommandEncoderRelease* = proc (commandEncoder: WGPUCommandEncoder)
  ##  Procs of ComputePassEncoder
  type
    WGPUProcComputePassEncoderDispatchWorkgroups* = proc (
        computePassEncoder: WGPUComputePassEncoder; workgroupCountX: uint32;
        workgroupCountY: uint32; workgroupCountZ: uint32)
    WGPUProcComputePassEncoderDispatchWorkgroupsIndirect* = proc (
        computePassEncoder: WGPUComputePassEncoder; indirectBuffer: WGPUBuffer;
        indirectOffset: uint64)
    WGPUProcComputePassEncoderEnd* = proc (
        computePassEncoder: WGPUComputePassEncoder)
    WGPUProcComputePassEncoderInsertDebugMarker* = proc (
        computePassEncoder: WGPUComputePassEncoder; markerLabel: cstring)
    WGPUProcComputePassEncoderPopDebugGroup* = proc (
        computePassEncoder: WGPUComputePassEncoder)
    WGPUProcComputePassEncoderPushDebugGroup* = proc (
        computePassEncoder: WGPUComputePassEncoder; groupLabel: cstring)
    WGPUProcComputePassEncoderSetBindGroup* = proc (
        computePassEncoder: WGPUComputePassEncoder; groupIndex: uint32;
        group: WGPUBindGroup; dynamicOffsetCount: csize_t;
        dynamicOffsets: ptr uint32)
    WGPUProcComputePassEncoderSetLabel* = proc (
        computePassEncoder: WGPUComputePassEncoder; label: cstring)
    WGPUProcComputePassEncoderSetPipeline* = proc (
        computePassEncoder: WGPUComputePassEncoder;
        pipeline: WGPUComputePipeline)
    WGPUProcComputePassEncoderWriteTimestamp* = proc (
        computePassEncoder: WGPUComputePassEncoder; querySet: WGPUQuerySet;
        queryIndex: uint32)
    WGPUProcComputePassEncoderReference* = proc (
        computePassEncoder: WGPUComputePassEncoder)
    WGPUProcComputePassEncoderRelease* = proc (
        computePassEncoder: WGPUComputePassEncoder)
  ##  Procs of ComputePipeline
  type
    WGPUProcComputePipelineGetBindGroupLayout* = proc (
        computePipeline: WGPUComputePipeline; groupIndex: uint32): WGPUBindGroupLayout
    WGPUProcComputePipelineSetLabel* = proc (
        computePipeline: WGPUComputePipeline; label: cstring)
    WGPUProcComputePipelineReference* = proc (
        computePipeline: WGPUComputePipeline)
    WGPUProcComputePipelineRelease* = proc (computePipeline: WGPUComputePipeline)
  ##  Procs of Device
  type
    WGPUProcDeviceCreateBindGroup* = proc (device: WGPUDevice;
        descriptor: ptr WGPUBindGroupDescriptor): WGPUBindGroup
    WGPUProcDeviceCreateBindGroupLayout* = proc (device: WGPUDevice;
        descriptor: ptr WGPUBindGroupLayoutDescriptor): WGPUBindGroupLayout
    WGPUProcDeviceCreateBuffer* = proc (device: WGPUDevice;
                                        descriptor: ptr WGPUBufferDescriptor): WGPUBuffer
    WGPUProcDeviceCreateCommandEncoder* = proc (device: WGPUDevice;
        descriptor: ptr WGPUCommandEncoderDescriptor): WGPUCommandEncoder
    WGPUProcDeviceCreateComputePipeline* = proc (device: WGPUDevice;
        descriptor: ptr WGPUComputePipelineDescriptor): WGPUComputePipeline
    WGPUProcDeviceCreateComputePipelineAsync* = proc (device: WGPUDevice;
        descriptor: ptr WGPUComputePipelineDescriptor;
        callback: WGPUCreateComputePipelineAsyncCallback; userdata: pointer)
    WGPUProcDeviceCreateErrorBuffer* = proc (device: WGPUDevice;
        descriptor: ptr WGPUBufferDescriptor): WGPUBuffer
    WGPUProcDeviceCreateErrorExternalTexture* = proc (device: WGPUDevice): WGPUExternalTexture
    WGPUProcDeviceCreateErrorShaderModule* = proc (device: WGPUDevice;
        descriptor: ptr WGPUShaderModuleDescriptor; errorMessage: cstring): WGPUShaderModule
    WGPUProcDeviceCreateErrorTexture* = proc (device: WGPUDevice;
        descriptor: ptr WGPUTextureDescriptor): WGPUTexture
    WGPUProcDeviceCreateExternalTexture* = proc (device: WGPUDevice;
        externalTextureDescriptor: ptr WGPUExternalTextureDescriptor): WGPUExternalTexture
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
    WGPUProcDeviceCreateSampler* = proc (device: WGPUDevice;
        descriptor: ptr WGPUSamplerDescriptor): WGPUSampler
    WGPUProcDeviceCreateShaderModule* = proc (device: WGPUDevice;
        descriptor: ptr WGPUShaderModuleDescriptor): WGPUShaderModule
    WGPUProcDeviceCreateSwapChain* = proc (device: WGPUDevice;
        surface: WGPUSurface; descriptor: ptr WGPUSwapChainDescriptor): WGPUSwapChain
    WGPUProcDeviceCreateTexture* = proc (device: WGPUDevice;
        descriptor: ptr WGPUTextureDescriptor): WGPUTexture
    WGPUProcDeviceDestroy* = proc (device: WGPUDevice)
    WGPUProcDeviceEnumerateFeatures* = proc (device: WGPUDevice;
        features: ptr WGPUFeatureName): csize_t
    WGPUProcDeviceForceLoss* = proc (device: WGPUDevice;
                                     `type`: WGPUDeviceLostReason;
                                     message: cstring)
    WGPUProcDeviceGetAdapter* = proc (device: WGPUDevice): WGPUAdapter
    WGPUProcDeviceGetLimits* = proc (device: WGPUDevice;
                                     limits: ptr WGPUSupportedLimits): bool
    WGPUProcDeviceGetQueue* = proc (device: WGPUDevice): WGPUQueue
    WGPUProcDeviceGetSupportedSurfaceUsage* = proc (device: WGPUDevice;
        surface: WGPUSurface): WGPUTextureUsageFlags
    WGPUProcDeviceHasFeature* = proc (device: WGPUDevice;
                                      feature: WGPUFeatureName): bool
    WGPUProcDeviceInjectError* = proc (device: WGPUDevice;
                                       `type`: WGPUErrorType; message: cstring)
    WGPUProcDevicePopErrorScope* = proc (device: WGPUDevice;
        callback: WGPUErrorCallback; userdata: pointer)
    WGPUProcDevicePushErrorScope* = proc (device: WGPUDevice;
        filter: WGPUErrorFilter)
    WGPUProcDeviceSetDeviceLostCallback* = proc (device: WGPUDevice;
        callback: WGPUDeviceLostCallback; userdata: pointer)
    WGPUProcDeviceSetLabel* = proc (device: WGPUDevice; label: cstring)
    WGPUProcDeviceSetLoggingCallback* = proc (device: WGPUDevice;
        callback: WGPULoggingCallback; userdata: pointer)
    WGPUProcDeviceSetUncapturedErrorCallback* = proc (device: WGPUDevice;
        callback: WGPUErrorCallback; userdata: pointer)
    WGPUProcDeviceTick* = proc (device: WGPUDevice)
    WGPUProcDeviceValidateTextureDescriptor* = proc (device: WGPUDevice;
        descriptor: ptr WGPUTextureDescriptor)
    WGPUProcDeviceReference* = proc (device: WGPUDevice)
    WGPUProcDeviceRelease* = proc (device: WGPUDevice)
  ##  Procs of ExternalTexture
  type
    WGPUProcExternalTextureDestroy* = proc (externalTexture: WGPUExternalTexture)
    WGPUProcExternalTextureExpire* = proc (externalTexture: WGPUExternalTexture)
    WGPUProcExternalTextureRefresh* = proc (externalTexture: WGPUExternalTexture)
    WGPUProcExternalTextureSetLabel* = proc (
        externalTexture: WGPUExternalTexture; label: cstring)
    WGPUProcExternalTextureReference* = proc (
        externalTexture: WGPUExternalTexture)
    WGPUProcExternalTextureRelease* = proc (externalTexture: WGPUExternalTexture)
  ##  Procs of Instance
  type
    WGPUProcInstanceCreateSurface* = proc (instance: WGPUInstance;
        descriptor: ptr WGPUSurfaceDescriptor): WGPUSurface
    WGPUProcInstanceProcessEvents* = proc (instance: WGPUInstance)
    WGPUProcInstanceRequestAdapter* = proc (instance: WGPUInstance;
        options: ptr WGPURequestAdapterOptions;
        callback: WGPURequestAdapterCallback; userdata: pointer)
    WGPUProcInstanceReference* = proc (instance: WGPUInstance)
    WGPUProcInstanceRelease* = proc (instance: WGPUInstance)
  ##  Procs of PipelineLayout
  type
    WGPUProcPipelineLayoutSetLabel* = proc (pipelineLayout: WGPUPipelineLayout;
        label: cstring)
    WGPUProcPipelineLayoutReference* = proc (pipelineLayout: WGPUPipelineLayout)
    WGPUProcPipelineLayoutRelease* = proc (pipelineLayout: WGPUPipelineLayout)
  ##  Procs of QuerySet
  type
    WGPUProcQuerySetDestroy* = proc (querySet: WGPUQuerySet)
    WGPUProcQuerySetGetCount* = proc (querySet: WGPUQuerySet): uint32
    WGPUProcQuerySetGetType* = proc (querySet: WGPUQuerySet): WGPUQueryType
    WGPUProcQuerySetSetLabel* = proc (querySet: WGPUQuerySet; label: cstring)
    WGPUProcQuerySetReference* = proc (querySet: WGPUQuerySet)
    WGPUProcQuerySetRelease* = proc (querySet: WGPUQuerySet)
  ##  Procs of Queue
  type
    WGPUProcQueueCopyExternalTextureForBrowser* = proc (queue: WGPUQueue;
        source: ptr WGPUImageCopyExternalTexture;
        destination: ptr WGPUImageCopyTexture; copySize: ptr WGPUExtent3D;
        options: ptr WGPUCopyTextureForBrowserOptions)
    WGPUProcQueueCopyTextureForBrowser* = proc (queue: WGPUQueue;
        source: ptr WGPUImageCopyTexture; destination: ptr WGPUImageCopyTexture;
        copySize: ptr WGPUExtent3D;
        options: ptr WGPUCopyTextureForBrowserOptions)
    WGPUProcQueueOnSubmittedWorkDone* = proc (queue: WGPUQueue;
        signalValue: uint64; callback: WGPUQueueWorkDoneCallback;
        userdata: pointer)
    WGPUProcQueueSetLabel* = proc (queue: WGPUQueue; label: cstring)
    WGPUProcQueueSubmit* = proc (queue: WGPUQueue; commandCount: csize_t;
                                 commands: ptr WGPUCommandBuffer)
    WGPUProcQueueWriteBuffer* = proc (queue: WGPUQueue; buffer: WGPUBuffer;
                                      bufferOffset: uint64; data: pointer;
                                      size: csize_t)
    WGPUProcQueueWriteTexture* = proc (queue: WGPUQueue;
                                       destination: ptr WGPUImageCopyTexture;
                                       data: pointer; dataSize: csize_t;
                                       dataLayout: ptr WGPUTextureDataLayout;
                                       writeSize: ptr WGPUExtent3D)
    WGPUProcQueueReference* = proc (queue: WGPUQueue)
    WGPUProcQueueRelease* = proc (queue: WGPUQueue)
  ##  Procs of RenderBundle
  type
    WGPUProcRenderBundleSetLabel* = proc (renderBundle: WGPURenderBundle;
        label: cstring)
    WGPUProcRenderBundleReference* = proc (renderBundle: WGPURenderBundle)
    WGPUProcRenderBundleRelease* = proc (renderBundle: WGPURenderBundle)
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
        renderBundleEncoder: WGPURenderBundleEncoder;
        descriptor: ptr WGPURenderBundleDescriptor): WGPURenderBundle
    WGPUProcRenderBundleEncoderInsertDebugMarker* = proc (
        renderBundleEncoder: WGPURenderBundleEncoder; markerLabel: cstring)
    WGPUProcRenderBundleEncoderPopDebugGroup* = proc (
        renderBundleEncoder: WGPURenderBundleEncoder)
    WGPUProcRenderBundleEncoderPushDebugGroup* = proc (
        renderBundleEncoder: WGPURenderBundleEncoder; groupLabel: cstring)
    WGPUProcRenderBundleEncoderSetBindGroup* = proc (
        renderBundleEncoder: WGPURenderBundleEncoder; groupIndex: uint32;
        group: WGPUBindGroup; dynamicOffsetCount: csize_t;
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
    WGPUProcRenderBundleEncoderReference* = proc (
        renderBundleEncoder: WGPURenderBundleEncoder)
    WGPUProcRenderBundleEncoderRelease* = proc (
        renderBundleEncoder: WGPURenderBundleEncoder)
  ##  Procs of RenderPassEncoder
  type
    WGPUProcRenderPassEncoderBeginOcclusionQuery* = proc (
        renderPassEncoder: WGPURenderPassEncoder; queryIndex: uint32)
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
    WGPUProcRenderPassEncoderExecuteBundles* = proc (
        renderPassEncoder: WGPURenderPassEncoder; bundleCount: csize_t;
        bundles: ptr WGPURenderBundle)
    WGPUProcRenderPassEncoderInsertDebugMarker* = proc (
        renderPassEncoder: WGPURenderPassEncoder; markerLabel: cstring)
    WGPUProcRenderPassEncoderPopDebugGroup* = proc (
        renderPassEncoder: WGPURenderPassEncoder)
    WGPUProcRenderPassEncoderPushDebugGroup* = proc (
        renderPassEncoder: WGPURenderPassEncoder; groupLabel: cstring)
    WGPUProcRenderPassEncoderSetBindGroup* = proc (
        renderPassEncoder: WGPURenderPassEncoder; groupIndex: uint32;
        group: WGPUBindGroup; dynamicOffsetCount: csize_t;
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
    WGPUProcRenderPassEncoderWriteTimestamp* = proc (
        renderPassEncoder: WGPURenderPassEncoder; querySet: WGPUQuerySet;
        queryIndex: uint32)
    WGPUProcRenderPassEncoderReference* = proc (
        renderPassEncoder: WGPURenderPassEncoder)
    WGPUProcRenderPassEncoderRelease* = proc (
        renderPassEncoder: WGPURenderPassEncoder)
  ##  Procs of RenderPipeline
  type
    WGPUProcRenderPipelineGetBindGroupLayout* = proc (
        renderPipeline: WGPURenderPipeline; groupIndex: uint32): WGPUBindGroupLayout
    WGPUProcRenderPipelineSetLabel* = proc (renderPipeline: WGPURenderPipeline;
        label: cstring)
    WGPUProcRenderPipelineReference* = proc (renderPipeline: WGPURenderPipeline)
    WGPUProcRenderPipelineRelease* = proc (renderPipeline: WGPURenderPipeline)
  ##  Procs of Sampler
  type
    WGPUProcSamplerSetLabel* = proc (sampler: WGPUSampler; label: cstring)
    WGPUProcSamplerReference* = proc (sampler: WGPUSampler)
    WGPUProcSamplerRelease* = proc (sampler: WGPUSampler)
  ##  Procs of ShaderModule
  type
    WGPUProcShaderModuleGetCompilationInfo* = proc (
        shaderModule: WGPUShaderModule; callback: WGPUCompilationInfoCallback;
        userdata: pointer)
    WGPUProcShaderModuleSetLabel* = proc (shaderModule: WGPUShaderModule;
        label: cstring)
    WGPUProcShaderModuleReference* = proc (shaderModule: WGPUShaderModule)
    WGPUProcShaderModuleRelease* = proc (shaderModule: WGPUShaderModule)
  ##  Procs of Surface
  type
    WGPUProcSurfaceReference* = proc (surface: WGPUSurface)
    WGPUProcSurfaceRelease* = proc (surface: WGPUSurface)
  ##  Procs of SwapChain
  type
    WGPUProcSwapChainGetCurrentTexture* = proc (swapChain: WGPUSwapChain): WGPUTexture
    WGPUProcSwapChainGetCurrentTextureView* = proc (swapChain: WGPUSwapChain): WGPUTextureView
    WGPUProcSwapChainPresent* = proc (swapChain: WGPUSwapChain)
    WGPUProcSwapChainReference* = proc (swapChain: WGPUSwapChain)
    WGPUProcSwapChainRelease* = proc (swapChain: WGPUSwapChain)
  ##  Procs of Texture
  type
    WGPUProcTextureCreateView* = proc (texture: WGPUTexture; descriptor: ptr WGPUTextureViewDescriptor): WGPUTextureView
    WGPUProcTextureDestroy* = proc (texture: WGPUTexture)
    WGPUProcTextureGetDepthOrArrayLayers* = proc (texture: WGPUTexture): uint32
    WGPUProcTextureGetDimension* = proc (texture: WGPUTexture): WGPUTextureDimension
    WGPUProcTextureGetFormat* = proc (texture: WGPUTexture): WGPUTextureFormat
    WGPUProcTextureGetHeight* = proc (texture: WGPUTexture): uint32
    WGPUProcTextureGetMipLevelCount* = proc (texture: WGPUTexture): uint32
    WGPUProcTextureGetSampleCount* = proc (texture: WGPUTexture): uint32
    WGPUProcTextureGetUsage* = proc (texture: WGPUTexture): WGPUTextureUsageFlags
    WGPUProcTextureGetWidth* = proc (texture: WGPUTexture): uint32
    WGPUProcTextureSetLabel* = proc (texture: WGPUTexture; label: cstring)
    WGPUProcTextureReference* = proc (texture: WGPUTexture)
    WGPUProcTextureRelease* = proc (texture: WGPUTexture)
  ##  Procs of TextureView
  type
    WGPUProcTextureViewSetLabel* = proc (textureView: WGPUTextureView;
        label: cstring)
    WGPUProcTextureViewReference* = proc (textureView: WGPUTextureView)
    WGPUProcTextureViewRelease* = proc (textureView: WGPUTextureView)
when not defined(WGPU_SKIP_DECLARATIONS):
  proc wgpuCreateInstance*(descriptor: ptr WGPUInstanceDescriptor): WGPUInstance {.
      importc: "wgpuCreateInstance".}
  proc wgpuGetProcAddress*(device: WGPUDevice; procName: cstring): WGPUProc {.
      importc: "wgpuGetProcAddress".}
  ##  Methods of Adapter
  proc wgpuAdapterCreateDevice*(adapter: WGPUAdapter;
                                descriptor: ptr WGPUDeviceDescriptor): WGPUDevice {.
      importc: "wgpuAdapterCreateDevice".}
  proc wgpuAdapterEnumerateFeatures*(adapter: WGPUAdapter;
                                     features: ptr WGPUFeatureName): csize_t {.
      importc: "wgpuAdapterEnumerateFeatures".}
  proc wgpuAdapterGetInstance*(adapter: WGPUAdapter): WGPUInstance {.
      importc: "wgpuAdapterGetInstance".}
  proc wgpuAdapterGetLimits*(adapter: WGPUAdapter;
                             limits: ptr WGPUSupportedLimits): bool {.
      importc: "wgpuAdapterGetLimits".}
  proc wgpuAdapterGetProperties*(adapter: WGPUAdapter;
                                 properties: ptr WGPUAdapterProperties) {.
      importc: "wgpuAdapterGetProperties".}
  proc wgpuAdapterHasFeature*(adapter: WGPUAdapter; feature: WGPUFeatureName): bool {.
      importc: "wgpuAdapterHasFeature".}
  proc wgpuAdapterRequestDevice*(adapter: WGPUAdapter;
                                 descriptor: ptr WGPUDeviceDescriptor;
                                 callback: WGPURequestDeviceCallback;
                                 userdata: pointer) {.
      importc: "wgpuAdapterRequestDevice".}
  proc wgpuAdapterReference*(adapter: WGPUAdapter) {.
      importc: "wgpuAdapterReference".}
  proc wgpuAdapterRelease*(adapter: WGPUAdapter) {.importc: "wgpuAdapterRelease".}
  ##  Methods of BindGroup
  proc wgpuBindGroupSetLabel*(bindGroup: WGPUBindGroup; label: cstring) {.
      importc: "wgpuBindGroupSetLabel".}
  proc wgpuBindGroupReference*(bindGroup: WGPUBindGroup) {.
      importc: "wgpuBindGroupReference".}
  proc wgpuBindGroupRelease*(bindGroup: WGPUBindGroup) {.
      importc: "wgpuBindGroupRelease".}
  ##  Methods of BindGroupLayout
  proc wgpuBindGroupLayoutSetLabel*(bindGroupLayout: WGPUBindGroupLayout;
                                    label: cstring) {.
      importc: "wgpuBindGroupLayoutSetLabel".}
  proc wgpuBindGroupLayoutReference*(bindGroupLayout: WGPUBindGroupLayout) {.
      importc: "wgpuBindGroupLayoutReference".}
  proc wgpuBindGroupLayoutRelease*(bindGroupLayout: WGPUBindGroupLayout) {.
      importc: "wgpuBindGroupLayoutRelease".}
  ##  Methods of Buffer
  proc wgpuBufferDestroy*(buffer: WGPUBuffer) {.importc: "wgpuBufferDestroy".}
  proc wgpuBufferGetConstMappedRange*(buffer: WGPUBuffer; offset: csize_t;
                                      size: csize_t): pointer {.
      importc: "wgpuBufferGetConstMappedRange".}
  proc wgpuBufferGetMapState*(buffer: WGPUBuffer): WGPUBufferMapState {.
      importc: "wgpuBufferGetMapState".}
  proc wgpuBufferGetMappedRange*(buffer: WGPUBuffer; offset: csize_t;
                                 size: csize_t): pointer {.
      importc: "wgpuBufferGetMappedRange".}
  proc wgpuBufferGetSize*(buffer: WGPUBuffer): uint64 {.
      importc: "wgpuBufferGetSize".}
  proc wgpuBufferGetUsage*(buffer: WGPUBuffer): WGPUBufferUsageFlags {.
      importc: "wgpuBufferGetUsage".}
  proc wgpuBufferMapAsync*(buffer: WGPUBuffer; mode: WGPUMapModeFlags;
                           offset: csize_t; size: csize_t;
                           callback: WGPUBufferMapCallback; userdata: pointer) {.
      importc: "wgpuBufferMapAsync".}
  proc wgpuBufferSetLabel*(buffer: WGPUBuffer; label: cstring) {.
      importc: "wgpuBufferSetLabel".}
  proc wgpuBufferUnmap*(buffer: WGPUBuffer) {.importc: "wgpuBufferUnmap".}
  proc wgpuBufferReference*(buffer: WGPUBuffer) {.importc: "wgpuBufferReference".}
  proc wgpuBufferRelease*(buffer: WGPUBuffer) {.importc: "wgpuBufferRelease".}
  ##  Methods of CommandBuffer
  proc wgpuCommandBufferSetLabel*(commandBuffer: WGPUCommandBuffer;
                                  label: cstring) {.
      importc: "wgpuCommandBufferSetLabel".}
  proc wgpuCommandBufferReference*(commandBuffer: WGPUCommandBuffer) {.
      importc: "wgpuCommandBufferReference".}
  proc wgpuCommandBufferRelease*(commandBuffer: WGPUCommandBuffer) {.
      importc: "wgpuCommandBufferRelease".}
  ##  Methods of CommandEncoder
  proc wgpuCommandEncoderBeginComputePass*(commandEncoder: WGPUCommandEncoder;
      descriptor: ptr WGPUComputePassDescriptor): WGPUComputePassEncoder {.
      importc: "wgpuCommandEncoderBeginComputePass".}
  proc wgpuCommandEncoderBeginRenderPass*(commandEncoder: WGPUCommandEncoder;
      descriptor: ptr WGPURenderPassDescriptor): WGPURenderPassEncoder {.
      importc: "wgpuCommandEncoderBeginRenderPass".}
  proc wgpuCommandEncoderClearBuffer*(commandEncoder: WGPUCommandEncoder;
                                      buffer: WGPUBuffer; offset: uint64;
                                      size: uint64) {.
      importc: "wgpuCommandEncoderClearBuffer".}
  proc wgpuCommandEncoderCopyBufferToBuffer*(commandEncoder: WGPUCommandEncoder;
      source: WGPUBuffer; sourceOffset: uint64; destination: WGPUBuffer;
      destinationOffset: uint64; size: uint64) {.
      importc: "wgpuCommandEncoderCopyBufferToBuffer".}
  proc wgpuCommandEncoderCopyBufferToTexture*(
      commandEncoder: WGPUCommandEncoder; source: ptr WGPUImageCopyBuffer;
      destination: ptr WGPUImageCopyTexture; copySize: ptr WGPUExtent3D) {.
      importc: "wgpuCommandEncoderCopyBufferToTexture".}
  proc wgpuCommandEncoderCopyTextureToBuffer*(
      commandEncoder: WGPUCommandEncoder; source: ptr WGPUImageCopyTexture;
      destination: ptr WGPUImageCopyBuffer; copySize: ptr WGPUExtent3D) {.
      importc: "wgpuCommandEncoderCopyTextureToBuffer".}
  proc wgpuCommandEncoderCopyTextureToTexture*(
      commandEncoder: WGPUCommandEncoder; source: ptr WGPUImageCopyTexture;
      destination: ptr WGPUImageCopyTexture; copySize: ptr WGPUExtent3D) {.
      importc: "wgpuCommandEncoderCopyTextureToTexture".}
  proc wgpuCommandEncoderCopyTextureToTextureInternal*(
      commandEncoder: WGPUCommandEncoder; source: ptr WGPUImageCopyTexture;
      destination: ptr WGPUImageCopyTexture; copySize: ptr WGPUExtent3D) {.
      importc: "wgpuCommandEncoderCopyTextureToTextureInternal".}
  proc wgpuCommandEncoderFinish*(commandEncoder: WGPUCommandEncoder;
                                 descriptor: ptr WGPUCommandBufferDescriptor): WGPUCommandBuffer {.
      importc: "wgpuCommandEncoderFinish".}
  proc wgpuCommandEncoderInjectValidationError*(
      commandEncoder: WGPUCommandEncoder; message: cstring) {.
      importc: "wgpuCommandEncoderInjectValidationError".}
  proc wgpuCommandEncoderInsertDebugMarker*(commandEncoder: WGPUCommandEncoder;
      markerLabel: cstring) {.importc: "wgpuCommandEncoderInsertDebugMarker".}
  proc wgpuCommandEncoderPopDebugGroup*(commandEncoder: WGPUCommandEncoder) {.
      importc: "wgpuCommandEncoderPopDebugGroup".}
  proc wgpuCommandEncoderPushDebugGroup*(commandEncoder: WGPUCommandEncoder;
      groupLabel: cstring) {.importc: "wgpuCommandEncoderPushDebugGroup".}
  proc wgpuCommandEncoderResolveQuerySet*(commandEncoder: WGPUCommandEncoder;
      querySet: WGPUQuerySet; firstQuery: uint32; queryCount: uint32;
      destination: WGPUBuffer; destinationOffset: uint64) {.
      importc: "wgpuCommandEncoderResolveQuerySet".}
  proc wgpuCommandEncoderSetLabel*(commandEncoder: WGPUCommandEncoder;
                                   label: cstring) {.
      importc: "wgpuCommandEncoderSetLabel".}
  proc wgpuCommandEncoderWriteBuffer*(commandEncoder: WGPUCommandEncoder;
                                      buffer: WGPUBuffer; bufferOffset: uint64;
                                      data: ptr uint8; size: uint64) {.
      importc: "wgpuCommandEncoderWriteBuffer".}
  proc wgpuCommandEncoderWriteTimestamp*(commandEncoder: WGPUCommandEncoder;
      querySet: WGPUQuerySet; queryIndex: uint32) {.
      importc: "wgpuCommandEncoderWriteTimestamp".}
  proc wgpuCommandEncoderReference*(commandEncoder: WGPUCommandEncoder) {.
      importc: "wgpuCommandEncoderReference".}
  proc wgpuCommandEncoderRelease*(commandEncoder: WGPUCommandEncoder) {.
      importc: "wgpuCommandEncoderRelease".}
  ##  Methods of ComputePassEncoder
  proc wgpuComputePassEncoderDispatchWorkgroups*(
      computePassEncoder: WGPUComputePassEncoder; workgroupCountX: uint32;
      workgroupCountY: uint32; workgroupCountZ: uint32) {.
      importc: "wgpuComputePassEncoderDispatchWorkgroups".}
  proc wgpuComputePassEncoderDispatchWorkgroupsIndirect*(
      computePassEncoder: WGPUComputePassEncoder; indirectBuffer: WGPUBuffer;
      indirectOffset: uint64) {.importc: "wgpuComputePassEncoderDispatchWorkgroupsIndirect".}
  proc wgpuComputePassEncoderEnd*(computePassEncoder: WGPUComputePassEncoder) {.
      importc: "wgpuComputePassEncoderEnd".}
  proc wgpuComputePassEncoderInsertDebugMarker*(
      computePassEncoder: WGPUComputePassEncoder; markerLabel: cstring) {.
      importc: "wgpuComputePassEncoderInsertDebugMarker".}
  proc wgpuComputePassEncoderPopDebugGroup*(
      computePassEncoder: WGPUComputePassEncoder) {.
      importc: "wgpuComputePassEncoderPopDebugGroup".}
  proc wgpuComputePassEncoderPushDebugGroup*(
      computePassEncoder: WGPUComputePassEncoder; groupLabel: cstring) {.
      importc: "wgpuComputePassEncoderPushDebugGroup".}
  proc wgpuComputePassEncoderSetBindGroup*(
      computePassEncoder: WGPUComputePassEncoder; groupIndex: uint32;
      group: WGPUBindGroup; dynamicOffsetCount: csize_t;
      dynamicOffsets: ptr uint32) {.importc: "wgpuComputePassEncoderSetBindGroup".}
  proc wgpuComputePassEncoderSetLabel*(computePassEncoder: WGPUComputePassEncoder;
                                       label: cstring) {.
      importc: "wgpuComputePassEncoderSetLabel".}
  proc wgpuComputePassEncoderSetPipeline*(
      computePassEncoder: WGPUComputePassEncoder; pipeline: WGPUComputePipeline) {.
      importc: "wgpuComputePassEncoderSetPipeline".}
  proc wgpuComputePassEncoderWriteTimestamp*(
      computePassEncoder: WGPUComputePassEncoder; querySet: WGPUQuerySet;
      queryIndex: uint32) {.importc: "wgpuComputePassEncoderWriteTimestamp".}
  proc wgpuComputePassEncoderReference*(computePassEncoder: WGPUComputePassEncoder) {.
      importc: "wgpuComputePassEncoderReference".}
  proc wgpuComputePassEncoderRelease*(computePassEncoder: WGPUComputePassEncoder) {.
      importc: "wgpuComputePassEncoderRelease".}
  ##  Methods of ComputePipeline
  proc wgpuComputePipelineGetBindGroupLayout*(
      computePipeline: WGPUComputePipeline; groupIndex: uint32): WGPUBindGroupLayout {.
      importc: "wgpuComputePipelineGetBindGroupLayout".}
  proc wgpuComputePipelineSetLabel*(computePipeline: WGPUComputePipeline;
                                    label: cstring) {.
      importc: "wgpuComputePipelineSetLabel".}
  proc wgpuComputePipelineReference*(computePipeline: WGPUComputePipeline) {.
      importc: "wgpuComputePipelineReference".}
  proc wgpuComputePipelineRelease*(computePipeline: WGPUComputePipeline) {.
      importc: "wgpuComputePipelineRelease".}
  ##  Methods of Device
  proc wgpuDeviceCreateBindGroup*(device: WGPUDevice;
                                  descriptor: ptr WGPUBindGroupDescriptor): WGPUBindGroup {.
      importc: "wgpuDeviceCreateBindGroup".}
  proc wgpuDeviceCreateBindGroupLayout*(device: WGPUDevice; descriptor: ptr WGPUBindGroupLayoutDescriptor): WGPUBindGroupLayout {.
      importc: "wgpuDeviceCreateBindGroupLayout".}
  proc wgpuDeviceCreateBuffer*(device: WGPUDevice;
                               descriptor: ptr WGPUBufferDescriptor): WGPUBuffer {.
      importc: "wgpuDeviceCreateBuffer".}
  proc wgpuDeviceCreateCommandEncoder*(device: WGPUDevice; descriptor: ptr WGPUCommandEncoderDescriptor): WGPUCommandEncoder {.
      importc: "wgpuDeviceCreateCommandEncoder".}
  proc wgpuDeviceCreateComputePipeline*(device: WGPUDevice; descriptor: ptr WGPUComputePipelineDescriptor): WGPUComputePipeline {.
      importc: "wgpuDeviceCreateComputePipeline".}
  proc wgpuDeviceCreateComputePipelineAsync*(device: WGPUDevice;
      descriptor: ptr WGPUComputePipelineDescriptor;
      callback: WGPUCreateComputePipelineAsyncCallback; userdata: pointer) {.
      importc: "wgpuDeviceCreateComputePipelineAsync".}
  proc wgpuDeviceCreateErrorBuffer*(device: WGPUDevice;
                                    descriptor: ptr WGPUBufferDescriptor): WGPUBuffer {.
      importc: "wgpuDeviceCreateErrorBuffer".}
  proc wgpuDeviceCreateErrorExternalTexture*(device: WGPUDevice): WGPUExternalTexture {.
      importc: "wgpuDeviceCreateErrorExternalTexture".}
  proc wgpuDeviceCreateErrorShaderModule*(device: WGPUDevice;
      descriptor: ptr WGPUShaderModuleDescriptor; errorMessage: cstring): WGPUShaderModule {.
      importc: "wgpuDeviceCreateErrorShaderModule".}
  proc wgpuDeviceCreateErrorTexture*(device: WGPUDevice;
                                     descriptor: ptr WGPUTextureDescriptor): WGPUTexture {.
      importc: "wgpuDeviceCreateErrorTexture".}
  proc wgpuDeviceCreateExternalTexture*(device: WGPUDevice;
      externalTextureDescriptor: ptr WGPUExternalTextureDescriptor): WGPUExternalTexture {.
      importc: "wgpuDeviceCreateExternalTexture".}
  proc wgpuDeviceCreatePipelineLayout*(device: WGPUDevice; descriptor: ptr WGPUPipelineLayoutDescriptor): WGPUPipelineLayout {.
      importc: "wgpuDeviceCreatePipelineLayout".}
  proc wgpuDeviceCreateQuerySet*(device: WGPUDevice;
                                 descriptor: ptr WGPUQuerySetDescriptor): WGPUQuerySet {.
      importc: "wgpuDeviceCreateQuerySet".}
  proc wgpuDeviceCreateRenderBundleEncoder*(device: WGPUDevice;
      descriptor: ptr WGPURenderBundleEncoderDescriptor): WGPURenderBundleEncoder {.
      importc: "wgpuDeviceCreateRenderBundleEncoder".}
  proc wgpuDeviceCreateRenderPipeline*(device: WGPUDevice; descriptor: ptr WGPURenderPipelineDescriptor): WGPURenderPipeline {.
      importc: "wgpuDeviceCreateRenderPipeline".}
  proc wgpuDeviceCreateRenderPipelineAsync*(device: WGPUDevice;
      descriptor: ptr WGPURenderPipelineDescriptor;
      callback: WGPUCreateRenderPipelineAsyncCallback; userdata: pointer) {.
      importc: "wgpuDeviceCreateRenderPipelineAsync".}
  proc wgpuDeviceCreateSampler*(device: WGPUDevice;
                                descriptor: ptr WGPUSamplerDescriptor): WGPUSampler {.
      importc: "wgpuDeviceCreateSampler".}
  proc wgpuDeviceCreateShaderModule*(device: WGPUDevice;
                                     descriptor: ptr WGPUShaderModuleDescriptor): WGPUShaderModule {.
      importc: "wgpuDeviceCreateShaderModule".}
  proc wgpuDeviceCreateSwapChain*(device: WGPUDevice; surface: WGPUSurface;
                                  descriptor: ptr WGPUSwapChainDescriptor): WGPUSwapChain {.
      importc: "wgpuDeviceCreateSwapChain".}
  proc wgpuDeviceCreateTexture*(device: WGPUDevice;
                                descriptor: ptr WGPUTextureDescriptor): WGPUTexture {.
      importc: "wgpuDeviceCreateTexture".}
  proc wgpuDeviceDestroy*(device: WGPUDevice) {.importc: "wgpuDeviceDestroy".}
  proc wgpuDeviceEnumerateFeatures*(device: WGPUDevice;
                                    features: ptr WGPUFeatureName): csize_t {.
      importc: "wgpuDeviceEnumerateFeatures".}
  proc wgpuDeviceForceLoss*(device: WGPUDevice; `type`: WGPUDeviceLostReason;
                            message: cstring) {.importc: "wgpuDeviceForceLoss".}
  proc wgpuDeviceGetAdapter*(device: WGPUDevice): WGPUAdapter {.
      importc: "wgpuDeviceGetAdapter".}
  proc wgpuDeviceGetLimits*(device: WGPUDevice; limits: ptr WGPUSupportedLimits): bool {.
      importc: "wgpuDeviceGetLimits".}
  proc wgpuDeviceGetQueue*(device: WGPUDevice): WGPUQueue {.
      importc: "wgpuDeviceGetQueue".}
  proc wgpuDeviceGetSupportedSurfaceUsage*(device: WGPUDevice;
      surface: WGPUSurface): WGPUTextureUsageFlags {.
      importc: "wgpuDeviceGetSupportedSurfaceUsage".}
  proc wgpuDeviceHasFeature*(device: WGPUDevice; feature: WGPUFeatureName): bool {.
      importc: "wgpuDeviceHasFeature".}
  proc wgpuDeviceInjectError*(device: WGPUDevice; `type`: WGPUErrorType;
                              message: cstring) {.
      importc: "wgpuDeviceInjectError".}
  proc wgpuDevicePopErrorScope*(device: WGPUDevice; callback: WGPUErrorCallback;
                                userdata: pointer) {.
      importc: "wgpuDevicePopErrorScope".}
  proc wgpuDevicePushErrorScope*(device: WGPUDevice; filter: WGPUErrorFilter) {.
      importc: "wgpuDevicePushErrorScope".}
  proc wgpuDeviceSetDeviceLostCallback*(device: WGPUDevice;
                                        callback: WGPUDeviceLostCallback;
                                        userdata: pointer) {.
      importc: "wgpuDeviceSetDeviceLostCallback".}
  proc wgpuDeviceSetLabel*(device: WGPUDevice; label: cstring) {.
      importc: "wgpuDeviceSetLabel".}
  proc wgpuDeviceSetLoggingCallback*(device: WGPUDevice;
                                     callback: WGPULoggingCallback;
                                     userdata: pointer) {.
      importc: "wgpuDeviceSetLoggingCallback".}
  proc wgpuDeviceSetUncapturedErrorCallback*(device: WGPUDevice;
      callback: WGPUErrorCallback; userdata: pointer) {.
      importc: "wgpuDeviceSetUncapturedErrorCallback".}
  proc wgpuDeviceTick*(device: WGPUDevice) {.importc: "wgpuDeviceTick".}
  proc wgpuDeviceValidateTextureDescriptor*(device: WGPUDevice;
      descriptor: ptr WGPUTextureDescriptor) {.
      importc: "wgpuDeviceValidateTextureDescriptor".}
  proc wgpuDeviceReference*(device: WGPUDevice) {.importc: "wgpuDeviceReference".}
  proc wgpuDeviceRelease*(device: WGPUDevice) {.importc: "wgpuDeviceRelease".}
  ##  Methods of ExternalTexture
  proc wgpuExternalTextureDestroy*(externalTexture: WGPUExternalTexture) {.
      importc: "wgpuExternalTextureDestroy".}
  proc wgpuExternalTextureExpire*(externalTexture: WGPUExternalTexture) {.
      importc: "wgpuExternalTextureExpire".}
  proc wgpuExternalTextureRefresh*(externalTexture: WGPUExternalTexture) {.
      importc: "wgpuExternalTextureRefresh".}
  proc wgpuExternalTextureSetLabel*(externalTexture: WGPUExternalTexture;
                                    label: cstring) {.
      importc: "wgpuExternalTextureSetLabel".}
  proc wgpuExternalTextureReference*(externalTexture: WGPUExternalTexture) {.
      importc: "wgpuExternalTextureReference".}
  proc wgpuExternalTextureRelease*(externalTexture: WGPUExternalTexture) {.
      importc: "wgpuExternalTextureRelease".}
  ##  Methods of Instance
  proc wgpuInstanceCreateSurface*(instance: WGPUInstance;
                                  descriptor: ptr WGPUSurfaceDescriptor): WGPUSurface {.
      importc: "wgpuInstanceCreateSurface".}
  proc wgpuInstanceProcessEvents*(instance: WGPUInstance) {.
      importc: "wgpuInstanceProcessEvents".}
  proc wgpuInstanceRequestAdapter*(instance: WGPUInstance;
                                   options: ptr WGPURequestAdapterOptions;
                                   callback: WGPURequestAdapterCallback;
                                   userdata: pointer) {.
      importc: "wgpuInstanceRequestAdapter".}
  proc wgpuInstanceReference*(instance: WGPUInstance) {.
      importc: "wgpuInstanceReference".}
  proc wgpuInstanceRelease*(instance: WGPUInstance) {.
      importc: "wgpuInstanceRelease".}
  ##  Methods of PipelineLayout
  proc wgpuPipelineLayoutSetLabel*(pipelineLayout: WGPUPipelineLayout;
                                   label: cstring) {.
      importc: "wgpuPipelineLayoutSetLabel".}
  proc wgpuPipelineLayoutReference*(pipelineLayout: WGPUPipelineLayout) {.
      importc: "wgpuPipelineLayoutReference".}
  proc wgpuPipelineLayoutRelease*(pipelineLayout: WGPUPipelineLayout) {.
      importc: "wgpuPipelineLayoutRelease".}
  ##  Methods of QuerySet
  proc wgpuQuerySetDestroy*(querySet: WGPUQuerySet) {.
      importc: "wgpuQuerySetDestroy".}
  proc wgpuQuerySetGetCount*(querySet: WGPUQuerySet): uint32 {.
      importc: "wgpuQuerySetGetCount".}
  proc wgpuQuerySetGetType*(querySet: WGPUQuerySet): WGPUQueryType {.
      importc: "wgpuQuerySetGetType".}
  proc wgpuQuerySetSetLabel*(querySet: WGPUQuerySet; label: cstring) {.
      importc: "wgpuQuerySetSetLabel".}
  proc wgpuQuerySetReference*(querySet: WGPUQuerySet) {.
      importc: "wgpuQuerySetReference".}
  proc wgpuQuerySetRelease*(querySet: WGPUQuerySet) {.
      importc: "wgpuQuerySetRelease".}
  ##  Methods of Queue
  proc wgpuQueueCopyExternalTextureForBrowser*(queue: WGPUQueue;
      source: ptr WGPUImageCopyExternalTexture;
      destination: ptr WGPUImageCopyTexture; copySize: ptr WGPUExtent3D;
      options: ptr WGPUCopyTextureForBrowserOptions) {.
      importc: "wgpuQueueCopyExternalTextureForBrowser".}
  proc wgpuQueueCopyTextureForBrowser*(queue: WGPUQueue;
                                       source: ptr WGPUImageCopyTexture;
                                       destination: ptr WGPUImageCopyTexture;
                                       copySize: ptr WGPUExtent3D; options: ptr WGPUCopyTextureForBrowserOptions) {.
      importc: "wgpuQueueCopyTextureForBrowser".}
  proc wgpuQueueOnSubmittedWorkDone*(queue: WGPUQueue; signalValue: uint64;
                                     callback: WGPUQueueWorkDoneCallback;
                                     userdata: pointer) {.
      importc: "wgpuQueueOnSubmittedWorkDone".}
  proc wgpuQueueSetLabel*(queue: WGPUQueue; label: cstring) {.
      importc: "wgpuQueueSetLabel".}
  proc wgpuQueueSubmit*(queue: WGPUQueue; commandCount: csize_t;
                        commands: ptr WGPUCommandBuffer) {.
      importc: "wgpuQueueSubmit".}
  proc wgpuQueueWriteBuffer*(queue: WGPUQueue; buffer: WGPUBuffer;
                             bufferOffset: uint64; data: pointer; size: csize_t) {.
      importc: "wgpuQueueWriteBuffer".}
  proc wgpuQueueWriteTexture*(queue: WGPUQueue;
                              destination: ptr WGPUImageCopyTexture;
                              data: pointer; dataSize: csize_t;
                              dataLayout: ptr WGPUTextureDataLayout;
                              writeSize: ptr WGPUExtent3D) {.
      importc: "wgpuQueueWriteTexture".}
  proc wgpuQueueReference*(queue: WGPUQueue) {.importc: "wgpuQueueReference".}
  proc wgpuQueueRelease*(queue: WGPUQueue) {.importc: "wgpuQueueRelease".}
  ##  Methods of RenderBundle
  proc wgpuRenderBundleSetLabel*(renderBundle: WGPURenderBundle; label: cstring) {.
      importc: "wgpuRenderBundleSetLabel".}
  proc wgpuRenderBundleReference*(renderBundle: WGPURenderBundle) {.
      importc: "wgpuRenderBundleReference".}
  proc wgpuRenderBundleRelease*(renderBundle: WGPURenderBundle) {.
      importc: "wgpuRenderBundleRelease".}
  ##  Methods of RenderBundleEncoder
  proc wgpuRenderBundleEncoderDraw*(renderBundleEncoder: WGPURenderBundleEncoder;
                                    vertexCount: uint32; instanceCount: uint32;
                                    firstVertex: uint32; firstInstance: uint32) {.
      importc: "wgpuRenderBundleEncoderDraw".}
  proc wgpuRenderBundleEncoderDrawIndexed*(
      renderBundleEncoder: WGPURenderBundleEncoder; indexCount: uint32;
      instanceCount: uint32; firstIndex: uint32; baseVertex: int32;
      firstInstance: uint32) {.importc: "wgpuRenderBundleEncoderDrawIndexed".}
  proc wgpuRenderBundleEncoderDrawIndexedIndirect*(
      renderBundleEncoder: WGPURenderBundleEncoder; indirectBuffer: WGPUBuffer;
      indirectOffset: uint64) {.importc: "wgpuRenderBundleEncoderDrawIndexedIndirect".}
  proc wgpuRenderBundleEncoderDrawIndirect*(
      renderBundleEncoder: WGPURenderBundleEncoder; indirectBuffer: WGPUBuffer;
      indirectOffset: uint64) {.importc: "wgpuRenderBundleEncoderDrawIndirect".}
  proc wgpuRenderBundleEncoderFinish*(renderBundleEncoder: WGPURenderBundleEncoder;
      descriptor: ptr WGPURenderBundleDescriptor): WGPURenderBundle {.
      importc: "wgpuRenderBundleEncoderFinish".}
  proc wgpuRenderBundleEncoderInsertDebugMarker*(
      renderBundleEncoder: WGPURenderBundleEncoder; markerLabel: cstring) {.
      importc: "wgpuRenderBundleEncoderInsertDebugMarker".}
  proc wgpuRenderBundleEncoderPopDebugGroup*(
      renderBundleEncoder: WGPURenderBundleEncoder) {.
      importc: "wgpuRenderBundleEncoderPopDebugGroup".}
  proc wgpuRenderBundleEncoderPushDebugGroup*(
      renderBundleEncoder: WGPURenderBundleEncoder; groupLabel: cstring) {.
      importc: "wgpuRenderBundleEncoderPushDebugGroup".}
  proc wgpuRenderBundleEncoderSetBindGroup*(
      renderBundleEncoder: WGPURenderBundleEncoder; groupIndex: uint32;
      group: WGPUBindGroup; dynamicOffsetCount: csize_t;
      dynamicOffsets: ptr uint32) {.importc: "wgpuRenderBundleEncoderSetBindGroup".}
  proc wgpuRenderBundleEncoderSetIndexBuffer*(
      renderBundleEncoder: WGPURenderBundleEncoder; buffer: WGPUBuffer;
      format: WGPUIndexFormat; offset: uint64; size: uint64) {.
      importc: "wgpuRenderBundleEncoderSetIndexBuffer".}
  proc wgpuRenderBundleEncoderSetLabel*(renderBundleEncoder: WGPURenderBundleEncoder;
                                        label: cstring) {.
      importc: "wgpuRenderBundleEncoderSetLabel".}
  proc wgpuRenderBundleEncoderSetPipeline*(
      renderBundleEncoder: WGPURenderBundleEncoder; pipeline: WGPURenderPipeline) {.
      importc: "wgpuRenderBundleEncoderSetPipeline".}
  proc wgpuRenderBundleEncoderSetVertexBuffer*(
      renderBundleEncoder: WGPURenderBundleEncoder; slot: uint32;
      buffer: WGPUBuffer; offset: uint64; size: uint64) {.
      importc: "wgpuRenderBundleEncoderSetVertexBuffer".}
  proc wgpuRenderBundleEncoderReference*(
      renderBundleEncoder: WGPURenderBundleEncoder) {.
      importc: "wgpuRenderBundleEncoderReference".}
  proc wgpuRenderBundleEncoderRelease*(renderBundleEncoder: WGPURenderBundleEncoder) {.
      importc: "wgpuRenderBundleEncoderRelease".}
  ##  Methods of RenderPassEncoder
  proc wgpuRenderPassEncoderBeginOcclusionQuery*(
      renderPassEncoder: WGPURenderPassEncoder; queryIndex: uint32) {.
      importc: "wgpuRenderPassEncoderBeginOcclusionQuery".}
  proc wgpuRenderPassEncoderDraw*(renderPassEncoder: WGPURenderPassEncoder;
                                  vertexCount: uint32; instanceCount: uint32;
                                  firstVertex: uint32; firstInstance: uint32) {.
      importc: "wgpuRenderPassEncoderDraw".}
  proc wgpuRenderPassEncoderDrawIndexed*(
      renderPassEncoder: WGPURenderPassEncoder; indexCount: uint32;
      instanceCount: uint32; firstIndex: uint32; baseVertex: int32;
      firstInstance: uint32) {.importc: "wgpuRenderPassEncoderDrawIndexed".}
  proc wgpuRenderPassEncoderDrawIndexedIndirect*(
      renderPassEncoder: WGPURenderPassEncoder; indirectBuffer: WGPUBuffer;
      indirectOffset: uint64) {.importc: "wgpuRenderPassEncoderDrawIndexedIndirect".}
  proc wgpuRenderPassEncoderDrawIndirect*(
      renderPassEncoder: WGPURenderPassEncoder; indirectBuffer: WGPUBuffer;
      indirectOffset: uint64) {.importc: "wgpuRenderPassEncoderDrawIndirect".}
  proc wgpuRenderPassEncoderEnd*(renderPassEncoder: WGPURenderPassEncoder) {.
      importc: "wgpuRenderPassEncoderEnd".}
  proc wgpuRenderPassEncoderEndOcclusionQuery*(
      renderPassEncoder: WGPURenderPassEncoder) {.
      importc: "wgpuRenderPassEncoderEndOcclusionQuery".}
  proc wgpuRenderPassEncoderExecuteBundles*(
      renderPassEncoder: WGPURenderPassEncoder; bundleCount: csize_t;
      bundles: ptr WGPURenderBundle) {.importc: "wgpuRenderPassEncoderExecuteBundles".}
  proc wgpuRenderPassEncoderInsertDebugMarker*(
      renderPassEncoder: WGPURenderPassEncoder; markerLabel: cstring) {.
      importc: "wgpuRenderPassEncoderInsertDebugMarker".}
  proc wgpuRenderPassEncoderPopDebugGroup*(
      renderPassEncoder: WGPURenderPassEncoder) {.
      importc: "wgpuRenderPassEncoderPopDebugGroup".}
  proc wgpuRenderPassEncoderPushDebugGroup*(
      renderPassEncoder: WGPURenderPassEncoder; groupLabel: cstring) {.
      importc: "wgpuRenderPassEncoderPushDebugGroup".}
  proc wgpuRenderPassEncoderSetBindGroup*(
      renderPassEncoder: WGPURenderPassEncoder; groupIndex: uint32;
      group: WGPUBindGroup; dynamicOffsetCount: csize_t;
      dynamicOffsets: ptr uint32) {.importc: "wgpuRenderPassEncoderSetBindGroup".}
  proc wgpuRenderPassEncoderSetBlendConstant*(
      renderPassEncoder: WGPURenderPassEncoder; color: ptr WGPUColor) {.
      importc: "wgpuRenderPassEncoderSetBlendConstant".}
  proc wgpuRenderPassEncoderSetIndexBuffer*(
      renderPassEncoder: WGPURenderPassEncoder; buffer: WGPUBuffer;
      format: WGPUIndexFormat; offset: uint64; size: uint64) {.
      importc: "wgpuRenderPassEncoderSetIndexBuffer".}
  proc wgpuRenderPassEncoderSetLabel*(renderPassEncoder: WGPURenderPassEncoder;
                                      label: cstring) {.
      importc: "wgpuRenderPassEncoderSetLabel".}
  proc wgpuRenderPassEncoderSetPipeline*(
      renderPassEncoder: WGPURenderPassEncoder; pipeline: WGPURenderPipeline) {.
      importc: "wgpuRenderPassEncoderSetPipeline".}
  proc wgpuRenderPassEncoderSetScissorRect*(
      renderPassEncoder: WGPURenderPassEncoder; x: uint32; y: uint32;
      width: uint32; height: uint32) {.importc: "wgpuRenderPassEncoderSetScissorRect".}
  proc wgpuRenderPassEncoderSetStencilReference*(
      renderPassEncoder: WGPURenderPassEncoder; reference: uint32) {.
      importc: "wgpuRenderPassEncoderSetStencilReference".}
  proc wgpuRenderPassEncoderSetVertexBuffer*(
      renderPassEncoder: WGPURenderPassEncoder; slot: uint32;
      buffer: WGPUBuffer; offset: uint64; size: uint64) {.
      importc: "wgpuRenderPassEncoderSetVertexBuffer".}
  proc wgpuRenderPassEncoderSetViewport*(
      renderPassEncoder: WGPURenderPassEncoder; x: cfloat; y: cfloat;
      width: cfloat; height: cfloat; minDepth: cfloat; maxDepth: cfloat) {.
      importc: "wgpuRenderPassEncoderSetViewport".}
  proc wgpuRenderPassEncoderWriteTimestamp*(
      renderPassEncoder: WGPURenderPassEncoder; querySet: WGPUQuerySet;
      queryIndex: uint32) {.importc: "wgpuRenderPassEncoderWriteTimestamp".}
  proc wgpuRenderPassEncoderReference*(renderPassEncoder: WGPURenderPassEncoder) {.
      importc: "wgpuRenderPassEncoderReference".}
  proc wgpuRenderPassEncoderRelease*(renderPassEncoder: WGPURenderPassEncoder) {.
      importc: "wgpuRenderPassEncoderRelease".}
  ##  Methods of RenderPipeline
  proc wgpuRenderPipelineGetBindGroupLayout*(renderPipeline: WGPURenderPipeline;
      groupIndex: uint32): WGPUBindGroupLayout {.
      importc: "wgpuRenderPipelineGetBindGroupLayout".}
  proc wgpuRenderPipelineSetLabel*(renderPipeline: WGPURenderPipeline;
                                   label: cstring) {.
      importc: "wgpuRenderPipelineSetLabel".}
  proc wgpuRenderPipelineReference*(renderPipeline: WGPURenderPipeline) {.
      importc: "wgpuRenderPipelineReference".}
  proc wgpuRenderPipelineRelease*(renderPipeline: WGPURenderPipeline) {.
      importc: "wgpuRenderPipelineRelease".}
  ##  Methods of Sampler
  proc wgpuSamplerSetLabel*(sampler: WGPUSampler; label: cstring) {.
      importc: "wgpuSamplerSetLabel".}
  proc wgpuSamplerReference*(sampler: WGPUSampler) {.
      importc: "wgpuSamplerReference".}
  proc wgpuSamplerRelease*(sampler: WGPUSampler) {.importc: "wgpuSamplerRelease".}
  ##  Methods of ShaderModule
  proc wgpuShaderModuleGetCompilationInfo*(shaderModule: WGPUShaderModule;
      callback: WGPUCompilationInfoCallback; userdata: pointer) {.
      importc: "wgpuShaderModuleGetCompilationInfo".}
  proc wgpuShaderModuleSetLabel*(shaderModule: WGPUShaderModule; label: cstring) {.
      importc: "wgpuShaderModuleSetLabel".}
  proc wgpuShaderModuleReference*(shaderModule: WGPUShaderModule) {.
      importc: "wgpuShaderModuleReference".}
  proc wgpuShaderModuleRelease*(shaderModule: WGPUShaderModule) {.
      importc: "wgpuShaderModuleRelease".}
  ##  Methods of Surface
  proc wgpuSurfaceReference*(surface: WGPUSurface) {.
      importc: "wgpuSurfaceReference".}
  proc wgpuSurfaceRelease*(surface: WGPUSurface) {.importc: "wgpuSurfaceRelease".}
  ##  Methods of SwapChain
  proc wgpuSwapChainGetCurrentTexture*(swapChain: WGPUSwapChain): WGPUTexture {.
      importc: "wgpuSwapChainGetCurrentTexture".}
  proc wgpuSwapChainGetCurrentTextureView*(swapChain: WGPUSwapChain): WGPUTextureView {.
      importc: "wgpuSwapChainGetCurrentTextureView".}
  proc wgpuSwapChainPresent*(swapChain: WGPUSwapChain) {.
      importc: "wgpuSwapChainPresent".}
  proc wgpuSwapChainReference*(swapChain: WGPUSwapChain) {.
      importc: "wgpuSwapChainReference".}
  proc wgpuSwapChainRelease*(swapChain: WGPUSwapChain) {.
      importc: "wgpuSwapChainRelease".}
  ##  Methods of Texture
  proc wgpuTextureCreateView*(texture: WGPUTexture;
                              descriptor: ptr WGPUTextureViewDescriptor): WGPUTextureView {.
      importc: "wgpuTextureCreateView".}
  proc wgpuTextureDestroy*(texture: WGPUTexture) {.importc: "wgpuTextureDestroy".}
  proc wgpuTextureGetDepthOrArrayLayers*(texture: WGPUTexture): uint32 {.
      importc: "wgpuTextureGetDepthOrArrayLayers".}
  proc wgpuTextureGetDimension*(texture: WGPUTexture): WGPUTextureDimension {.
      importc: "wgpuTextureGetDimension".}
  proc wgpuTextureGetFormat*(texture: WGPUTexture): WGPUTextureFormat {.
      importc: "wgpuTextureGetFormat".}
  proc wgpuTextureGetHeight*(texture: WGPUTexture): uint32 {.
      importc: "wgpuTextureGetHeight".}
  proc wgpuTextureGetMipLevelCount*(texture: WGPUTexture): uint32 {.
      importc: "wgpuTextureGetMipLevelCount".}
  proc wgpuTextureGetSampleCount*(texture: WGPUTexture): uint32 {.
      importc: "wgpuTextureGetSampleCount".}
  proc wgpuTextureGetUsage*(texture: WGPUTexture): WGPUTextureUsageFlags {.
      importc: "wgpuTextureGetUsage".}
  proc wgpuTextureGetWidth*(texture: WGPUTexture): uint32 {.
      importc: "wgpuTextureGetWidth".}
  proc wgpuTextureSetLabel*(texture: WGPUTexture; label: cstring) {.
      importc: "wgpuTextureSetLabel".}
  proc wgpuTextureReference*(texture: WGPUTexture) {.
      importc: "wgpuTextureReference".}
  proc wgpuTextureRelease*(texture: WGPUTexture) {.importc: "wgpuTextureRelease".}
  ##  Methods of TextureView
  proc wgpuTextureViewSetLabel*(textureView: WGPUTextureView; label: cstring) {.
      importc: "wgpuTextureViewSetLabel".}
  proc wgpuTextureViewReference*(textureView: WGPUTextureView) {.
      importc: "wgpuTextureViewReference".}
  proc wgpuTextureViewRelease*(textureView: WGPUTextureView) {.
      importc: "wgpuTextureViewRelease".}