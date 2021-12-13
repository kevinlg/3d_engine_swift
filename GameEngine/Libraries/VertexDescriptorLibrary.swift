//
//  VertexDescriptorLibrary.swift
//  GameEngine
//
//  Created by Kevin LE GOFF on 08/12/2021.
//

import MetalKit

enum VertexDescriptorTypes {
    case basic
}

class VertexDescriptorLibrary {
    private static var vertexDescriptors: [VertexDescriptorTypes: VertexDescriptor] = [:]

    public static func initialize() {
        createVertexDescriptors()
    }

    private static func createVertexDescriptors() {
        vertexDescriptors[.basic] = BasicVertexDescriptor()
    }

    public static func vertexDescriptorFor(_ type: VertexDescriptorTypes) -> MTLVertexDescriptor {
        return vertexDescriptors[type]!.vertexDescriptor
    }
}

protocol VertexDescriptor {
    var name: String { get }
    var vertexDescriptor: MTLVertexDescriptor { get }
}


public struct BasicVertexDescriptor: VertexDescriptor {
    var name: String = "Basic Vertex Descriptor"

    var vertexDescriptor: MTLVertexDescriptor {
        let vertexDescriptor = MTLVertexDescriptor()
        vertexDescriptor.attributes[0].format = .float3
        vertexDescriptor.attributes[0].bufferIndex = 0
        vertexDescriptor.attributes[0].offset = 0

        // Color attirbutes
        vertexDescriptor.attributes[1].format = .float4
        vertexDescriptor.attributes[1].bufferIndex = 0
        vertexDescriptor.attributes[1].offset = SIMD3<Float>.size

        // Layout setup
        vertexDescriptor.layouts[0].stride = Vertex.stride
        return vertexDescriptor
    }



}
