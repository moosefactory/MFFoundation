//
//  NibView.swift
//  OPO Model Migrator
//
//  Created by Tristan Leblanc on 12/11/2025.
//

import Foundation
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
