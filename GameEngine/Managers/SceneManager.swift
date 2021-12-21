import MetalKit

enum SceneTypes {
    case sandbox
}

class SceneManager {

    private static var _currentScene: Scene!

    public static func initialize(_ sceneType: SceneTypes){
        setScene(sceneType)
    }

    public static func setScene(_ sceneType: SceneTypes){
        switch sceneType {
            case .sandbox:
                _currentScene = SandboxScene()
        }
    }

    public static func tickScene(renderCommandEncoder: MTLRenderCommandEncoder, deltaTime: Float) {
        _currentScene.updateCameras(deltaTime: deltaTime)
        _currentScene.update(deltaTime: deltaTime)
        _currentScene.render(renderCommandEncoder: renderCommandEncoder)
    }
}
