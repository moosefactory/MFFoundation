//   /\/\__/\/\      MFFoundation
//   \/\/..\/\/      Swift Framework - v2.0
//      (oo)
//  MooseFactory     ©2007-2025 - Moose
//    Software
//  ------------------------------------------
//  􀈿 String.swift
//  􀐚 MFFoundation
//  􀓣 Created by Tristan Leblanc on 20/11/2020.

import Foundation

//MARK: - String

public extension String {
            
    /// Returns a NSString version
    var ns: NSString {
        return NSString(string: self)
    }
    
    /// Returns string encoded in utf8
    var utf8: Data {
        self.data(using: .utf8) ?? Data()
    }
    
    // The string array length
    var utf8Length: Int {
        count
    }
    
    /// The length in number of utf16 characters
    var utf16Length: Int {
        utf16.count
    }

    /// Removes space characters in string
    var byRemovingSpaces: String {
        replacingOccurrences(of: " ", with: "")
    }
    
    /// Removes tab characters in string
    var byRemovingTabs: String {
        replacingOccurrences(of: "\t", with: "")
    }

/// Removes all non digit characters
    var asRawDecimalNumberString: String {
        return filteringCharacters(in: CharacterSet(charactersIn: "0123456789.,")).replacingOccurrences(of: ",", with: ".")
    }

    var asRawIntegerNumberString: String {
        return filteringCharacters(in: CharacterSet(charactersIn: "0123456789"))
    }

    /// Removes characters if they match a character in the given CharacterSet
    
    func filteringCharacters(in set: CharacterSet) -> String {
        guard !isEmpty else { return self }
        return String(unicodeScalars.filter { set.contains($0) })
    }
    
    /// Returns default localisation by using itself as a localisation key
    /// in default localization table ( localizable.string )
    
    var localized: String {
        return localized()
    }
    
    /// Returns default localisation by using itself as a localisation key
    /// in given bundle and localization table

    func localized(in bundle: Bundle? = nil, table: String? = nil) -> String {
        return (bundle ?? Bundle.main).localizedString(forKey: self, value: self, table: table)
    }
}

// MARK: - Variables matching

public extension String {

    /// Replaces variables in a string
    ///
    /// - parameters variablesDictionary
    /// A dictionary of variable/string pairs.
    ///
    /// - returns the new string, with replaced {$}
    ///
    /// Variables placeholders are defined in the string using {$variable} syntax.
    ///
    /// ```
    /// let dict = ["name": "Doe", "forename": "John"]
    /// let greetings = "Hello {$forename} {$name}!"
    /// print(greetings.byReplacingVariables(with dict)
    ///
    /// Output:
    /// Hello John Doe!
    /// ```
    
    func byReplacingVariables(with variablesDictionary: [String: String]) -> String {
        var out = self
        variablesDictionary.forEach { key, value in
            out = out.replacingOccurrences(of: "{$\(key)}", with: value)
        }
        return out
    }

    /// Returns string with first character trimmed
    var byRemovingFirstCharacter: String {
        guard count > 1 else { return "" }
        return String(suffix(count-1))
    }
}


// MARK: - CSV Utilities

public extension String {
    
    var csvComponents: [String] {
        split(separator: ";").map { String($0) }
    }
    
    var tsvComponents: [String] {
        split(separator: "\t").map { String($0) }
    }
    
    var lines: [String] {
        split(separator: "\r").map { String($0) }
    }
}

public extension Array where Element == String {
    
    var asCSV: String {
        return joinedByComma
    }
    
    var asTSV: String {
        return joinedByTab
    }

    var joinedByComma: String {
        return joined(separator: ";")
    }
    
    var joinedBySpace: String {
        return joined(separator: " ")
    }
    
    var joinedByDot: String {
        return joined(separator: ".")
    }
    
    var joinedByDash: String {
        return joined(separator: "-")
    }
    
    var joinedByUnderscore: String {
        return joined(separator: "_")
    }
    
    var joinedByReturn: String {
        return joined(separator: "\r")
    }
    
    var joinedByTab: String {
        return joined(separator: "\t")
    }
    
    var joinedBySlash: String {
        return joined(separator: "/")
    }
}
