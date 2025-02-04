//   /\/\__/\/\      MFFoundation
//   \/\/..\/\/      Swift Framework - v2.0
//      (oo)
//  MooseFactory     ©2007-2025 - Moose
//    Software
//  ------------------------------------------
//  􀈿 SFSymbols.swift
//  􀐚 MFFoundation
//  􀓣 Created by Tristan Leblanc on 04/02/2025.

#if os(macOS)
import Cocoa
#else
import UIKit
#endif

// MARK: - SFSymbols utils

public extension String {
    
    /// We use these tables to return string containing SFSymbols
    ///
    /// If you know another way to make string without useing literals in source
    /// Tell me. :)
    fileprivate struct SFSymbol {
        
        /// All letters SFSymbols.
        /// To access a letter at given index, use the '(index * 4) + face' formula to get the right character
        static let letters = "􀀄􀀅􀂔􀂕􀀆􀀇􀂖􀂗􀀈􀀉􀂘􀂙􀀊􀀋􀂚􀂛􀀌􀀍􀂜􀂝􀀎􀀏􀂞􀂟􀀐􀀑􀂠􀂡􀀒􀀓􀂢􀂣􀀔􀀕􀂤􀂥􀀖􀀗􀂦􀂧􀀘􀀙􀂨􀂩􀀚􀀛􀂪􀂫􀀜􀀝􀂬􀂭􀀞􀀟􀂮􀂯􀀠􀀡􀂰􀂱􀀢􀀣􀂲􀂳􀀤􀀥􀂴􀂵􀀦􀀧􀂶􀂷􀀨􀀩􀂸􀂹􀀪􀀫􀂺􀂻􀀬􀀭􀂼􀂽􀀮􀀯􀂾􀂿􀀰􀀱􀃀􀃁􀀲􀀳􀃂􀃃􀀴􀀵􀃄􀃅􀀶􀀷􀃆􀃇"
        static let digits = "􀀸􀀹􀃈􀃉􀀺􀀻􀃊􀃋􀀼􀀽􀃌􀃍􀀾􀀿􀃎􀃏􀁀􀁁􀃐􀃑􀘗􀘘􀘙􀘚􀁂􀁃􀃒􀃓􀁄􀁅􀃔􀃕􀑱􀑲􀑵􀑶􀁆􀁇􀃖􀃗􀁈􀁉􀃘􀃙􀁊􀁋􀃚􀃛􀑳􀑴􀑷􀑸"
        
    }
    
    /// As symbols
    ///
    /// Returns an attributed string from string by replacing letters and digits by sfSymbols
    func asSymbols(filled: Bool = true, circle: Bool = false) -> NSAttributedString {
        var symbolNames = [String]()
        self.forEach { char in
            let shape = circle ? "circle" : "square"
            let fill = filled ? ".fill" : ""
            symbolNames.append("\(char).\(shape)\(fill)")
        }
        
        let out = NSMutableAttributedString(string: "")
        for sn in symbolNames {
            let imageAttachment = NSTextAttachment()
            let image = NSImage(systemSymbolName: sn, accessibilityDescription: sn)
            imageAttachment.image = image
            var imgString = NSAttributedString(attachment: imageAttachment)
            var imgColorString = NSAttributedString(attributedString: imgString, color: PlatformColor.textColor)
            out.append(imgColorString)
        }
        return out
    }
    
    /// As symbols
    ///
    /// Returns a string by replacing letters and digits by sfSymbols
    /// We use the SFSymbol tables defined above to generate the string
    func asSymbols(filled: Bool = true, circle: Bool = false) -> String {
        var out = String()
        
        var indexOffset: UInt8 = circle ? 0 : 2
        if filled { indexOffset += 1 }
        
        self.forEach { char in
            
            if var ascii = char.asciiValue {
                let _0 = Character("0").asciiValue ?? 65
                let _9 = Character("9").asciiValue ?? 65
                let A = Character("A").asciiValue ?? 65
                let a = Character("a").asciiValue ?? 65
                let Z = Character("Z").asciiValue ?? 65 + 26
                let z = Character("z").asciiValue ?? 65 + 26
                
                var table: String?
                
                if ascii >= A && ascii <= Z {
                    ascii -= A
                    table = SFSymbol.letters
                }
                else if ascii >= a && ascii <= z {
                    ascii -= a
                    table = SFSymbol.letters
                }
                else if ascii >= _0 && ascii <= _9 {
                    ascii -= _0
                    table = SFSymbol.digits
                }
                
                if let table = table {
                    ascii = (ascii) * 4 + indexOffset
                    let index = String.Index(utf16Offset: Int(ascii) * 2, in: table)
                    let index2 = table.index(index, offsetBy: 1)
                    let range: Range<Index> = index..<index2
                    out.append(contentsOf: table[range])
                } else {
                    out.append(String(char))
                }
            } else {
                out.append(String(char))
            }
        }
        return out
    }
}
