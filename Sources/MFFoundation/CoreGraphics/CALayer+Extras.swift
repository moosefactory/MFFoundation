//   /\/\__/\/\      MFFoundation
//   \/\/..\/\/      Swift Framework - v2.0
//      (oo)
//  MooseFactory     ©2007-2025 - Moose
//    Software
//  ------------------------------------------
//  􀈿 CALayer+Extras.swift
//  􀐚 MFFoundation
//  􀓣 Created by Tristan Leblanc on 20/11/2020.

#if !os(watchOS)

import Foundation
import QuartzCore
import CoreImage

// MARK: - CALayer

public extension CALayer {

    /// Iterate through all sublayers
    func forEachSublayer(_ closure: (CALayer)->Void) {
        guard let sublayers = sublayers else { return }
        sublayers.forEach { closure($0) }
    }

    /// Iterate through all sublayers of a given type
    func forEachSublayer<T: CALayer>(_ closure: (T)->Void) {
        guard let sublayers = sublayers?.compactMap({ $0 as? T}) else { return }
        sublayers.forEach { closure($0) }
    }

    /// Remove all sublayers
    func removeAllSublayers() {
        sublayers?.forEach { $0.removeFromSuperlayer() }
    }

    /// Remove all sublayers of a given type
    /// The parameter is not used, but required to use syntax removeAllSublayers<MyLayerClass>
    func removeAllSublayers<T>(ofType type: T.Type) {
        guard let sublayers = sublayers?.compactMap({ ($0 as? T) as? CALayer? }) else { return }
        sublayers.forEach { $0?.removeFromSuperlayer() }
    }

    /// Return a non optional display name
    var displayName: String {
        return name ?? "<Unnamed Layer>"
    }

    /// Return the coordinates of the layer center, in layer referential ( bounds center )
    var center: CGPoint {
        return bounds.boundsCenter
    }
}

#endif
