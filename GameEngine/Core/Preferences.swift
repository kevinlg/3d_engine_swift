//
//  Preferences.swift
//  GameEngine
//
//  Created by Kevin LE GOFF on 07/12/2021.
//

import MetalKit

enum ClearClolors {
    static let green = MTLClearColor(red: 0.43, green: 0.73, blue: 0.35, alpha: 1.0)
    static let white = MTLClearColor(red: 1, green: 1, blue: 1, alpha: 1.0)
    static let black = MTLClearColor(red: 0, green: 0, blue: 0, alpha: 1.0)
}

class Preferences {

    static var clearColr = ClearClolors.black
    static var mainPixelFormat = MTLPixelFormat.bgra8Unorm
    static var startingSceneType = SceneTypes.sandbox
}
