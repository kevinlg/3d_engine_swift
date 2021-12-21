//
//  CamaraManagers.swift
//  GameEngine
//
//  Created by Kevin LE GOFF on 21/12/2021.
//

import Foundation

class CameraManager {

    private var _cameras: [CameraType: Camera] = [:]

    var currentCamera: Camera!

    public func registerCamera(_ camera: Camera) {
        self._cameras.updateValue(camera, forKey: camera.cameraType)
    }

    public func setCurrentCamera(_ cameraType: CameraType) {
        self.currentCamera = _cameras[cameraType]
    }

    internal func update(deltaTime: Float) {
        for camera in _cameras.values {
            camera.update(deltaTime: deltaTime)
        }
    }
}
