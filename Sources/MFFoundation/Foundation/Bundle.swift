//
//  Bundle.swift
//  MFFoundation
//
//  Created by Tristan Leblanc on 12/01/2025.
//

import Foundation

public extension Bundle {
    
    static var shortVersion: String {
        Bundle.main.infoDictionary?.string("CFBundleShortVersionString") ?? "Bundle Version Not Found"
    }
    
    static var buildVersion: String {
        Bundle.main.infoDictionary?.string("CFBundleVersionString") ?? "Bundle Version Not Found"
    }
}
