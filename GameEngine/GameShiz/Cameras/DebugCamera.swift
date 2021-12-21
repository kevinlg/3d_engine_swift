//
//  DebugCamera.swift
//  GameEngine
//
//  Created by Kevin LE GOFF on 21/12/2021.
//

import Foundation

class DebugCamera: Camera {
    var position: float3 = float3(repeating: 0)

    var cameraType: CameraType = .debug

    func update(deltaTime: Float) {
        if Keyboard.IsKeyPressed(.leftArrow) {
            self.position.x -= deltaTime
        }

        if Keyboard.IsKeyPressed(.rightArrow) {
            self.position.x += deltaTime
        }

        if Keyboard.IsKeyPressed(.upArrow) {
            self.position.y += deltaTime
        }

        if Keyboard.IsKeyPressed(.downArrow) {
            self.position.y -= deltaTime
        }
    }
}
