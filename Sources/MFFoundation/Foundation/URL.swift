//   /\/\__/\/\      MFFoundation
//   \/\/..\/\/      Swift Framework - v2.0
//      (oo)
//  MooseFactory     ©2007-2025 - Moose
//    Software
//  ------------------------------------------
//  URL.swift
//  Created by Tristan Leblanc on 12/01/2021.

import Foundation

public extension URL {
    
    /// Returns the URL as a NSURL
    
    var ns: NSURL {
        return NSURL(fileURLWithPath: self.path)
    }
}

public extension NSURL {
    
    /// Returns the NSURL as a URL

    var url: URL? {
        guard let string = self.absoluteString else { return nil }
        return URL(string: string)
    }
}
