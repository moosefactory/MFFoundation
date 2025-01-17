//   /\/\__/\/\      MFFoundation
//   \/\/..\/\/      Swift Framework - v2.0
//      (oo)
//  MooseFactory     ©2007-2025 - Moose
//    Software
//  ------------------------------------------
//  􀈿 Image+Extras.swift
//  􀐚 MFFoundation
//  􀓣 Created by Tristan Leblanc on 20/11/2020.

import CoreGraphics
import CoreImage
#if os(iOS)
    import UIKit
#elseif os(macOS)
    import Cocoa
#endif

// Some various image conversion utilities
// TODO: CLEAN THIS UP!


public extension CIImage {
    
#if os(iOS)
    func toUIImage() -> UIImage? {
        toPlatformImage()
    }
#elseif os(macOS)
    func toNSImage() -> NSImage? {
        toPlatformImage()
    }
#endif
    
    /// This function is particularly useful to create images coming from io surfaces or other textures that do not point on a buffer in app memory.
    
    func toPlatformImage() -> PlatformImage? {
        guard let cgImage = toCGImage() else { return nil }
        return PlatformImage(cgImage: cgImage)
    }
    
    
    /// This function is particularly useful to create images coming from io surfaces or other textures that do not point on a buffer in app memory.
    
    func toCGImage() -> CGImage? {
        let context = CIContext(options: nil)
        if let cgImage = context.createCGImage(self, from: extent) {
            return cgImage
        }
        return nil
    }
    
}

// MARK: - CGImage

public extension CGImage {
    
    /// Returns a qrcode encoding passed string
    static func qrCode(from string: String) -> CGImage? {
        let data = string.data(using: String.Encoding.ascii)
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            if let output = filter.outputImage?.transformed(by: transform) {
                return CIContext().createCGImage(output, from: output.extent)
            }
        }
        
        return nil
    }
}
