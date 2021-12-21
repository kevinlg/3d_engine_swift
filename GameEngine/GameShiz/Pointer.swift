//
//  Player.swift
//  GameEngine
//
//  Created by Kevin LE GOFF on 11/12/2021.
//

import MetalKit

class Pointer: GameObject {
    private var camera: Camera

    init(camera: Camera) {
        self.camera = camera
        super.init(meshType: .triangleMesh)
    }

    override func update(deltaTime: Float) {
        self.rotation.z = -atan2f(Mouse.GetMouseViewportPosition().x - position.x + camera.position.x,
                                  Mouse.GetMouseViewportPosition().y - position.y + camera.position.y)
        super.update(deltaTime: deltaTime)
    }
}
