//   /\/\__/\/\      MFFoundation
//   \/\/..\/\/      Swift Framework - v2.0
//      (oo)
//  MooseFactory     ©2007-2025 - Moose
//    Software
//  ------------------------------------------
//  􀈿 ActionPopupButton.swift
//  􀐚 MFFoundation
//  􀓣 Created by Tristan Leblanc on 04/05/2026.

#if os(macOS)

import AppKit

public class ActionPopupButton: NSPopUpButton {
    public var itemSelected: ((NSPopUpButton)->Void)!
    
    public init(frame: NSRect,
                pullsDown: Bool,
                action: @escaping ((NSPopUpButton)->Void)) {
        self.itemSelected = action
        super.init(frame: frame, pullsDown: pullsDown)
        self.action = #selector(selectedItemDidChange)
        self.target = self
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBAction func selectedItemDidChange(sender: ActionPopupButton) {
        itemSelected?(self)
    }
}

#endif

