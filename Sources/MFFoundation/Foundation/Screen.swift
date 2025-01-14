//   /\/\__/\/\      MFFoundation
//   \/\/..\/\/      Swift Framework - v2.0
//      (oo)
//  MooseFactory     ©2007-2025 - Moose
//    Software
//  ------------------------------------------
//  􀈿 Screen.swift
//  􀐚 MFFoundation
//  􀓣 Created by Tristan Leblanc on 12/01/2025.

import Foundation

#if os(iOS)
import UIKit

public extension UIScreen {
    
    /// Returns interface orientation
    ///
    /// From StackOverflow : https://stackoverflow.com/questions/25462091/get-device-current-orientation-app-extension/37329460#37329460
    var orientation: UIInterfaceOrientation {
        let point = coordinateSpace.convert(CGPoint.zero, to: fixedCoordinateSpace)
        switch (point.x, point.y) {
        case (0, 0):
            return .portrait
        case let (x, y) where x != 0 && y != 0:
            return .portraitUpsideDown
        case let (0, y) where y != 0:
            return .landscapeLeft
        case let (x, 0) where x != 0:
            return .landscapeRight
        default:
            return .unknown
        }
    }
}

#endif
