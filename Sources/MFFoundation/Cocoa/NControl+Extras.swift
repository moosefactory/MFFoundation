//   /\/\__/\/\      MFFoundation
//   \/\/..\/\/      Swift Framework - v2.0
//      (oo)
//  MooseFactory     ©2007-2025 - Moose
//    Software
//  ------------------------------------------
//  􀈿 NControl+Extras.swift
//  􀐚 MFFoundation
//  􀓣 Created by Tristan Leblanc on 21/02/2026.

#if os(macOS)

import AppKit

/// NSControl Extension
public extension NSControl.StateValue {
    /// Returns the switched value of the control state
    var switched: NSControl.StateValue {
        if self == .on { return .off }
        if self == .off { return .on }
        return .mixed
    }
    
    /// returns controlState == .on
    var isOn: Bool { self == .on }
    
    /// returns controlState == .off
    var isOff: Bool { self == .off }
    
    /// returns controlState == .isMixed
    var isMixed: Bool { self == .mixed }
}

#endif
