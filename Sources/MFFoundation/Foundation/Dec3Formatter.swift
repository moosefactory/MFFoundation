//   /\/\__/\/\      MFFoundation
//   \/\/..\/\/      Swift Framework - v2.0
//      (oo)
//  MooseFactory     ©2007-2025 - Moose
//    Software
//  ------------------------------------------
//  Dec3Formatter.swift
//  Created by Tristan Leblanc on 09/10/2020.

#if !os(watchOS)

import Foundation
import QuartzCore

public extension CGPoint {
    
    /// Returns commma separated point coordinates with 3 decimals precision
    
    var dec3: String {
        "(\(x.dec3);\(y.dec3))"
    }
    
    var intString: String {
        "(\(Int(x));\(Int(y))"
    }
}

public extension CGRect {
    
    /// Returns commma separated point coordinates with 3 decimals precision
    
    var dec3: String {
        "(\(minX.dec3);\(minY.dec3);\(maxX.dec3);\(maxY.dec3))"
    }
}

public extension CGSize {
    
    /// Returns commma separated point coordinates with 3 decimals precision

    var dec3: String {
        "(\(width.dec3);\(height.dec3))"
    }
}

//MARK: - 3 Decimals formatter - Usefull for logging

public extension CGFloat {

    /// Returns commma separated point coordinates with 3 decimals precision

    var dec3: String { Double(self).dec3 }
}

public extension Double {
    
    /// Static 3 decimals formatter
    
    static let formatter3Dec: NumberFormatter = {
        let f = NumberFormatter()
        f.minimumFractionDigits = 3
        f.maximumFractionDigits = 3
        f.decimalSeparator = "."
        return f
    }()
    
    /// Returns value formatted with 3 decimals precision

    var dec3: String {
        let n = NSNumber(value: Double(self))
        return Double.formatter3Dec.string(from: n) ?? "\(self)"
    }
}

#endif
