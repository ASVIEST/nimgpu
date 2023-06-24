## high level webgpu bindings

import nimgpu/wgpu_native
import std/asyncfutures

type
  Instance = wgpu_native.WGPUInstance
  Adapter = wgpu_native.WGPUAdapter
  Device = wgpu_native.WGPUDevice

export wgpu_native

proc requestAdapter*(
  instance: Instance, 
  options: WGPURequestAdapterOptions
  ): Future[WGPUAdapter] = 
  var ret {.global.}: WGPUAdapter

  proc requestAdapterCallback(
    status: WGPURequestAdapterStatus,
    adapter: WGPUAdapter, message: cstring,
    userdata: pointer
  )=
    assert status == WGPURequestAdapterStatus_Success, $status
    ret = adapter
  
  wgpuInstanceRequestAdapter(
    instance,
    cast[ptr WGPURequestAdapterOptions](options.addr),
    requestAdapterCallback,
    nil
  )
  
  while ret.addr.isNil:
    discard

  var retFuture = newFuture[WGPUAdapter]("nimgpu.requestAdapter")
  retFuture.complete(ret)
  
  retFuture

proc requestAdapter*(instance: Instance): Future[WGPUAdapter]=
  var options = WGPURequestAdapterOptions.default
  instance.requestAdapter(options)

proc requestDevice*(
  adapter: Adapter, 
  desc: WGPUDeviceDescriptor
  ): Future[WGPUDevice]=
  var ret {.global.}: WGPUDevice

  proc requestDeviceCallback(
    status: WGPURequestDeviceStatus,
    device: WGPUDevice, message: cstring,
    userdata: pointer)=
    assert status == WGPURequestDeviceStatus_Success
    ret = device
  
  wgpuAdapterRequestDevice(
    adapter,
    cast[ptr WGPUDeviceDescriptor](desc.addr),
    requestDeviceCallback,
    nil
  )
  
  while ret.addr.isNil:
    discard

  var retFuture = newFuture[WGPUDevice]("nimgpu.requestDevice")
  retFuture.complete(ret)
  
  retFuture

proc requestDevice*(adapter: Adapter): Future[WGPUDevice]=
  var desc = WGPUDeviceDescriptor.default
  adapter.requestDevice(desc)

proc features*(adapter: Adapter): seq[WGPUFeatureName]=
  let featureCount = adapter.wgpuAdapterEnumerateFeatures(nil)
  result.setLen(featureCount)
  discard adapter.wgpuAdapterEnumerateFeatures(
    cast[ptr WGPUFeatureName](result[0].addr)
  )

proc limits*(adapter: Adapter): WGPUSupportedLimits=
  discard adapter.wgpuAdapterGetLimits(
    cast[ptr WGPUSupportedLimits](result.addr)
  )

proc defaultQueue*(device: Device): WGPUQueue=
  device.wgpuDeviceGetQueue()



template withRenderPass*(
  encoder: WGPUCommandEncoder, 
  passEncoderName: untyped{ident}, 
  passDescriptor: var WGPURenderPassDescriptor,
  body: untyped
  )=

  block:
    var passEncoderName {.inject.} = wgpuCommandEncoderBeginRenderPass(
      encoder, 
      passDescriptor.addr
      )
    
    body

    wgpuRenderPassEncoderEnd(passEncoderName)

template withComputePass*(
  encoder: WGPUCommandEncoder, 
  passEncoderName: untyped{ident}, 
  passDescriptor: var WGPUComputePassDescriptor,
  body: untyped
  )=

  block:
    var passEncoderName {.inject.} = wgpuCommandEncoderBeginComputePass(
      encoder, 
      passDescriptor.addr
      )
    
    body

    wgpuComputePassEncoderEnd(passEncoderName)

template withRenderPass*(
  encoder: WGPUCommandEncoder, 
  passEncoderName: untyped{ident}, 
  passDescriptor: WGPURenderPassDescriptor,
  body: untyped
  )=
  var passDescriptorVar = passDescriptor
  withRenderPass(encoder, passEncoderName, passDescriptorVar, body)

template withComputePass*(
  encoder: WGPUCommandEncoder, 
  passEncoderName: untyped{ident}, 
  passDescriptor: WGPUComputePassDescriptor,
  body: untyped
  )=
  var passDescriptorVar = passDescriptor
  withRenderPass(encoder, passEncoderName, passDescriptorVar, body)