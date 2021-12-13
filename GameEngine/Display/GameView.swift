//
//  GameView.swift
//  GameEngine
//
//  Created by Kevin LE GOFF on 30/11/2021.
//

import MetalKit


class GameView: MTKView {
    
    var renderer: Renderer!

    required init(coder: NSCoder) {
        super.init(coder: coder)
        self.device = MTLCreateSystemDefaultDevice()
        Engine.Ignite(device: device!)
        self.clearColor = Preferences.clearColr
        self.colorPixelFormat = Preferences.mainPixelFormat
        self.renderer = Renderer()
        self.delegate = renderer
    }
}
