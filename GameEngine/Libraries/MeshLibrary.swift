//
//  MeshLibrary.swift
//  GameEngine
//
//  Created by Kevin LE GOFF on 11/12/2021.
//

import MetalKit

enum MeshType {
    case triangleMesh
    case quadMesh
}


protocol Mesh {
    var vertexBuffer: MTLBuffer! { get }
    var vertexCount: Int! { get }
}


class MeshLibrary {

    private static var meshes: [MeshType:Mesh] = [:]

    public static func Initialize() {
        createDefaultMeshes()
    }

    private static func createDefaultMeshes() {
        meshes[.triangleMesh] = TriangleCustomMesh()
        meshes[.quadMesh] = QuadCustomMesh()
    }

    public static func meshFor(type: MeshType) -> Mesh {
        return meshes[type]!
    }
}


class CustomMesh: Mesh {

    var vertexBuffer: MTLBuffer!
    var vertexCount: Int! {
        vertices.count
    }

    var vertices: [Vertex]!

    init() {
        createVertices()
        createBuffers()
    }

    func createVertices() {}

    func createBuffers() {
        vertexBuffer = Engine.device.makeBuffer(bytes: vertices, length: Vertex.stride(vertices.count), options: [])
    }
}


class TriangleCustomMesh: CustomMesh {

    override func createVertices() {
        vertices = [
            Vertex(position: float3( 0,  1, 0), color: float4(1, 0, 0, 1)),
            Vertex(position: float3(-1, -1, 0), color: float4(0, 1, 0, 1)),
            Vertex(position: float3( 1, -1, 0), color: float4(0, 0, 1, 1))
        ]
    }
}

class QuadCustomMesh: CustomMesh {

    override func createVertices() {
        vertices = [
            Vertex(position: float3( 1, 1,0), color: float4(1,0,0,1)), //Top Right
            Vertex(position: float3(-1, 1,0), color: float4(0,1,0,1)), //Top Left
            Vertex(position: float3(-1,-1,0), color: float4(0,0,1,1)),  //Bottom Left

            Vertex(position: float3( 1, 1,0), color: float4(1,0,0,1)), //Top Right
            Vertex(position: float3(-1,-1,0), color: float4(0,0,1,1)), //Bottom Left
            Vertex(position: float3( 1,-1,0), color: float4(1,0,1,1))  //Bottom Right
        ]
    }
}
