//   /\/\__/\/\      MFFoundation
//   \/\/..\/\/      Swift Framework - v2.0
//      (oo)
//  MooseFactory     ©2007-2025 - Moose
//    Software
//  ------------------------------------------
//  􀈿 CGSize+Extras.swift
//  􀐚 MFFoundation
//  􀓣 Created by Tristan Leblanc on 13/04/2021.

#if !os(watchOS)

import Foundation
import QuartzCore

public extension CGSize {
    
    /// Returns a square size
    
    static let one = CGSize(width: 1, height: 1)
    
    /// Returns a square size
    static func square(_ dimension: CGFloat) -> CGSize {
        CGSize(width: dimension, height: dimension)
    }

    init(_ dimension: CGFloat){
        self.init(width: dimension, height: dimension)
    }

    init(_ dimension: Int){
        self.init(width: dimension, height: dimension)
    }

    /// Returns the diagonal length in a rectangle of this size
    var distanceToOrigin: CGFloat {
        return sqrt( width * width + height * height) / 2
    }

    /// Returns the size mapped to fit a (1,1) square
    var fractionalToFit: CGSize {
        return self /  max(width, height)
    }
    
    /// Returns the size mapped to fit a (1,1) square
    var fractionalToFill: CGSize {
        return self /  min(width, height)
    }
    
    /// Returns the size ratio
    var ratio: CGFloat {
        return width / height
    }

    /// returns scaled size fitting passed size
    ///
    /// returns the result size, and the applied scale
    
    func fit(in size: CGSize) -> (CGSize, CGFloat) {
        if width == 0 || height == 0 { return (.zero, 0) }

        var scale = size.width / width
        let newHeight = height * scale
        if newHeight > size.height {
            scale = size.height / height
        }
        let out = CGSize(width: width * scale, height: height * scale)
        return (out, scale)
    }
    
    /// returns scaled size filling passed size
    ///
    /// returns the result size, and the applied scale
    func fill(in size: CGSize) -> (CGSize, CGFloat) {
        if width == 0 || height == 0 { return (.zero, 0) }

        var scale = size.width / width
        let newHeight = height * scale
        if newHeight < size.height {
            scale = size.height / height
        }
        let out = CGSize(width: width * scale, height: height * scale)
        return (out, scale)
    }
}

// MARK: - CGSize/NSNumbers conversions

public extension CGSize {
    
    /// Converts to point
    var asPoint: CGPoint { return CGPoint(x: width, y: height)}

    /// Converts to point
    var asRect: CGRect { return CGRect(origin: .zero, size: self) }

    /// returns dimensions as numbers
    var asNumbers: (NSNumber, NSNumber) {
        return (NSNumber(value: Double(width)), NSNumber(value: Double(height)))
    }
}
#endif
