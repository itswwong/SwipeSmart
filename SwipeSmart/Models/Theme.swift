//
//  Theme.swift
//
//  Custom color set for credit card background.
//

import SwiftUI

enum Theme: String, CaseIterable, Identifiable, Codable, ShapeStyle {
    case pastelreddark
    case pastelscarlet
    case pastelred
    case pastelorange
    case pastelyellow
    case pastelgold
    case pastelgreenlight
    case pastelgreen
    case pastelbabyblue
    case pastelblue
    case pastelbluedark
    case pastelindigo
    case pastelpurple
    case pastelpurpledark
    case pasteltan
    case pastelbrown
    
    var mainColor: Color {
        Color(rawValue)
    }
    var id: String {
        rawValue
    }
}

