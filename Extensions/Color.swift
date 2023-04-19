//
//  File.swift
//
//
//  Created by Marta Michelle Caliendo on 16/04/23.
//

import SwiftUI

extension Color {
    static let theme = ColorTheme()
    
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

struct ColorTheme {
    let backgroundColorAzure = Color(hex: 0xB0DAFF)
    let backgroundColorBlue = Color(hex: 0xDAF5FF)
    let backgroundColorGold = Color(hex: 0xD4AC2B)
    let backgroundColorNightBlue = Color(hex: 0x153E90)
    let backgroundColorPurple = Color(hex: 0xBFACE2)
    let backgroundColorPurple2 = Color(hex: 0x917FB3)
    let strokeColor = Color(hex: 0x285430)
    let backgroundColorGreen = Color(hex: 0xBEF0CB)
    let rowColorGreen = Color(hex: 0x87CBB9)
    let rowColorGreen2 = Color(hex: 0x678B8D)
}

