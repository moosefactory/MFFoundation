//   /\/\__/\/\      MFFoundation
//   \/\/..\/\/      Swift Framework - v2.0
//      (oo)
//  MooseFactory     ©2007-2025 - Moose
//    Software
//  ------------------------------------------
//  􀈿 EmojiFont.swift
//  􀐚 MFFoundation
//  􀓣 Created by Tristan Leblanc on 04/02/2025.

#if os(macOS)
import Cocoa
#else
import UIKit
#endif

// MARK: - SFSymbols utils

public protocol EmojiFontProtocol {
    static var lowercase: String { get }
    static var uppercase: String { get }
    static var digits: String { get }
}


public struct EmojiFont {
    internal init(lowercase: String, uppercase: String, digits: String) {
        self.lowercase = lowercase
        self.uppercase = uppercase
        self.digits = digits
    }
    
    let lowercase: String
    let uppercase: String
    let digits: String
    
    public static let sansSerif = EmojiFont(lowercase: "𝗮𝗯𝗰𝗱𝗲𝗳𝗴𝗵𝗶𝗷𝗸𝗹𝗺𝗻𝗼𝗽𝗾𝗿𝘀𝘁𝘂𝘃𝘄𝘅𝘆𝘇",
                                            uppercase: "𝗔𝗕𝗖𝗗𝗘𝗙𝗚𝗛𝗜𝗝𝗞𝗟𝗠𝗡𝗢𝗣𝗤𝗥𝗦𝗧𝗨𝗩𝗪𝗫𝗬𝗭",
                                            digits: "𝟬𝟭𝟮𝟯𝟰𝟱𝟲𝟳𝟴𝟵")
}

public extension String {
    
    /// As symbols
    ///
    /// Returns a string by replacing letters and digits by sfSymbols
    /// We use the SFSymbol tables defined above to generate the string
    /// Example:
    ///
    static let ex1 = "Hello World !"
    static let ex2 = "123,48"
    
    func asEmojiFont(emojiFont: EmojiFont) -> String {
        var out = String()
        
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
                    table = EmojiFont.sansSerif.uppercase
                }
                else if ascii >= a && ascii <= z {
                    ascii -= a
                    table = EmojiFont.sansSerif.lowercase
                }
                else if ascii >= _0 && ascii <= _9 {
                    ascii -= _0
                    table = EmojiFont.sansSerif.digits
                }
                
                if let table = table {
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
