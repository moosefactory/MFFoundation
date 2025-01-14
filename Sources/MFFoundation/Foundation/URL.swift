//   /\/\__/\/\      MFFoundation
//   \/\/..\/\/      Swift Framework - v2.0
//      (oo)
//  MooseFactory
//    Software       ©2007-2025 - Moose
//  ------------------------------------------
//  􀈿 URL.swift
//  􀐚 MFFoundation
//  􀓣 Created by Tristan Leblanc on 12/01/2021.

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

public extension URL {
    
    /// Returns the url parameters as a dictionary
    var parameters: [String: String] {
        guard
            let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
            let queryItems = components.queryItems else {
            return [:]
        }
        
        return queryItems.reduce(into: [String: String]()) { result, item in
            result[item.name] = item.value
        }
    }
}
