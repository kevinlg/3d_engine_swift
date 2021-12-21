//
//  Player.swift
//  GameEngine
//
//  Created by Kevin LE GOFF on 11/12/2021.
//

import MetalKit

class Player: GameObject {

    init() {
        super.init(meshType: .triangleMesh)
    }

    override func update(deltaTime: Float) {
        self.rotation.z = -atan2f(Mouse.GetMouseViewportPosition().x - position.x, Mouse.GetMouseViewportPosition().y - position.y)
        super.update(deltaTime: deltaTime)
    }
}
