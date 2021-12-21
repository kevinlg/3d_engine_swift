//
//  SandBoxScene.swift
//  GameEngine
//
//  Created by Kevin LE GOFF on 13/12/2021.
//

import MetalKit

class SandboxScene: Scene {

    let player = Player()
    var count = 5

    override func buildScene() {
        for y in -count..<count{
            for x in -count..<count{
                let player = Player()
                player.position.y = Float(Float(y) + 0.5) / Float(count)
                player.position.x = Float(Float(x) + 0.5) / Float(count)
                player.scale = float3(0.1, 0.1, 0.1)
                addChild(player)
            }
        }
    }

    override func update(deltaTime: Float) {
        print(Mouse.GetMouseViewportPosition())
        super.update(deltaTime: deltaTime)
    }

}
