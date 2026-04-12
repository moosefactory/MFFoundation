//
//  NControl+Extras.swift
//  MFFoundation
//
//  Created by Tristan Leblanc on 21/02/2026.
//

import AppKit

/// NSControl Extension
public extension NSControl.StateValue {
    /// Returns the switched value of the control state
    public var switched: NSControl.StateValue {
        if self == .on { return .off }
        if self == .off { return .on }
        return .mixed
    }
    
    /// returns controlState == .on
    public var isOn: Bool { self == .on }
    
    /// returns controlState == .off
    public var isOff: Bool { self == .off }
    
    /// returns controlState == .isMixed
    public var isMixed: Bool { self == .mixed }
}
