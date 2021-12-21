//
//  Camera.swift
//  GameEngine
//
//  Created by Kevin LE GOFF on 21/12/2021.
//

import Foundation
import simd

enum CameraType {
    case debug
}

protocol Camera {
    var position: float3 {get set}
    var cameraType: CameraType { get }
    func update(deltaTime: Float)
}

extension Camera {
    var viewMatrix: matrix_float4x4 {
        var viewMatrix = matrix_identity_float4x4
        viewMatrix.translate(direction: -position)
        return viewMatrix
    }
}
