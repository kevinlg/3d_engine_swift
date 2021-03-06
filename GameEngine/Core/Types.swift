import Foundation
import MetalKit

// MARK: - Sizeable
protocol Sizeable {}

// MARK: - Sizeable default implementation
extension Sizeable {

    static var size: Int {
        return MemoryLayout<Self>.size
    }

    static var stride: Int {
        return MemoryLayout<Self>.stride
    }


    static func size(_ count: Int) -> Int {
        return MemoryLayout<Self>.size * count
    }

    static func stride(_ count: Int) -> Int {
        return MemoryLayout<Self>.stride * count
    }

}

// MARK: - Vertex
struct Vertex: Sizeable {
    var position: float3 // 16 Byte
    var color: float4
}

// SMID<T> extension
extension SIMD4: Sizeable where Scalar == Float {}
extension SIMD3: Sizeable where Scalar == Float {}

extension Float: Sizeable {}


// MARK: - Model Constants

struct ModelConstants: Sizeable {
    var modelMatrix = matrix_identity_float4x4
}

struct SceneConstants: Sizeable {
    var viewMatrix = matrix_identity_float4x4
}


// MARK: - SIMD types
public typealias float3 = SIMD3<Float>
public typealias float4 = SIMD4<Float>
public typealias float2 = SIMD2<Float>
