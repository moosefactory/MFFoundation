//
//  NSPopUpButton+Extras.swift
//  OPO Model Migrator
//
//  Created by Tristan Leblanc on 21/02/2026.
//

import AppKit

// NSPopUpButton extension
public extension NSPopUpButton {
    
    /// Adds an item with given title and tag
    public func addItem(title: String, tag: Int) {
        let item = NSMenuItem(title: title, action: nil, keyEquivalent: "")
        item.tag = tag
        menu?.addItem(item)
    }
    
    /// Returns the first item with the given tag
    public func item(with tag: Int) -> NSMenuItem? {
        menu?.item(withTag: tag)
    }
    
    /// Return the first item with given identifier
    public func item(with identifier: String) -> NSMenuItem? {
        menu?.items.first { $0.identifier?.rawValue == identifier }
    }

    /// Returns true if menu item is on
    public func isItemOn(with tag: Int) -> Bool {
        item(with: tag)?.state == .on
    }
    
    /// Switch the Item control state
    public func switchItem(with tag: Int) {
        guard let item = item(with: tag) else { return }
        item.state = item.state.switched
    }
    
    /// Switch the Item control state
    public func switchItem(with identifier: String) {
        guard let item = item(with: identifier) else { return }
        item.state = item.state.switched
    }

    /// Returns on items
    public func onItems() -> [NSMenuItem]{
        menu?.items.filter {
            $0.state == .on
        } ?? []
    }
    /// Returns on items identifiers
    public func onItemIdentifiers() -> [String]{
        let out = menu?.items.filter {
            $0.state == .on
        } ?? []
        return out.compactMap { $0.identifier?.rawValue }
    }

    /// Turns all items off
    public func setAllItemsOff() {
        menu?.items.forEach {
            $0.state = .off
        }
    }
    
    /// Turns all items on
    public func setAllItemsOn() {
        menu?.items.forEach {
            $0.state = .on
        }
    }
    
    /// Select the first item with given identifier
    public func selectItem(identifier: String) {
        guard let index = menu?.items.firstIndex(where: {
            $0.identifier?.rawValue == identifier
        }) else {
            return
        }
        selectItem(at: index)
    }
    
    /// Select the items with given identifiers
    public func selectItems(identifiers: [String]) {
        menu?.items.forEach {
            guard let identifier = $0.identifier?.rawValue else {
                $0.state = .off
                return
            }
            $0.state = identifiers.contains(identifier) ? .on : .off
        }
    }
}

extension NSMenu {
    public func selectItem(with tag: Int) {
        items.forEach {
            $0.state = tag == $0.tag ? .on : .off
        }

    }
}
