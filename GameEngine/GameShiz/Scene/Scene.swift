//
//  Scene.swift
//  GameEngine
//
//  Created by Kevin LE GOFF on 13/12/2021.
//

import MetalKit

class Scene: Node {

    var sceneConstants = SceneConstants()
    var cameraManager = CameraManager()


    override init(){
        super.init()
        buildScene()
    }

    func buildScene() {

    }

    func addCamera(_ cam: Camera, isCurrentCamera: Bool = true) {
        cameraManager.registerCamera(cam)
        if isCurrentCamera {
            cameraManager.setCurrentCamera(cam.cameraType)
        }
    }

    func updateCameras(deltaTime: Float) {
        self.cameraManager.update(deltaTime: deltaTime)
    }

    func updateSceneConstant() {
        sceneConstants.viewMatrix = cameraManager.currentCamera.viewMatrix
    }

    override func update(deltaTime: Float) {
        updateSceneConstant()
        super.update(deltaTime: deltaTime)
    }

    override func render(renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.setVertexBytes(&sceneConstants, length: SceneConstants.stride, index: 1)
        super.render(renderCommandEncoder: renderCommandEncoder)
    }
}
