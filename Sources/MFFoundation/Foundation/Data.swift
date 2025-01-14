//   /\/\__/\/\      MFFoundation
//   \/\/..\/\/      Swift Framework - v2.0
//      (oo)
//  MooseFactory     ©2007-2025 - Moose
//    Software
//  ------------------------------------------
//  Data.swift
//  Created by Tristan Leblanc on 10/01/2025.

import Foundation

public extension Data {
    
    /// Quick utf8 data to string converter
    var utf8: String? {
        String(data: self, encoding: .utf8)
    }
    
    /// Append the utf8 string to the data
    /// - Parameter string: The utf8 string to append
    mutating func appendString(_ string: String) {
        if let data = string.data(using: .utf8) {
            self.append(data)
        }
    }
}
