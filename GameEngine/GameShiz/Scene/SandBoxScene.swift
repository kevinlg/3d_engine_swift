//
//  SandBoxScene.swift
//  GameEngine
//
//  Created by Kevin LE GOFF on 13/12/2021.
//

import MetalKit

class SandboxScene: Scene {

    var debugCamera = DebugCamera()

    var count = 5

    override func buildScene() {

        addCamera(debugCamera)
        for y in -count..<count{
            for x in -count..<count{
                let pointer = Pointer(camera: debugCamera)
                pointer.position.y = Float(Float(y) + 0.5) / Float(count)
                pointer.position.x = Float(Float(x) + 0.5) / Float(count)
                pointer.scale = float3(0.1, 0.1, 0.1)
                addChild(pointer)
            }
        }
    }

    override func update(deltaTime: Float) {
        print(Mouse.GetMouseViewportPosition())
        super.update(deltaTime: deltaTime)
    }

}
