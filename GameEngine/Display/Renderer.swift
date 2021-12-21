//
//  Renderer.swift
//  GameEngine
//
//  Created by Kevin LE GOFF on 09/12/2021.
//

import MetalKit

class Renderer: NSObject, MTKViewDelegate {


    public static var screenSize: float2 = float2(repeating: 0)

    init(_ view: MTKView) {
        super.init()
        updateScreenSize(view: view)
    }



    public func updateScreenSize(view: MTKView) {
        Renderer.screenSize = float2(Float(view.bounds.width), Float(view.bounds.height))
    }

    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        // When the window is resize
        // Very handy when doing projection matrices
    }

    func draw(in view: MTKView) {
        // Draw
        guard let drawable =  view.currentDrawable,
              let renderPassDescriptor = view.currentRenderPassDescriptor else {
                  return
              }
        let commandBuffer = Engine.commandQueue.makeCommandBuffer()
        let commandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
        guard let renderCommandEncoder = commandEncoder else {
            fatalError("could not create a MTLRenderCommandEncoder")
        }

        let deltaTime =  1 / Float(view.preferredFramesPerSecond)
        SceneManager.tickScene(renderCommandEncoder: renderCommandEncoder, deltaTime: deltaTime)

        renderCommandEncoder.endEncoding()

        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }


}
