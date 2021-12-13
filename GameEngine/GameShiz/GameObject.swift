//
//  GameObject.swift
//  GameEngine
//
//  Created by Kevin LE GOFF on 09/12/2021.
//

import MetalKit

class GameObject: Node {

    var modelConstant: ModelConstants = ModelConstants()

    var mesh: Mesh

    init(meshType: MeshType) {
        mesh =  MeshLibrary.meshFor(type: meshType)
    }


    var time: Float = 0
    func update(deltaTime: Float) {
        time += deltaTime
        self.scale = SIMD3<Float>(repeating: cos(time))
        updateModelConstants()
    }

    private func updateModelConstants() {
        modelConstant.modelMatrix = self.modelMatrix
    }
}

extension GameObject: Renderable {
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {

        renderCommandEncoder.setVertexBytes(&modelConstant, length: ModelConstants.stride, index: 1)
        renderCommandEncoder.setRenderPipelineState(RenderPipelineStateLibrary.renderPipelineStateFor(.basic))
        renderCommandEncoder.setVertexBuffer(mesh.vertexBuffer, offset: 0, index: 0)
        renderCommandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: mesh.vertexCount)
    }


}
