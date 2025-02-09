//   /\/\__/\/\      MFFoundation
//   \/\/..\/\/      Swift Framework - v2.0
//      (oo)
//  MooseFactory     ©2007-2025 - Moose
//    Software
//  ------------------------------------------
//  􀈿 DateFormatter.swift
//  􀐚 MFFoundation
//  􀓣 Created by Tristan Leblanc on 10/01/2025.

import Foundation

extension DateFormatter {
    
    /// Convenience initialiser
    /// - Parameter format: The date format string
    convenience init(format: String) {
        self.init()
        dateFormat = format
        timeZone = .current
        locale = .current
    }

    // MARK: - Static date formatters for technical usage ( us, no space )
    
    /// HH:mm
    public static var time = DateFormatter(format: "HH:mm")
    /// yyyy/MM/dd
    public static var slash = DateFormatter(format: "yyyy/MM/dd")
    /// yyyy-MM-dd
    public static var dash = DateFormatter(format: "yyyy-MM-dd")
    /// yyyyMMdd
    public static var compact = DateFormatter(format: "yyyyMMdd")
    /// yyyy-MM-dd_HH-mm
    public static var sortable = DateFormatter(format: " yyyy-MM-dd_HH-mm")
}
