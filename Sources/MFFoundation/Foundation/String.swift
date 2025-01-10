//   /\/\__/\/\      MFFoundation
//   \/\/..\/\/      Swift Framework - v2.0
//      (oo)
//  MooseFactory     ©2007-2025 - Moose
//    Software
//  ------------------------------------------
//  String.swift
//  Created by Tristan Leblanc on 20/11/2020.

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
    
    /// Removes space characters in string
    var byRemovingSpaces: String {
        replacingOccurrences(of: " ", with: "")
    }
    
    /// Removes tab characters in string
    var byRemovingTabs: String {
        replacingOccurrences(of: "\t", with: "")
    }
    
    /// Removes all non digit or comma characters and replace "," by "."
    
    var asRawDecimalNumberString: String {
        return filteringCharacters(in: CharacterSet(charactersIn: "0123456789.,")).replacingOccurrences(of: ",", with: ".")
    }

    /// Removes all non digit characters
    
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




