//   /\/\__/\/\      MFFoundation
//   \/\/..\/\/      Swift Framework - v2.0
//      (oo)
//  MooseFactory     ©2007-2025 - Moose
//    Software
//  ------------------------------------------
//  􀈿 SystemUtils.swift
//  􀐚 MFFoundation
//  􀓣 Created by Tristan Leblanc on 28/09/2020.

import Foundation
#if os(macOS)
import Cocoa
import IOKit
#else
import UIKit
#endif

public struct Device {
#if os(iOS)
    public static var isIpad: Bool { UIDevice.isIpad }
#else
    public static var isIpad: Bool { false }
#endif
    
#if os(iOS)
    public static var isLandscape: Bool { UIDevice.isLandscape }
#else
    public static var isLandscape: Bool { false }
#endif

}

#if os(iOS)
public extension Device {
    
    static var isPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
    
    
}
#endif


#if os(macOS)

public extension Device {
    static var deviceSerialNumber: String
    {
        var machport: mach_port_t = kIOMasterPortDefault
        if #available(macOS 12.0, *) {
            machport = kIOMainPortDefault
        }
        let ioService = IOServiceGetMatchingService(machport, IOServiceMatching("IOPlatformExpertDevice"))

        let cfSerialNumber = IORegistryEntryCreateCFProperty(ioService, kIOPlatformSerialNumberKey as CFString, kCFAllocatorDefault, 0)
        IOObjectRelease(ioService)
        return cfSerialNumber?.takeUnretainedValue() as? String ?? ""
    }
}

public extension NSScreen {
    
    static var isPhone: Bool { false }
    
    /// Returns device screen resolution, or 72dpi default
    static var screenRes: CGFloat = {
        let r = NSScreen.main?.deviceDescription[NSDeviceDescriptionKey.resolution] as? CGFloat
        return CGFloat(r ?? 72)
    }()
}

#endif

#if os(iOS)

public extension UIDevice {
    
    /// Returns the device string
    static var deviceString: String? {
        var systemInfo = utsname()
        uname(&systemInfo)
        return withUnsafePointer(to: &systemInfo.machine) {
            $0.withMemoryRebound(to: CChar.self, capacity: 1) { pointer in
                String(validatingUTF8: pointer)
            }
        }
    }
    
    static var isIpad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static var isLandscape: Bool {
        if UIDevice.current.orientation == .landscapeLeft || UIDevice.current.orientation == .landscapeRight {
            return true
        } else if UIScreen.main.orientation == .landscapeLeft || UIScreen.main.orientation == .landscapeRight {
            return true
        }
        return false
    }
    
    var isInDarkMode: Bool {
        if #available(iOS 13.0, *) {
            return UIScreen.main.traitCollection.userInterfaceStyle == .dark
        } else if #available(macOS 12.0, *) {
            return false
        } else if #available(tvOS 11.0, *) {
            return false
        } else if #available(watchOS 6.0, *) {
            return false
        } else {
            return false
        }
    }
}

#endif
