//   /\/\__/\/\      MFFoundation
//   \/\/..\/\/      Swift Framework - v2.0
//      (oo)
//  MooseFactory     ©2007-2025 - Moose
//    Software
//  ------------------------------------------
//  􀈿 OptionSet.swift
//  􀐚 MFFoundation
//  􀓣 Created by Tristan Leblanc on 06/02/2025.

import Foundation

public extension OptionSet {
    
    /// Insert the given element if not present, else removes it.
    mutating func toggle(_ element: Element) {
        if contains(element) {
            remove(element)
        } else {
            insert(element)
        }
    }
    
}
