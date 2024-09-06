//
//  Theme.swift
//
//  Custom color set for credit card background.
//

import SwiftUI

enum Theme: String, CaseIterable, Identifiable, Codable {
    case pastelreddark
    case pastelred
    case pastelorange
    case pastelyellow
    case pastelgreenlight
    case pastelgreen
    case pastelblue
    case pastelbluedark
    case pastelpurple
    case pastelbrown
    
    var mainColor: Color {
        Color(rawValue)
    }
    
    var id: String {
        rawValue
    }
}
