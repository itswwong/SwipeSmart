//
//  Theme.swift
//
//  Custom color set for credit card background.
//

import SwiftUI

enum Theme: String, CaseIterable, Identifiable, Codable, ShapeStyle {
    case red_new
    case orange_new
    case yellow_new
    case green_new
    case blue_new
    case teal_new
    case purple_new
    case pink_new
    case gray_new
    case bluegray_new
    case brown_new
    case black_new
    case blueblack_new
    case copper_new
    
    var accentColor: Color {
        switch self {
        case .red_new:
            return Color("red_accent")
        case .orange_new:
            return Color("orange_accent")
        case .yellow_new:
            return Color("yellow_accent")
        case .green_new:
            return Color("green_accent")
        case .blue_new:
            return Color("blue_accent")
        case .teal_new:
            return Color("teal_accent")
        case .purple_new:
            return Color("purple_accent")
        case .pink_new:
            return Color("pink_accent")
        case .gray_new:
            return Color("gray_accent")
        case .bluegray_new:
            return Color("bluegray_accent")
        case .brown_new:
            return Color("brown_accent")
        case .black_new:
            return Color("black_accent")
        case .blueblack_new:
            return Color("blueblack_accent")
        case .copper_new:
            return Color("copper_accent")
        }
    }
    
    var mainColor: Color {
        Color(rawValue)
    }
    var id: String {
        rawValue
    }
}

extension Color {
    static var defaultAdaptiveColor: Color {
        return Color(UIColor { traitCollection in
            traitCollection.userInterfaceStyle == .dark ? UIColor.white : UIColor.black
        })
    }
}
