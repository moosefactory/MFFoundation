//   /\/\__/\/\      MFFoundation
//   \/\/..\/\/      Swift Framework - v2.0
//      (oo)
//  MooseFactory     ©2007-2025 - Moose
//    Software
//  ------------------------------------------
//  􀈿 Random.swift
//  􀐚 MFFoundation
//  􀓣 Created by Tristan Leblanc on 12/01/2025.

import Foundation
#if os(macOS)
import Cocoa
#else
import UIKit
#endif

extension NSAttributedString {
    
    /// Init an attributed string from string with `.foregroundColor` attribute
    /// - Parameters:
    ///   - string: The string to convert
    ///   - color: The expected color
    convenience init(string: String, color: PlatformColor) {
        self.init(string: string, attributes: [.foregroundColor: color])
    }
    
    /// Init an attributed string with `.foregroundColor` attribute
    /// - Parameters:
    ///   - attributedString: The attributed string to colorize
    ///   - color: The expected color
    convenience init(attributedString: NSAttributedString, color: PlatformColor) {
        let mutable = NSMutableAttributedString(attributedString: attributedString)
        mutable.addAttributes([.foregroundColor: color], range: attributedString.range)
        self.init(attributedString: mutable)
    }
    
    var isEmpty: Bool { length == 0 }
    
    var isNotEmpty: Bool { length > 0 }
    
    /// convenient NSRange getter
    
    var range: NSRange {
        NSRange(location: 0, length: length)
    }
        
    var localized: NSAttributedString {
        let string = self.string
        return NSAttributedString(string: Bundle.main.localizedString(forKey: string, value: string, table: nil))
    }
    
    var utf8Length: Int { string.utf8Length }
    
    var utf16Length: Int { string.utf16Length }
}

