//
//  MFLogger.swift
//  Seq-One
//
//  Created by Tristan Leblanc on 12/02/2021.
//  Copyright © 2021 Moose Factory Software. All rights reserved.
//

import Foundation

open class MFLogger {
    var domain: String
    var enabled: Bool
    
    public static var shared = MFLogger(domain: "APP", enabled: true)
    
    public init(domain: String, enabled: Bool) {
        self.domain = domain
        self.enabled = enabled
    }
    
    public static func print(_ string: String) {
        shared.print(string)
    }
    
    public func print(_ string: String) {
        guard enabled else { return }
        let prefix = "[\(domain)]".padding(toLength: 16, withPad: " ", startingAt: 0)
        let lines = string.split(separator: "\r")
        var t = ""
        lines.forEach {
            Swift.print("\(prefix) : \(t)\($0)")
            t = "   "
        }
    }
    
}
