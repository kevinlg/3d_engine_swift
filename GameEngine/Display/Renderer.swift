//
//  Renderer.swift
//  GameEngine
//
//  Created by Kevin LE GOFF on 09/12/2021.
//

import MetalKit

class Renderer: NSObject, MTKViewDelegate {

    var player = Player()

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

        player.update(deltaTime: 1 / Float(view.preferredFramesPerSecond))
        player.render(renderCommandEncoder: renderCommandEncoder)
        renderCommandEncoder.endEncoding()

        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }


}
