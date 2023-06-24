import staticglfw
import nimgpu
import nimgpu/wgpu_native
import asyncdispatch
import glfwhelpers

var
  swapChain: WGPUSwapChain
  device: webgpu.WGPUDevice
  queue: webgpu.WGPUQueue
  surface: WGPUSurface
  adapter: WGPUAdapter

proc updateSwapChain(width, height: cint) =
  var swapChainDesc: WGPUSwapChainDescriptor

  swapChainDesc.width = width.uint32
  swapChainDesc.height = height.uint32

  swapChainDesc.usage = WGPUTextureUsage_RenderAttachment.uint32

  swapChainDesc.format = wgpuSurfaceGetPreferredFormat(surface, adapter)
  swapChainDesc.presentMode = WGPUPresentMode_Fifo;
  
  swapChain = wgpuDeviceCreateSwapChain(
    device, surface, 
    cast[ptr WGPUSwapChainDescriptor](swapChainDesc.addr)
  )

proc updateSwapChain(w: Window) =
  var width, height: cint
  w.getWindowSize(width.addr, height.addr)
  updateSwapChain(width, height)

proc start(w: Window) {.async.} =
  #this proc async but it can be translated to sync by using waitFor instead of await and deleating discard before call
  var desc: WGPUInstanceDescriptor
  
  let instance = wgpuCreateInstance(cast[ptr WGPUInstanceDescriptor](desc.addr))
  surface = createGlfwWindowSurface(instance, w)  

  let options = WGPURequestAdapterOptions(
      nextInChain: nil,
      compatibleSurface: surface
    )
  adapter = await instance.requestAdapter(options)
  
  device = await adapter.requestDevice
  queue = device.defaultQueue
  
  w.updateSwapChain()

proc frame() =
  var nextTexture = wgpuSwapChainGetCurrentTextureView(swapChain)
  var commandEncoderDesc: WGPUCommandEncoderDescriptor
  commandEncoderDesc.nextInChain = nil
  commandEncoderDesc.label = "Command Encoder"
  var encoder = wgpuDeviceCreateCommandEncoder(device, commandEncoderDesc.addr)

  var renderPassColorAttachment = WGPURenderPassColorAttachment(
    view: nextTexture,
    resolveTarget: cast[WGPUTextureView](nil),
    loadOp: WGPULoadOp_Clear,
    storeOp: WGPUStoreOp_Store,
    clearValue: WGPUColor(
      r: 0.7,
      g: 0.1,
      b: 0.1,
      a: 1.0
    )
  )

  encoder.withRenderPass(
    clearColorPass, 
    WGPURenderPassDescriptor(
      colorAttachmentCount: 1,
      colorAttachments: 
        cast[ptr WGPURenderPassColorAttachment](
          renderPassColorAttachment.addr
        ),
      depthStencilAttachment: nil,
      
      timestampWriteCount: 0,
      timestampWrites: nil,

      nextInChain: nil
    )
  ): discard

  wgpuTextureViewDrop(nextTexture)

  var cmdBufferDescriptor: WGPUCommandBufferDescriptor
  cmdBufferDescriptor.nextInChain = nil
  cmdBufferDescriptor.label = "Command buffer"
  var cmdBuffer = wgpuCommandEncoderFinish(encoder, cmdBufferDescriptor.addr)
  wgpuQueueSubmit(queue, 1, cmdBuffer.addr)


  wgpuSwapChainPresent(swapChain)


# drawing

if init() == 0:
  raise newException(Exception, "Failed to Initialize GLFW")

windowHint(CLIENT_API, NO_API)
var window = createWindow(800, 600, "GLFW3 WINDOW", nil, nil)
window.makeContextCurrent()

discard start(window)
frame()

discard window.setWindowSizeCallback(
  proc (window: Window, width: cint, height: cint) {.cdecl.}=
    updateSwapChain(width, height)
    frame()
)

while windowShouldClose(window) == 0:
  window.swapBuffers()
  pollEvents()

  if window.getKey(KEY_ESCAPE) == 1:
    window.setWindowShouldClose(1)

window.destroyWindow()
terminate()