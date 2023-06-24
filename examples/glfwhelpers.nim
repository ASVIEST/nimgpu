import staticglfw
import nimgpu

proc glfwGetX11Display*(): pointer {.cdecl, importc: "glfwGetX11Display".}
proc getX11Window*(window: Window): pointer #[Window]# {.importc: "glfwGetX11Window".}

proc createGlfwWindowSurface*(
  instance: WGPUInstance, 
  window: Window
  ): WGPUSurface=
  when defined(linux):
    var 
      surfaceDescFromXlib = 
        WGPUSurfaceDescriptorFromXlibWindow(
          chain: WGPUChainedStruct(
            next: nil,
            sType: WGPUSType_SurfaceDescriptorFromXlibWindow
          ),
          display: glfwGetX11Display(),
          window: cast[uint32](window.getX11Window())
        )
    var surfaceDesc = WGPUSurfaceDescriptor(
      nextInChain: cast[ptr WGPUChainedStruct](
        surfaceDescFromXlib.addr
      )
    )
    
    instance.wgpuInstanceCreateSurface(
        cast[ptr WGPUSurfaceDescriptor](surfaceDesc.addr)
    )