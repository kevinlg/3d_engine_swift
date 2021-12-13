//
//  Renderable.swift
//  GameEngine
//
//  Created by Kevin LE GOFF on 11/12/2021.
//

import MetalKit

protocol Renderable {
    func doRender(_ renderCommandEncode: MTLRenderCommandEncoder)
}
