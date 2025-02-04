//   /\/\__/\/\      MFFoundation
//   \/\/..\/\/      Swift Framework - v2.0
//      (oo)
//  MooseFactory
//    Software       ©2007-2025 - Moose
//  ------------------------------------------
//  􀈿 JSONCodable.swift
//  􀐚 MFFoundation
//  􀓣 Created by Tristan Leblanc on 07/12/2020.

#if !os(watchOS)

import Foundation
import QuartzCore

#if os(macOS)
import Cocoa
#else
import UIKit
#endif

#if !os(macOS)

public extension UIImage {
    
    
    convenience init(cgImage: CGImage, size: CGSize) {
        do {
            let scaledContext = try BitmapUtils.createBitMap(size: size)
            scaledContext.draw(cgImage, in: size.asRect, byTiling: false)
            let cgImage = scaledContext.makeImage()
            self.init(cgImage: cgImage!)
        }
        catch {
            self.init(cgImage: cgImage)
        }
    }
    
    
    /// Throwing cgImage accessor
    /// - Returns: The UIImage object
    func cgImage() throws -> CGImage {
        guard let cgImage = cgImage else {
            throw(NSError())
        }
        return cgImage
    }

}

#endif

#if os(macOS)
extension PlatformImage {
    
    /// Throwing cgImage accessor
    /// - Returns: The CGImage
    func cgImage() throws -> CGImage {
        var rect = CGRect(origin: .zero, size: self.size)
        let cgImage = cgImage(forProposedRect: &rect, context: nil, hints: nil)
        guard let cgImage = cgImage else {
            throw(BitmapUtils.Errors.notEnoughMemoryToCreateBitmap)
        }
        return cgImage
    }
}


#endif

// MARK: - Images

public extension PlatformImage {
    
    /// Returns a CGContext with image data
    /// - Returns: The CGContext
    func bitmap() throws -> CGContext  {
        let bitmap = try BitmapUtils.createBitMap(size: size)
        let rect = bitmap.size.asRect
        let cg = try cgImage()
        bitmap.draw(cg, in: rect, byTiling: false)
        return bitmap
    }
    
    var bounds: CGRect {
        return CGRect(origin: .zero, size: size)
    }
}

public extension CGImage {
    
    var size: CGSize {
        return CGSize(width: width, height: height)
    }
}

#if os(macOS)

public extension CGImage {
    
    var nsImage: NSImage {
        return NSImage(cgImage: self, size: size)
    }
}

public extension NSImage {
    
    func jpegData(quality: CGFloat = 0.5) throws -> Data {
        let cg = try cgImage()
        let bitmapRep = NSBitmapImageRep(cgImage: cg)
        guard let jpegData = bitmapRep.representation(using: NSBitmapImageRep.FileType.jpeg,
                                                      properties: [NSBitmapImageRep.PropertyKey.compressionFactor :  NSNumber(value: Double(quality))]) else {
            throw BitmapUtils.Errors.cantGenerateJPEGData
        }
        return jpegData
    }
}

#endif

#endif // watch
