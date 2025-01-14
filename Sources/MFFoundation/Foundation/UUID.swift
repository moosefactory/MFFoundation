//   /\/\__/\/\      MFFoundation
//   \/\/..\/\/      Swift Framework - v2.0
//      (oo)
//  MooseFactory
//    Software       ©2007-2025 - Moose 
//  ------------------------------------------
//  􀈿 UUID.swift
//  􀐚 MFFoundation
//  􀓣 Created by Tristan Leblanc on 10/01/2025.

import Foundation

public extension UUID {

    /// Returns the four first characters of the UUID.
    /// Nice to display UUIDs in console.
    ///
    /// Do not use for identification.
    var short: String { String(uuidString.prefix(4)) }
}
