//   /\/\__/\/\      MFFoundation
//   \/\/..\/\/      Swift Framework - v2.0
//      (oo)
//  MooseFactory     ©2007-2025 - Moose
//    Software
//  ------------------------------------------

import CoreGraphics
import CoreImage

#if os(macOS)
    import Cocoa

extension NSImage {
    
    // To match the UIImage version
    
    convenience init(cgImage: CGImage) {
        self.init(cgImage: cgImage, size: cgImage.size)
    }
}

#else
    import UIKit
#endif

public extension CIImage {
    
#if os(iOS)
    func toUIImage() -> UIImage? {
        toPlatformImage()
    }
#endif
    

#if os(macOS)
    func toNSImage(inputImage: CIImage) -> NSImage? {
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
