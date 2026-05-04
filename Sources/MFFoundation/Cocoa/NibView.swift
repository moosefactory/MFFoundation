//   /\/\__/\/\      MFFoundation
//   \/\/..\/\/      Swift Framework - v2.0
//      (oo)
//  MooseFactory     ©2007-2025 - Moose
//    Software
//  ------------------------------------------
//  􀈿 NibView.swift
//  􀐚 MFFoundation
//  􀓣 Created by Tristan Leblanc on 12/11/2025.

#if os(macOS)

import AppKit

public protocol NibView: NSView {
    static var nibFileName: String { get }
}

public extension NibView {
    
    @MainActor static func loadFromNib(filename: String? = nil) -> Self {
        var _objects: NSArray?
        NSNib(nibNamed: filename ?? nibFileName, bundle: nil)?.instantiate(withOwner: nil, topLevelObjects: &_objects)
        guard let objects = _objects,
            let view = (objects.first { $0.self is Self }) as? Self else {
            fatalError()
        }
        return view
    }

}

#endif
