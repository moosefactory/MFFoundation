//   /\/\__/\/\      MFFoundation
//   \/\/..\/\/      Swift Framework - v2.0
//      (oo)
//  MooseFactory     ©2007-2025 - Moose
//    Software
//  ------------------------------------------
//  􀈿 NSPopUpButton+Extras.swift
//  􀐚 MFFoundation
//  􀓣 Created by Tristan Leblanc on 21/02/2026.

#if os(macOS)

import AppKit

// NSPopUpButton extension

public extension NSPopUpButton {
    
    /// Adds an item with given title and tag
    func addItem(title: String, tag: Int) {
        let item = NSMenuItem(title: title, action: nil, keyEquivalent: "")
        item.tag = tag
        menu?.addItem(item)
    }
    
    /// Returns the first item with the given tag
    func item(with tag: Int) -> NSMenuItem? {
        menu?.item(withTag: tag)
    }
    
    /// Return the first item with given identifier
    func item(with identifier: String) -> NSMenuItem? {
        menu?.items.first { $0.identifier?.rawValue == identifier }
    }

    /// Returns true if menu item is on
    func isItemOn(with tag: Int) -> Bool {
        item(with: tag)?.state == .on
    }
    
    /// Switch the Item control state
    func switchItem(with tag: Int) {
        guard let item = item(with: tag) else { return }
        item.state = item.state.switched
    }
    
    /// Switch the Item control state
    func switchItem(with identifier: String) {
        guard let item = item(with: identifier) else { return }
        item.state = item.state.switched
    }

    /// Returns on items
    func onItems() -> [NSMenuItem]{
        menu?.items.filter {
            $0.state == .on
        } ?? []
    }
    /// Returns on items identifiers
    func onItemIdentifiers() -> [String]{
        let out = menu?.items.filter {
            $0.state == .on
        } ?? []
        return out.compactMap { $0.identifier?.rawValue }
    }

    /// Turns all items off
    func setAllItemsOff() {
        menu?.items.forEach {
            $0.state = .off
        }
    }
    
    /// Turns all items on
    func setAllItemsOn() {
        menu?.items.forEach {
            $0.state = .on
        }
    }
    
    /// Select the first item with given identifier
    func selectItem(identifier: String) {
        guard let index = menu?.items.firstIndex(where: {
            $0.identifier?.rawValue == identifier
        }) else {
            return
        }
        selectItem(at: index)
    }
    
    /// Select the items with given identifiers
    func selectItems(identifiers: [String]) {
        menu?.items.forEach {
            guard let identifier = $0.identifier?.rawValue else {
                $0.state = .off
                return
            }
            $0.state = identifiers.contains(identifier) ? .on : .off
        }
    }
}

public extension NSMenu {
    
    /// Select the first item with given identifier
    func selectItem(with tag: Int) {
        items.forEach {
            $0.state = tag == $0.tag ? .on : .off
        }
    }
}

#endif
