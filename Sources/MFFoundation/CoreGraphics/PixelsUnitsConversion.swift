//   /\/\__/\/\      MFFoundation
//   \/\/..\/\/      Swift Framework - v2.0
//      (oo)
//  MooseFactory     ©2007-2025 - Moose
//    Software
//  ------------------------------------------
//  􀈿 PixelsUnitsConversion.swift
//  􀐚 MFFoundation
//  􀓣 Created by Tristan Leblanc on 07/12/2020.

#if !os(watchOS)
import Foundation
import QuartzCore
#if os(macOS)
import Cocoa
#endif

// MARK: - Milimeters/Inches <-> Pixels

public extension CGFloat {
    
    var milimetersToInches: CGFloat {
        return self / 25.4
    }
    
    var inchesToMilimeters: CGFloat {
        return self * 25.4
    }
    
    #if os(macOS)

    func milimetersToPixels(res: CGFloat = 72) -> CGFloat {
        return self.milimetersToInches * NSScreen.screenRes
    }
    
    var milimetersToScreenPixels: CGFloat {
        return self.milimetersToInches * NSScreen.screenRes
    }
    #endif
}

public extension CGSize {
    var milimetersToInches: CGSize {
        return CGSize(width: width.milimetersToInches, height: height.milimetersToInches)
    }
        
    #if os(macOS)
    
    func milimetersToPixels(res: CGFloat = 72) -> CGSize {
        return CGSize(width: width.milimetersToPixels(res: res), height: height.milimetersToPixels(res: res))
    }

    var milimetersToScreenPixels: CGSize {
        return CGSize(width: width.milimetersToScreenPixels, height: height.milimetersToScreenPixels)
    }
    #endif

}

public extension CGPoint {
    
    var milimetersToInches: CGPoint {
        return CGPoint(x: x.milimetersToInches, y: y.milimetersToInches)
    }

    #if os(macOS)
    
    func milimetersToPixels(res: CGFloat = 72) -> CGPoint {
        return CGPoint(x: x.milimetersToPixels(res: res), y: y.milimetersToPixels(res: res))
    }
    
    var milimetersToScreenPixels: CGPoint {
        return CGPoint(x: x.milimetersToScreenPixels, y: y.milimetersToScreenPixels)
    }
    
    #endif
}

#endif
