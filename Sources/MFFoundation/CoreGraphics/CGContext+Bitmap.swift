//   /\/\__/\/\      MFFoundation
//   \/\/..\/\/      Swift Framework - v2.0
//      (oo)
//  MooseFactory     ©2007-2025 - Moose
//    Software
//  ------------------------------------------
//  􀈿 CGContext+Bitmap.swift
//  􀐚 MFFoundation
//  􀓣 Created by Tristan Leblanc on 18/11/2020.

#if !os(watchOS)

import Foundation
import QuartzCore

/// Some bitmap utilities
public struct BitmapUtils {
    
    /// Some errors used in this file, and usable outside to handle classic bitmap errors
    public enum Errors: String, Error {
        /// Invalid size
        case cantCreateZeroSizeBitmap
        /// Good old memory error
        case notEnoughMemoryToCreateBitmap
        /// To use when trying to make a cgImage from an NSImage
        case cantMakeCGImageFromNSImage
        /// To use when trying to create jpeg data representation
        case cantGenerateJPEGData
    }
    
    /// Safe RGBA Bitmap creator
    /// - Parameter size: The bitmap size in pixels
    /// - Returns: A graphic context initialized with RGBA format
    
    public static func createBitMap(size: CGSize) throws -> CGContext {
        guard Int(size.width) >= 1 && Int(size.height) >= 1 else {
            throw Errors.cantCreateZeroSizeBitmap
        }

        let cs = CGColorSpaceCreateDeviceRGB()

        let bitmap = CGContext(data: nil, width: Int(size.width), height: Int(size.height), bitsPerComponent: 8, bytesPerRow: 4 * Int(size.width), space: cs, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)
        
        if bitmap == nil {
            throw Errors.notEnoughMemoryToCreateBitmap
        }
        
        return bitmap!
    }
}

/// Simple UInt8 RGBA representation
public typealias RGBATuplet = (r: UInt8, g: UInt8, b: UInt8, a: UInt8)

/// The signature of the closure passed in scanning loop
public typealias CGContextRawScanParameters = (Int, Int)->RGBATuplet

/// The signature of the closure passed in scanning loop
public typealias CGContextScanParameters = (CGPoint, inout Any?, CGAffineTransform)->RGBATuplet


public extension CGContext {

    /// Returns the context size.
    var size: CGSize {
        CGSize(width: width, height: height)
    }
    
    /// Overwrite pixels in bitmap by calling a components generation closure
    /// - Parameter componentsGenerator: A closure to execute for each pixel

    func rawScan(componentsGenerator: CGContextRawScanParameters) {
        for y in 0..<height {
            for x in 0..<width {
                setColorComponents(x: x, y: y, components: componentsGenerator(x,y))
            }
        }
    }
    
    /// Overwrite pixels in bitmap by calling a components generation closure
    /// - Parameters:
    ///   - ctm: An optional transform
    ///   - userInfo: some user data that are propagated through the scan
    ///   - componentsGenerator: A closure to execute for each pixel

    func scan(ctm: CGAffineTransform = .identity, userInfo: inout Any?, componentsGenerator: CGContextScanParameters) {
        for y in 0..<height {
            for x in 0..<width {
                let p = CGPoint(x: x, y: y).applying(ctm)
                let components = componentsGenerator(p, &userInfo, ctm)
                setColorComponents(x: x, y: y, components: components)
            }
        }
    }

    /// Returns the pixel at given coordinates
    /// - Parameters:
    ///   - x: The x location
    ///   - y: The y location
    /// - Returns: The RGBA value of the pixel at (x,y) if location was in image, or nil.
    
    func colorComponents(x: Int, y: Int) -> (RGBATuplet)? {
        guard  0<=x && x<width, 0<=y && y<height else { return nil }
        guard let uncasted_data = self.data else { return nil }
        let data: UnsafeMutablePointer<UInt8> = uncasted_data.assumingMemoryBound(to: UInt8.self)
        let offset = 4 * (y * width + x)
        return RGBATuplet(r: data[offset], g: data[offset+1], b: data[offset+2], a: data[offset+3])
    }

    /// Returns the pixel at given fractionnal coordinates ( [0.0,1.0] )
    /// - Parameters:
    ///   - x: Fractional x location in image [0..1]
    ///   - y: Fractional y location in image [0..1]
    /// - Returns: The RGBA value of the pixel at (x,y) if location was in image, or nil.

    func colorComponents(fractionalX x: CGFloat, fractionalY y: CGFloat) -> (RGBATuplet)? {
        guard  0<=x && x<=1, 0<=y && y<=1 else { return nil }
        let x = Int(CGFloat(width) * x)
        let y = Int(CGFloat(height) * y)
        guard let uncasted_data = self.data else { return nil }
        let data: UnsafeMutablePointer<UInt8> = uncasted_data.assumingMemoryBound(to: UInt8.self)
        let offset = 4 * (y * width + x)
        return RGBATuplet(r: data[offset], g: data[offset+1], b: data[offset+2], a: data[offset+3])
    }

    /// Replace the pixel at given coordinates
    /// - Parameters:
    ///   - x: x location in image [0..1]
    ///   - y: y location in image [0..1]
    ///   - components: The RGBA value to set
    
    func setColorComponents(x: Int, y: Int, components: RGBATuplet) {
        guard  0<=x && x<width, 0<=y && y<height else { return }
        guard let uncasted_data = self.data else { return }
        let data: UnsafeMutablePointer<UInt8> = uncasted_data.assumingMemoryBound(to: UInt8.self)
        let offset = 4 * (y * width + x)
        data[offset] = components.r
        data[offset+1] = components.g
        data[offset+2] = components.b
        data[offset+3] = components.a
    }
}

#endif
