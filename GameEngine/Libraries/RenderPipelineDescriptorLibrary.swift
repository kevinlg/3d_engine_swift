//
//  RenderPipelineLibrary.swift
//  GameEngine
//
//  Created by Kevin LE GOFF on 08/12/2021.
//

import MetalKit

public enum RenderPipelineDescriptorLibraryTypes {
    case basic
}


public class RenderPipelineDescriptorLibrary {

    private static var rendersPipelineStateDescriptors: [RenderPipelineDescriptorLibraryTypes: RenderPipelineDescriptor] = [:]

    public static func initialize() {
        createRenderPipelineDescriptors()
    }

    private static func createRenderPipelineDescriptors() {
        rendersPipelineStateDescriptors[.basic] = BasicRenderPipelineDescriptor()
    }

    public static func renderPipelineDescriptorFor(_ type: RenderPipelineDescriptorLibraryTypes) -> MTLRenderPipelineDescriptor {
        return rendersPipelineStateDescriptors[.basic]!.renderPipelineStateDescriptor
    }
}

public protocol RenderPipelineDescriptor {
    var name: String { get }
    var renderPipelineStateDescriptor: MTLRenderPipelineDescriptor! { get }
}

public class BasicRenderPipelineDescriptor: RenderPipelineDescriptor {
    public var name: String = "Basic Render Pipeline Descriptor "

    public var renderPipelineStateDescriptor: MTLRenderPipelineDescriptor!

    init(){
        renderPipelineStateDescriptor = MTLRenderPipelineDescriptor()
        renderPipelineStateDescriptor.colorAttachments[0].pixelFormat = Preferences.mainPixelFormat
        renderPipelineStateDescriptor.vertexFunction = ShaderLibrary.vertexShaderFor(.basic)
        renderPipelineStateDescriptor.fragmentFunction = ShaderLibrary.fragmentShaderFor(.basic)
        renderPipelineStateDescriptor.vertexDescriptor = VertexDescriptorLibrary.vertexDescriptorFor(.basic)
    }


}
