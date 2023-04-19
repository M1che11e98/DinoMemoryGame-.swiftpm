//
//  File.swift
//  
//
//  Created by Marta Michelle Caliendo on 15/04/23.
//

import Foundation
import CoreText

public struct FontStyle {
    public static func registerFonts() {
        registerFont(bundle: Bundle.main , fontName: "DinosaurAlt-YzvB4", fontExtension: ".ttf")
        registerFont(bundle: Bundle.main, fontName: "RonysiswadiArchitect1-3zjeL", fontExtension: ".ttf")
    }
    fileprivate static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
        
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from data")
        }
        
        var error: Unmanaged<CFError>?
        
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
}
