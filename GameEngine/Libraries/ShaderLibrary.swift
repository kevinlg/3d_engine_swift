//
//  ShaderLibrary.swift
//  GameEngine
//
//  Created by Kevin LE GOFF on 07/12/2021.
//

import MetalKit

enum VertexShaderType {
    case basic
}

enum FragmentShaderType {
    case basic
}

class ShaderLibrary {
    
    private static var vertexShaders: [VertexShaderType: Shader] = [:]
    private static var framgnetShaders: [FragmentShaderType: Shader] = [:]
    
    
    public static var defaultLibrary: MTLLibrary!
    
    public static func initialize() {
        defaultLibrary = Engine.device.makeDefaultLibrary()
        createShaders()
    }
    
    private static func createShaders() {
        vertexShaders[.basic] = BasicVertexShader()
        framgnetShaders[.basic] = BasicFragmentShader()
    }
    
    public static func vertexShaderFor(_ type: VertexShaderType) -> MTLFunction {
        return vertexShaders[type]!.function
    }
    
    public static func fragmentShaderFor(_ type: FragmentShaderType) -> MTLFunction {
        return framgnetShaders[type]!.function
    }
    
    
}


protocol Shader {
    var name: String { get}
    var functionName: String { get }
    var function: MTLFunction! { get }
}

public struct BasicVertexShader: Shader {
    var name: String = "Basic Vertex Shader"
    
    var functionName: String = "basic_vertex_shader"
    
    var function: MTLFunction!
    
    init() {
        function = ShaderLibrary.defaultLibrary.makeFunction(name: functionName)
        function.label = name
    }
}


public struct BasicFragmentShader: Shader {
    var name: String = "Basic Fragment Shader"
    
    var functionName: String = "basic_fragment_shader"
    
    var function: MTLFunction!
    
    init(){
        function = ShaderLibrary.defaultLibrary.makeFunction(name: functionName)
        function.label = name
    }
}
