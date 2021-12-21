//
//  RenderPipelineStateLibrary.swift
//  GameEngine
//
//  Created by Kevin LE GOFF on 08/12/2021.
//

import MetalKit

public enum RenderPipelineStateTypes {
    case basic
}

protocol RenderPipelineState {
    var name: String { get }
    var renderPipelineState: MTLRenderPipelineState! { get }
}

public class RenderPipelineStateLibrary {

    private static var renderPipelineStates: [RenderPipelineStateTypes: RenderPipelineState] = [:]

    public static func initialize() {
        createDefaultrenderPipelineStates()
    }

    public static func createDefaultrenderPipelineStates() {
        renderPipelineStates[.basic] = BasicRenderPipelineState()
    }

    public static func renderPipelineStateFor(_ type: RenderPipelineStateTypes) -> MTLRenderPipelineState {
        return renderPipelineStates[.basic]!.renderPipelineState
    }
}


struct BasicRenderPipelineState: RenderPipelineState {
    var name: String =  "Basic Render Pipeline State"

    var renderPipelineState: MTLRenderPipelineState!

    init() {
        let descriptor = RenderPipelineDescriptorLibrary.renderPipelineDescriptorFor(.basic)
        renderPipelineState = try! Engine.device.makeRenderPipelineState(descriptor: descriptor)
    }

}
