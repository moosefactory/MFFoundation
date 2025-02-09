//   /\/\__/\/\      MFFoundation
//   \/\/..\/\/      Swift Framework - v2.0
//      (oo)
//  MooseFactory
//    Software       ©2007-2025 - Moose
//  ------------------------------------------
//  􀈿 Dictionary.swift
//  􀐚 MFFoundation
//  􀓣 Created by Tristan Leblanc on 06/12/2020.

import Foundation

#if os(macOS)
import Cocoa
#else
import UIKit
#endif

public extension Dictionary where Key == String, Value == Any {
    
    /// Returns a string from a dictionary
    /// - Parameter key: The dictionary key ( AnyHashable )
    /// - Returns: the string value stored at key, if any
    func string(_ key: Key) -> String? {
        return self[key] as? String
    }
    
    /// Returns a string from a dictionary
    /// - Parameter key: The dictionary key ( AnyHashable )
    /// - Returns: the int value stored at key, if any
    func int(_ key: Key) -> Int? {
        return self[key] as? Int
    }
    
    /// Returns a string from a dictionary
    /// - Parameter key: The dictionary key ( AnyHashable )
    /// - Returns: the float value stored at key, if any
    func float(_ key: Key) -> Float? {
        return self[key] as? Float
    }
    
    /// Returns a string from a dictionary
    /// - Parameter key: The dictionary key ( AnyHashable )
    /// - Returns: the double value stored at key, if any
    func double(_ key: Key) -> Double? {
        return self[key] as? Double
    }

    /// Returns a string from a dictionary
    /// - Parameter key: The dictionary key ( AnyHashable )
    /// - Returns: the bool value stored at key, if any
    func bool(_ key: Key) -> Bool? {
        return self[key] as? Bool
    }
    
    /// Returns a string from a dictionary
    /// - Parameter key: The dictionary key ( AnyHashable )
    /// - Returns: the dictionary value stored at key, if any
    func dict(_ key: Key) -> Dictionary? {
        return self[key] as? Dictionary
    }
    
    /// Returns a string from a dictionary
    /// - Parameter key: The dictionary key ( AnyHashable )
    /// - Returns: the array value stored at key, if any
    func array<T>(_ key: Key) -> Array<T>? {
        return self[key] as? Array<T>
    }
    
    #if !os(watchOS)

    /// Returns a string from a dictionary
    /// - Parameter key: The dictionary key ( AnyHashable )
    /// - Returns: the CGFloat value stored at key, if any
    func cgFloat(_ key: Key) -> CGFloat? {
        return self[key] as? CGFloat
    }
    
    #endif
    
}
