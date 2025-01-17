//   /\/\__/\/\      MFFoundation
//   \/\/..\/\/      Swift Framework - v2.0
//      (oo)
//  MooseFactory     ©2007-2025 - Moose
//    Software
//  ------------------------------------------
//  􀈿 Cocoa+Extras.swift
//  􀐚 MFFoundation
//  􀓣 Created by Tristan Leblanc on 19/11/2020.

import Foundation

#if os(macOS)

import Cocoa


// MARK: - Image utilities

extension NSImage {

    // To match the UIImage version
    
    convenience init(cgImage: CGImage) {
        self.init(cgImage: cgImage, size: cgImage.size)
    }
}

// MARK: - View utilities

/// Operations on all subviews

public extension NSView {
    
    func hideAllSubviews() {
        subviews.forEach { $0.isHidden = true }
    }
    
    func showAllSubviews() {
        subviews.forEach { $0.isHidden = false }
    }
    
    func removeAllSubviews() {
        subviews.forEach { $0.removeFromSuperview() }
    }
}


public extension NSView {

    /// Snapshot of the view

    func snapshotImage() -> NSImage {
        let imageRepresentation = bitmapImageRepForCachingDisplay(in: bounds)!
        cacheDisplay(in: bounds, to: imageRepresentation)
        return NSImage(cgImage: imageRepresentation.cgImage!, size: bounds.size)
    }

    /// Quick width constraint

    var width: CGFloat {
        set {
            addConstraint(NSLayoutConstraint(item: self, attribute: .width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200))
        }
        get {
            self.frame.size.width
        }
    }
}

// MARK: - Stack view utilities

public extension NSStackView {
    
    func removeAllArrangedSubviews() {
        let views = arrangedSubviews
        views.forEach {
            self.removeArrangedSubview($0)
        }
    }
}

// MARK: - Controls utilities

public extension NSSlider {
    var percentValue: Float {
        return Float(floatValue) / Float(maxValue)
    }
}

public extension NSSwitch {
    convenience init(target: AnyObject?, action: Selector?) {
        self.init()
        self.action = action
        self.target = target
    }
}

public extension NSControl {
    var on: Bool {
        if self is NSButton {
            return (self as! NSButton).state == .on
        }
        if self is NSSwitch {
            return (self as! NSSwitch).state == .on
        }
        return false
    }
}

/// Bool to on/off constrol state
public extension Bool {
    var onOff: NSControl.StateValue { return self ? .on : .off }
}

#endif
