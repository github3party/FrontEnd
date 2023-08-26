//
//  ColorExtnsion.swift
//  HackerTon0825
//
//  Created by 최준영 on 2023/08/25.
//

import SwiftUI


// MARK: - Color
extension ShapeStyle where Self == Color {
    
    static var mainBlue: Color { hexToColor(hex: "#46B2FF") }
    static var mainBlack: Color { hexToColor(hex: "#282830") }
    static var grey01: Color { hexToColor(hex: "#53575B") }
    static var grey03: Color { hexToColor(hex: "#B3B4B8") }
    static var grey04: Color { hexToColor(hex: "#EDEDED") }
    static var darkBlue: Color { hexToColor(hex: "#080809") }
    static var skyBlue: Color { hexToColor(hex: "#BFE4FF") }
    
    
    private static func hexToColor(hex: String) -> Color! {
        var cleanedHex = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if cleanedHex.hasPrefix("#") {
            cleanedHex.remove(at: cleanedHex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: cleanedHex).scanHexInt64(&rgbValue)

        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0

        return Color(UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0))
    }
}


// MARK: - Font
extension Font {
    enum CustomWeight {
        case bold, semiBold, regular, medium
    }

    static func pretendard(_ size: CGFloat, weight: CustomWeight) -> Font {
        switch weight {
        case .regular:
            return .custom("Pretendard-Regular", size: size)
        case .medium:
            return .custom("Pretendard-Medium", size: size)
        case .semiBold:
            return .custom("Pretendard-SemiBold", size: size)
        case .bold:
            return .custom("Pretendard-Bold", size: size)
        }
    }
}



