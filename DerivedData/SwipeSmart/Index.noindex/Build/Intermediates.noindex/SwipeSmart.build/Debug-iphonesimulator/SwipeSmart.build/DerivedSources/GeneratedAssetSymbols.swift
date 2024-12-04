import Foundation
#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ColorResource {

    /// The "AccentColor" asset catalog color resource.
    static let accent = DeveloperToolsSupport.ColorResource(name: "AccentColor", bundle: resourceBundle)

    /// The "black_accent" asset catalog color resource.
    static let blackAccent = DeveloperToolsSupport.ColorResource(name: "black_accent", bundle: resourceBundle)

    /// The "black_new" asset catalog color resource.
    static let blackNew = DeveloperToolsSupport.ColorResource(name: "black_new", bundle: resourceBundle)

    /// The "blue_accent" asset catalog color resource.
    static let blueAccent = DeveloperToolsSupport.ColorResource(name: "blue_accent", bundle: resourceBundle)

    /// The "blue_new" asset catalog color resource.
    static let blueNew = DeveloperToolsSupport.ColorResource(name: "blue_new", bundle: resourceBundle)

    /// The "blueblack_accent" asset catalog color resource.
    static let blueblackAccent = DeveloperToolsSupport.ColorResource(name: "blueblack_accent", bundle: resourceBundle)

    /// The "blueblack_new" asset catalog color resource.
    static let blueblackNew = DeveloperToolsSupport.ColorResource(name: "blueblack_new", bundle: resourceBundle)

    /// The "bluegray_accent" asset catalog color resource.
    static let bluegrayAccent = DeveloperToolsSupport.ColorResource(name: "bluegray_accent", bundle: resourceBundle)

    /// The "bluegray_new" asset catalog color resource.
    static let bluegrayNew = DeveloperToolsSupport.ColorResource(name: "bluegray_new", bundle: resourceBundle)

    /// The "brown_accent" asset catalog color resource.
    static let brownAccent = DeveloperToolsSupport.ColorResource(name: "brown_accent", bundle: resourceBundle)

    /// The "brown_new" asset catalog color resource.
    static let brownNew = DeveloperToolsSupport.ColorResource(name: "brown_new", bundle: resourceBundle)

    /// The "copper_accent" asset catalog color resource.
    static let copperAccent = DeveloperToolsSupport.ColorResource(name: "copper_accent", bundle: resourceBundle)

    /// The "copper_new" asset catalog color resource.
    static let copperNew = DeveloperToolsSupport.ColorResource(name: "copper_new", bundle: resourceBundle)

    /// The "gray_accent" asset catalog color resource.
    static let grayAccent = DeveloperToolsSupport.ColorResource(name: "gray_accent", bundle: resourceBundle)

    /// The "gray_new" asset catalog color resource.
    static let grayNew = DeveloperToolsSupport.ColorResource(name: "gray_new", bundle: resourceBundle)

    /// The "green_accent" asset catalog color resource.
    static let greenAccent = DeveloperToolsSupport.ColorResource(name: "green_accent", bundle: resourceBundle)

    /// The "green_new" asset catalog color resource.
    static let greenNew = DeveloperToolsSupport.ColorResource(name: "green_new", bundle: resourceBundle)

    /// The "orange_accent" asset catalog color resource.
    static let orangeAccent = DeveloperToolsSupport.ColorResource(name: "orange_accent", bundle: resourceBundle)

    /// The "orange_new" asset catalog color resource.
    static let orangeNew = DeveloperToolsSupport.ColorResource(name: "orange_new", bundle: resourceBundle)

    /// The "pastelbabyblue" asset catalog color resource.
    static let pastelbabyblue = DeveloperToolsSupport.ColorResource(name: "pastelbabyblue", bundle: resourceBundle)

    /// The "pastelblue" asset catalog color resource.
    static let pastelblue = DeveloperToolsSupport.ColorResource(name: "pastelblue", bundle: resourceBundle)

    /// The "pastelbluedark" asset catalog color resource.
    static let pastelbluedark = DeveloperToolsSupport.ColorResource(name: "pastelbluedark", bundle: resourceBundle)

    /// The "pastelbrown" asset catalog color resource.
    static let pastelbrown = DeveloperToolsSupport.ColorResource(name: "pastelbrown", bundle: resourceBundle)

    /// The "pastelgold" asset catalog color resource.
    static let pastelgold = DeveloperToolsSupport.ColorResource(name: "pastelgold", bundle: resourceBundle)

    /// The "pastelgray" asset catalog color resource.
    static let pastelgray = DeveloperToolsSupport.ColorResource(name: "pastelgray", bundle: resourceBundle)

    /// The "pastelgraydark" asset catalog color resource.
    static let pastelgraydark = DeveloperToolsSupport.ColorResource(name: "pastelgraydark", bundle: resourceBundle)

    /// The "pastelgraydarkest" asset catalog color resource.
    static let pastelgraydarkest = DeveloperToolsSupport.ColorResource(name: "pastelgraydarkest", bundle: resourceBundle)

    /// The "pastelgraylight" asset catalog color resource.
    static let pastelgraylight = DeveloperToolsSupport.ColorResource(name: "pastelgraylight", bundle: resourceBundle)

    /// The "pastelgreen" asset catalog color resource.
    static let pastelgreen = DeveloperToolsSupport.ColorResource(name: "pastelgreen", bundle: resourceBundle)

    /// The "pastelgreenlight" asset catalog color resource.
    static let pastelgreenlight = DeveloperToolsSupport.ColorResource(name: "pastelgreenlight", bundle: resourceBundle)

    /// The "pastelindigo" asset catalog color resource.
    static let pastelindigo = DeveloperToolsSupport.ColorResource(name: "pastelindigo", bundle: resourceBundle)

    /// The "pastelorange" asset catalog color resource.
    static let pastelorange = DeveloperToolsSupport.ColorResource(name: "pastelorange", bundle: resourceBundle)

    /// The "pastelpurple" asset catalog color resource.
    static let pastelpurple = DeveloperToolsSupport.ColorResource(name: "pastelpurple", bundle: resourceBundle)

    /// The "pastelpurpledark" asset catalog color resource.
    static let pastelpurpledark = DeveloperToolsSupport.ColorResource(name: "pastelpurpledark", bundle: resourceBundle)

    /// The "pastelred" asset catalog color resource.
    static let pastelred = DeveloperToolsSupport.ColorResource(name: "pastelred", bundle: resourceBundle)

    /// The "pastelreddark" asset catalog color resource.
    static let pastelreddark = DeveloperToolsSupport.ColorResource(name: "pastelreddark", bundle: resourceBundle)

    /// The "pastelscarlet" asset catalog color resource.
    static let pastelscarlet = DeveloperToolsSupport.ColorResource(name: "pastelscarlet", bundle: resourceBundle)

    /// The "pasteltan" asset catalog color resource.
    static let pasteltan = DeveloperToolsSupport.ColorResource(name: "pasteltan", bundle: resourceBundle)

    /// The "pastelyellow" asset catalog color resource.
    static let pastelyellow = DeveloperToolsSupport.ColorResource(name: "pastelyellow", bundle: resourceBundle)

    /// The "pink_accent" asset catalog color resource.
    static let pinkAccent = DeveloperToolsSupport.ColorResource(name: "pink_accent", bundle: resourceBundle)

    /// The "pink_new" asset catalog color resource.
    static let pinkNew = DeveloperToolsSupport.ColorResource(name: "pink_new", bundle: resourceBundle)

    /// The "purple_accent" asset catalog color resource.
    static let purpleAccent = DeveloperToolsSupport.ColorResource(name: "purple_accent", bundle: resourceBundle)

    /// The "purple_new" asset catalog color resource.
    static let purpleNew = DeveloperToolsSupport.ColorResource(name: "purple_new", bundle: resourceBundle)

    /// The "red_accent" asset catalog color resource.
    static let redAccent = DeveloperToolsSupport.ColorResource(name: "red_accent", bundle: resourceBundle)

    /// The "red_new" asset catalog color resource.
    static let redNew = DeveloperToolsSupport.ColorResource(name: "red_new", bundle: resourceBundle)

    /// The "teal_accent" asset catalog color resource.
    static let tealAccent = DeveloperToolsSupport.ColorResource(name: "teal_accent", bundle: resourceBundle)

    /// The "teal_new" asset catalog color resource.
    static let tealNew = DeveloperToolsSupport.ColorResource(name: "teal_new", bundle: resourceBundle)

    /// The "yellow_accent" asset catalog color resource.
    static let yellowAccent = DeveloperToolsSupport.ColorResource(name: "yellow_accent", bundle: resourceBundle)

    /// The "yellow_new" asset catalog color resource.
    static let yellowNew = DeveloperToolsSupport.ColorResource(name: "yellow_new", bundle: resourceBundle)

}

// MARK: - Image Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ImageResource {

    /// The "amex" asset catalog image resource.
    static let amex = DeveloperToolsSupport.ImageResource(name: "amex", bundle: resourceBundle)

    /// The "discover" asset catalog image resource.
    static let discover = DeveloperToolsSupport.ImageResource(name: "discover", bundle: resourceBundle)

    /// The "mastercard" asset catalog image resource.
    static let mastercard = DeveloperToolsSupport.ImageResource(name: "mastercard", bundle: resourceBundle)

    /// The "visa" asset catalog image resource.
    static let visa = DeveloperToolsSupport.ImageResource(name: "visa", bundle: resourceBundle)

}

// MARK: - Color Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    /// The "AccentColor" asset catalog color.
    static var accent: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .accent)
#else
        .init()
#endif
    }

    /// The "black_accent" asset catalog color.
    static var blackAccent: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .blackAccent)
#else
        .init()
#endif
    }

    /// The "black_new" asset catalog color.
    static var blackNew: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .blackNew)
#else
        .init()
#endif
    }

    /// The "blue_accent" asset catalog color.
    static var blueAccent: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .blueAccent)
#else
        .init()
#endif
    }

    /// The "blue_new" asset catalog color.
    static var blueNew: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .blueNew)
#else
        .init()
#endif
    }

    /// The "blueblack_accent" asset catalog color.
    static var blueblackAccent: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .blueblackAccent)
#else
        .init()
#endif
    }

    /// The "blueblack_new" asset catalog color.
    static var blueblackNew: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .blueblackNew)
#else
        .init()
#endif
    }

    /// The "bluegray_accent" asset catalog color.
    static var bluegrayAccent: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .bluegrayAccent)
#else
        .init()
#endif
    }

    /// The "bluegray_new" asset catalog color.
    static var bluegrayNew: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .bluegrayNew)
#else
        .init()
#endif
    }

    /// The "brown_accent" asset catalog color.
    static var brownAccent: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .brownAccent)
#else
        .init()
#endif
    }

    /// The "brown_new" asset catalog color.
    static var brownNew: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .brownNew)
#else
        .init()
#endif
    }

    /// The "copper_accent" asset catalog color.
    static var copperAccent: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .copperAccent)
#else
        .init()
#endif
    }

    /// The "copper_new" asset catalog color.
    static var copperNew: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .copperNew)
#else
        .init()
#endif
    }

    /// The "gray_accent" asset catalog color.
    static var grayAccent: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .grayAccent)
#else
        .init()
#endif
    }

    /// The "gray_new" asset catalog color.
    static var grayNew: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .grayNew)
#else
        .init()
#endif
    }

    /// The "green_accent" asset catalog color.
    static var greenAccent: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .greenAccent)
#else
        .init()
#endif
    }

    /// The "green_new" asset catalog color.
    static var greenNew: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .greenNew)
#else
        .init()
#endif
    }

    /// The "orange_accent" asset catalog color.
    static var orangeAccent: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .orangeAccent)
#else
        .init()
#endif
    }

    /// The "orange_new" asset catalog color.
    static var orangeNew: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .orangeNew)
#else
        .init()
#endif
    }

    /// The "pastelbabyblue" asset catalog color.
    static var pastelbabyblue: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pastelbabyblue)
#else
        .init()
#endif
    }

    /// The "pastelblue" asset catalog color.
    static var pastelblue: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pastelblue)
#else
        .init()
#endif
    }

    /// The "pastelbluedark" asset catalog color.
    static var pastelbluedark: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pastelbluedark)
#else
        .init()
#endif
    }

    /// The "pastelbrown" asset catalog color.
    static var pastelbrown: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pastelbrown)
#else
        .init()
#endif
    }

    /// The "pastelgold" asset catalog color.
    static var pastelgold: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pastelgold)
#else
        .init()
#endif
    }

    /// The "pastelgray" asset catalog color.
    static var pastelgray: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pastelgray)
#else
        .init()
#endif
    }

    /// The "pastelgraydark" asset catalog color.
    static var pastelgraydark: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pastelgraydark)
#else
        .init()
#endif
    }

    /// The "pastelgraydarkest" asset catalog color.
    static var pastelgraydarkest: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pastelgraydarkest)
#else
        .init()
#endif
    }

    /// The "pastelgraylight" asset catalog color.
    static var pastelgraylight: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pastelgraylight)
#else
        .init()
#endif
    }

    /// The "pastelgreen" asset catalog color.
    static var pastelgreen: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pastelgreen)
#else
        .init()
#endif
    }

    /// The "pastelgreenlight" asset catalog color.
    static var pastelgreenlight: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pastelgreenlight)
#else
        .init()
#endif
    }

    /// The "pastelindigo" asset catalog color.
    static var pastelindigo: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pastelindigo)
#else
        .init()
#endif
    }

    /// The "pastelorange" asset catalog color.
    static var pastelorange: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pastelorange)
#else
        .init()
#endif
    }

    /// The "pastelpurple" asset catalog color.
    static var pastelpurple: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pastelpurple)
#else
        .init()
#endif
    }

    /// The "pastelpurpledark" asset catalog color.
    static var pastelpurpledark: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pastelpurpledark)
#else
        .init()
#endif
    }

    /// The "pastelred" asset catalog color.
    static var pastelred: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pastelred)
#else
        .init()
#endif
    }

    /// The "pastelreddark" asset catalog color.
    static var pastelreddark: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pastelreddark)
#else
        .init()
#endif
    }

    /// The "pastelscarlet" asset catalog color.
    static var pastelscarlet: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pastelscarlet)
#else
        .init()
#endif
    }

    /// The "pasteltan" asset catalog color.
    static var pasteltan: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pasteltan)
#else
        .init()
#endif
    }

    /// The "pastelyellow" asset catalog color.
    static var pastelyellow: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pastelyellow)
#else
        .init()
#endif
    }

    /// The "pink_accent" asset catalog color.
    static var pinkAccent: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pinkAccent)
#else
        .init()
#endif
    }

    /// The "pink_new" asset catalog color.
    static var pinkNew: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .pinkNew)
#else
        .init()
#endif
    }

    /// The "purple_accent" asset catalog color.
    static var purpleAccent: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .purpleAccent)
#else
        .init()
#endif
    }

    /// The "purple_new" asset catalog color.
    static var purpleNew: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .purpleNew)
#else
        .init()
#endif
    }

    /// The "red_accent" asset catalog color.
    static var redAccent: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .redAccent)
#else
        .init()
#endif
    }

    /// The "red_new" asset catalog color.
    static var redNew: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .redNew)
#else
        .init()
#endif
    }

    /// The "teal_accent" asset catalog color.
    static var tealAccent: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .tealAccent)
#else
        .init()
#endif
    }

    /// The "teal_new" asset catalog color.
    static var tealNew: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .tealNew)
#else
        .init()
#endif
    }

    /// The "yellow_accent" asset catalog color.
    static var yellowAccent: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .yellowAccent)
#else
        .init()
#endif
    }

    /// The "yellow_new" asset catalog color.
    static var yellowNew: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .yellowNew)
#else
        .init()
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    /// The "AccentColor" asset catalog color.
    static var accent: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .accent)
#else
        .init()
#endif
    }

    /// The "black_accent" asset catalog color.
    static var blackAccent: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .blackAccent)
#else
        .init()
#endif
    }

    /// The "black_new" asset catalog color.
    static var blackNew: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .blackNew)
#else
        .init()
#endif
    }

    /// The "blue_accent" asset catalog color.
    static var blueAccent: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .blueAccent)
#else
        .init()
#endif
    }

    /// The "blue_new" asset catalog color.
    static var blueNew: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .blueNew)
#else
        .init()
#endif
    }

    /// The "blueblack_accent" asset catalog color.
    static var blueblackAccent: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .blueblackAccent)
#else
        .init()
#endif
    }

    /// The "blueblack_new" asset catalog color.
    static var blueblackNew: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .blueblackNew)
#else
        .init()
#endif
    }

    /// The "bluegray_accent" asset catalog color.
    static var bluegrayAccent: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .bluegrayAccent)
#else
        .init()
#endif
    }

    /// The "bluegray_new" asset catalog color.
    static var bluegrayNew: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .bluegrayNew)
#else
        .init()
#endif
    }

    /// The "brown_accent" asset catalog color.
    static var brownAccent: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .brownAccent)
#else
        .init()
#endif
    }

    /// The "brown_new" asset catalog color.
    static var brownNew: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .brownNew)
#else
        .init()
#endif
    }

    /// The "copper_accent" asset catalog color.
    static var copperAccent: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .copperAccent)
#else
        .init()
#endif
    }

    /// The "copper_new" asset catalog color.
    static var copperNew: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .copperNew)
#else
        .init()
#endif
    }

    /// The "gray_accent" asset catalog color.
    static var grayAccent: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .grayAccent)
#else
        .init()
#endif
    }

    /// The "gray_new" asset catalog color.
    static var grayNew: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .grayNew)
#else
        .init()
#endif
    }

    /// The "green_accent" asset catalog color.
    static var greenAccent: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .greenAccent)
#else
        .init()
#endif
    }

    /// The "green_new" asset catalog color.
    static var greenNew: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .greenNew)
#else
        .init()
#endif
    }

    /// The "orange_accent" asset catalog color.
    static var orangeAccent: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .orangeAccent)
#else
        .init()
#endif
    }

    /// The "orange_new" asset catalog color.
    static var orangeNew: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .orangeNew)
#else
        .init()
#endif
    }

    /// The "pastelbabyblue" asset catalog color.
    static var pastelbabyblue: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .pastelbabyblue)
#else
        .init()
#endif
    }

    /// The "pastelblue" asset catalog color.
    static var pastelblue: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .pastelblue)
#else
        .init()
#endif
    }

    /// The "pastelbluedark" asset catalog color.
    static var pastelbluedark: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .pastelbluedark)
#else
        .init()
#endif
    }

    /// The "pastelbrown" asset catalog color.
    static var pastelbrown: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .pastelbrown)
#else
        .init()
#endif
    }

    /// The "pastelgold" asset catalog color.
    static var pastelgold: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .pastelgold)
#else
        .init()
#endif
    }

    /// The "pastelgray" asset catalog color.
    static var pastelgray: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .pastelgray)
#else
        .init()
#endif
    }

    /// The "pastelgraydark" asset catalog color.
    static var pastelgraydark: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .pastelgraydark)
#else
        .init()
#endif
    }

    /// The "pastelgraydarkest" asset catalog color.
    static var pastelgraydarkest: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .pastelgraydarkest)
#else
        .init()
#endif
    }

    /// The "pastelgraylight" asset catalog color.
    static var pastelgraylight: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .pastelgraylight)
#else
        .init()
#endif
    }

    /// The "pastelgreen" asset catalog color.
    static var pastelgreen: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .pastelgreen)
#else
        .init()
#endif
    }

    /// The "pastelgreenlight" asset catalog color.
    static var pastelgreenlight: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .pastelgreenlight)
#else
        .init()
#endif
    }

    /// The "pastelindigo" asset catalog color.
    static var pastelindigo: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .pastelindigo)
#else
        .init()
#endif
    }

    /// The "pastelorange" asset catalog color.
    static var pastelorange: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .pastelorange)
#else
        .init()
#endif
    }

    /// The "pastelpurple" asset catalog color.
    static var pastelpurple: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .pastelpurple)
#else
        .init()
#endif
    }

    /// The "pastelpurpledark" asset catalog color.
    static var pastelpurpledark: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .pastelpurpledark)
#else
        .init()
#endif
    }

    /// The "pastelred" asset catalog color.
    static var pastelred: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .pastelred)
#else
        .init()
#endif
    }

    /// The "pastelreddark" asset catalog color.
    static var pastelreddark: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .pastelreddark)
#else
        .init()
#endif
    }

    /// The "pastelscarlet" asset catalog color.
    static var pastelscarlet: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .pastelscarlet)
#else
        .init()
#endif
    }

    /// The "pasteltan" asset catalog color.
    static var pasteltan: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .pasteltan)
#else
        .init()
#endif
    }

    /// The "pastelyellow" asset catalog color.
    static var pastelyellow: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .pastelyellow)
#else
        .init()
#endif
    }

    /// The "pink_accent" asset catalog color.
    static var pinkAccent: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .pinkAccent)
#else
        .init()
#endif
    }

    /// The "pink_new" asset catalog color.
    static var pinkNew: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .pinkNew)
#else
        .init()
#endif
    }

    /// The "purple_accent" asset catalog color.
    static var purpleAccent: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .purpleAccent)
#else
        .init()
#endif
    }

    /// The "purple_new" asset catalog color.
    static var purpleNew: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .purpleNew)
#else
        .init()
#endif
    }

    /// The "red_accent" asset catalog color.
    static var redAccent: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .redAccent)
#else
        .init()
#endif
    }

    /// The "red_new" asset catalog color.
    static var redNew: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .redNew)
#else
        .init()
#endif
    }

    /// The "teal_accent" asset catalog color.
    static var tealAccent: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .tealAccent)
#else
        .init()
#endif
    }

    /// The "teal_new" asset catalog color.
    static var tealNew: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .tealNew)
#else
        .init()
#endif
    }

    /// The "yellow_accent" asset catalog color.
    static var yellowAccent: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .yellowAccent)
#else
        .init()
#endif
    }

    /// The "yellow_new" asset catalog color.
    static var yellowNew: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .yellowNew)
#else
        .init()
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

    /// The "AccentColor" asset catalog color.
    static var accent: SwiftUI.Color { .init(.accent) }

    /// The "black_accent" asset catalog color.
    static var blackAccent: SwiftUI.Color { .init(.blackAccent) }

    /// The "black_new" asset catalog color.
    static var blackNew: SwiftUI.Color { .init(.blackNew) }

    /// The "blue_accent" asset catalog color.
    static var blueAccent: SwiftUI.Color { .init(.blueAccent) }

    /// The "blue_new" asset catalog color.
    static var blueNew: SwiftUI.Color { .init(.blueNew) }

    /// The "blueblack_accent" asset catalog color.
    static var blueblackAccent: SwiftUI.Color { .init(.blueblackAccent) }

    /// The "blueblack_new" asset catalog color.
    static var blueblackNew: SwiftUI.Color { .init(.blueblackNew) }

    /// The "bluegray_accent" asset catalog color.
    static var bluegrayAccent: SwiftUI.Color { .init(.bluegrayAccent) }

    /// The "bluegray_new" asset catalog color.
    static var bluegrayNew: SwiftUI.Color { .init(.bluegrayNew) }

    /// The "brown_accent" asset catalog color.
    static var brownAccent: SwiftUI.Color { .init(.brownAccent) }

    /// The "brown_new" asset catalog color.
    static var brownNew: SwiftUI.Color { .init(.brownNew) }

    /// The "copper_accent" asset catalog color.
    static var copperAccent: SwiftUI.Color { .init(.copperAccent) }

    /// The "copper_new" asset catalog color.
    static var copperNew: SwiftUI.Color { .init(.copperNew) }

    /// The "gray_accent" asset catalog color.
    static var grayAccent: SwiftUI.Color { .init(.grayAccent) }

    /// The "gray_new" asset catalog color.
    static var grayNew: SwiftUI.Color { .init(.grayNew) }

    /// The "green_accent" asset catalog color.
    static var greenAccent: SwiftUI.Color { .init(.greenAccent) }

    /// The "green_new" asset catalog color.
    static var greenNew: SwiftUI.Color { .init(.greenNew) }

    /// The "orange_accent" asset catalog color.
    static var orangeAccent: SwiftUI.Color { .init(.orangeAccent) }

    /// The "orange_new" asset catalog color.
    static var orangeNew: SwiftUI.Color { .init(.orangeNew) }

    /// The "pastelbabyblue" asset catalog color.
    static var pastelbabyblue: SwiftUI.Color { .init(.pastelbabyblue) }

    /// The "pastelblue" asset catalog color.
    static var pastelblue: SwiftUI.Color { .init(.pastelblue) }

    /// The "pastelbluedark" asset catalog color.
    static var pastelbluedark: SwiftUI.Color { .init(.pastelbluedark) }

    /// The "pastelbrown" asset catalog color.
    static var pastelbrown: SwiftUI.Color { .init(.pastelbrown) }

    /// The "pastelgold" asset catalog color.
    static var pastelgold: SwiftUI.Color { .init(.pastelgold) }

    /// The "pastelgray" asset catalog color.
    static var pastelgray: SwiftUI.Color { .init(.pastelgray) }

    /// The "pastelgraydark" asset catalog color.
    static var pastelgraydark: SwiftUI.Color { .init(.pastelgraydark) }

    /// The "pastelgraydarkest" asset catalog color.
    static var pastelgraydarkest: SwiftUI.Color { .init(.pastelgraydarkest) }

    /// The "pastelgraylight" asset catalog color.
    static var pastelgraylight: SwiftUI.Color { .init(.pastelgraylight) }

    /// The "pastelgreen" asset catalog color.
    static var pastelgreen: SwiftUI.Color { .init(.pastelgreen) }

    /// The "pastelgreenlight" asset catalog color.
    static var pastelgreenlight: SwiftUI.Color { .init(.pastelgreenlight) }

    /// The "pastelindigo" asset catalog color.
    static var pastelindigo: SwiftUI.Color { .init(.pastelindigo) }

    /// The "pastelorange" asset catalog color.
    static var pastelorange: SwiftUI.Color { .init(.pastelorange) }

    /// The "pastelpurple" asset catalog color.
    static var pastelpurple: SwiftUI.Color { .init(.pastelpurple) }

    /// The "pastelpurpledark" asset catalog color.
    static var pastelpurpledark: SwiftUI.Color { .init(.pastelpurpledark) }

    /// The "pastelred" asset catalog color.
    static var pastelred: SwiftUI.Color { .init(.pastelred) }

    /// The "pastelreddark" asset catalog color.
    static var pastelreddark: SwiftUI.Color { .init(.pastelreddark) }

    /// The "pastelscarlet" asset catalog color.
    static var pastelscarlet: SwiftUI.Color { .init(.pastelscarlet) }

    /// The "pasteltan" asset catalog color.
    static var pasteltan: SwiftUI.Color { .init(.pasteltan) }

    /// The "pastelyellow" asset catalog color.
    static var pastelyellow: SwiftUI.Color { .init(.pastelyellow) }

    /// The "pink_accent" asset catalog color.
    static var pinkAccent: SwiftUI.Color { .init(.pinkAccent) }

    /// The "pink_new" asset catalog color.
    static var pinkNew: SwiftUI.Color { .init(.pinkNew) }

    /// The "purple_accent" asset catalog color.
    static var purpleAccent: SwiftUI.Color { .init(.purpleAccent) }

    /// The "purple_new" asset catalog color.
    static var purpleNew: SwiftUI.Color { .init(.purpleNew) }

    /// The "red_accent" asset catalog color.
    static var redAccent: SwiftUI.Color { .init(.redAccent) }

    /// The "red_new" asset catalog color.
    static var redNew: SwiftUI.Color { .init(.redNew) }

    /// The "teal_accent" asset catalog color.
    static var tealAccent: SwiftUI.Color { .init(.tealAccent) }

    /// The "teal_new" asset catalog color.
    static var tealNew: SwiftUI.Color { .init(.tealNew) }

    /// The "yellow_accent" asset catalog color.
    static var yellowAccent: SwiftUI.Color { .init(.yellowAccent) }

    /// The "yellow_new" asset catalog color.
    static var yellowNew: SwiftUI.Color { .init(.yellowNew) }

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    /// The "AccentColor" asset catalog color.
    static var accent: SwiftUI.Color { .init(.accent) }

    /// The "black_accent" asset catalog color.
    static var blackAccent: SwiftUI.Color { .init(.blackAccent) }

    /// The "black_new" asset catalog color.
    static var blackNew: SwiftUI.Color { .init(.blackNew) }

    /// The "blue_accent" asset catalog color.
    static var blueAccent: SwiftUI.Color { .init(.blueAccent) }

    /// The "blue_new" asset catalog color.
    static var blueNew: SwiftUI.Color { .init(.blueNew) }

    /// The "blueblack_accent" asset catalog color.
    static var blueblackAccent: SwiftUI.Color { .init(.blueblackAccent) }

    /// The "blueblack_new" asset catalog color.
    static var blueblackNew: SwiftUI.Color { .init(.blueblackNew) }

    /// The "bluegray_accent" asset catalog color.
    static var bluegrayAccent: SwiftUI.Color { .init(.bluegrayAccent) }

    /// The "bluegray_new" asset catalog color.
    static var bluegrayNew: SwiftUI.Color { .init(.bluegrayNew) }

    /// The "brown_accent" asset catalog color.
    static var brownAccent: SwiftUI.Color { .init(.brownAccent) }

    /// The "brown_new" asset catalog color.
    static var brownNew: SwiftUI.Color { .init(.brownNew) }

    /// The "copper_accent" asset catalog color.
    static var copperAccent: SwiftUI.Color { .init(.copperAccent) }

    /// The "copper_new" asset catalog color.
    static var copperNew: SwiftUI.Color { .init(.copperNew) }

    /// The "gray_accent" asset catalog color.
    static var grayAccent: SwiftUI.Color { .init(.grayAccent) }

    /// The "gray_new" asset catalog color.
    static var grayNew: SwiftUI.Color { .init(.grayNew) }

    /// The "green_accent" asset catalog color.
    static var greenAccent: SwiftUI.Color { .init(.greenAccent) }

    /// The "green_new" asset catalog color.
    static var greenNew: SwiftUI.Color { .init(.greenNew) }

    /// The "orange_accent" asset catalog color.
    static var orangeAccent: SwiftUI.Color { .init(.orangeAccent) }

    /// The "orange_new" asset catalog color.
    static var orangeNew: SwiftUI.Color { .init(.orangeNew) }

    /// The "pastelbabyblue" asset catalog color.
    static var pastelbabyblue: SwiftUI.Color { .init(.pastelbabyblue) }

    /// The "pastelblue" asset catalog color.
    static var pastelblue: SwiftUI.Color { .init(.pastelblue) }

    /// The "pastelbluedark" asset catalog color.
    static var pastelbluedark: SwiftUI.Color { .init(.pastelbluedark) }

    /// The "pastelbrown" asset catalog color.
    static var pastelbrown: SwiftUI.Color { .init(.pastelbrown) }

    /// The "pastelgold" asset catalog color.
    static var pastelgold: SwiftUI.Color { .init(.pastelgold) }

    /// The "pastelgray" asset catalog color.
    static var pastelgray: SwiftUI.Color { .init(.pastelgray) }

    /// The "pastelgraydark" asset catalog color.
    static var pastelgraydark: SwiftUI.Color { .init(.pastelgraydark) }

    /// The "pastelgraydarkest" asset catalog color.
    static var pastelgraydarkest: SwiftUI.Color { .init(.pastelgraydarkest) }

    /// The "pastelgraylight" asset catalog color.
    static var pastelgraylight: SwiftUI.Color { .init(.pastelgraylight) }

    /// The "pastelgreen" asset catalog color.
    static var pastelgreen: SwiftUI.Color { .init(.pastelgreen) }

    /// The "pastelgreenlight" asset catalog color.
    static var pastelgreenlight: SwiftUI.Color { .init(.pastelgreenlight) }

    /// The "pastelindigo" asset catalog color.
    static var pastelindigo: SwiftUI.Color { .init(.pastelindigo) }

    /// The "pastelorange" asset catalog color.
    static var pastelorange: SwiftUI.Color { .init(.pastelorange) }

    /// The "pastelpurple" asset catalog color.
    static var pastelpurple: SwiftUI.Color { .init(.pastelpurple) }

    /// The "pastelpurpledark" asset catalog color.
    static var pastelpurpledark: SwiftUI.Color { .init(.pastelpurpledark) }

    /// The "pastelred" asset catalog color.
    static var pastelred: SwiftUI.Color { .init(.pastelred) }

    /// The "pastelreddark" asset catalog color.
    static var pastelreddark: SwiftUI.Color { .init(.pastelreddark) }

    /// The "pastelscarlet" asset catalog color.
    static var pastelscarlet: SwiftUI.Color { .init(.pastelscarlet) }

    /// The "pasteltan" asset catalog color.
    static var pasteltan: SwiftUI.Color { .init(.pasteltan) }

    /// The "pastelyellow" asset catalog color.
    static var pastelyellow: SwiftUI.Color { .init(.pastelyellow) }

    /// The "pink_accent" asset catalog color.
    static var pinkAccent: SwiftUI.Color { .init(.pinkAccent) }

    /// The "pink_new" asset catalog color.
    static var pinkNew: SwiftUI.Color { .init(.pinkNew) }

    /// The "purple_accent" asset catalog color.
    static var purpleAccent: SwiftUI.Color { .init(.purpleAccent) }

    /// The "purple_new" asset catalog color.
    static var purpleNew: SwiftUI.Color { .init(.purpleNew) }

    /// The "red_accent" asset catalog color.
    static var redAccent: SwiftUI.Color { .init(.redAccent) }

    /// The "red_new" asset catalog color.
    static var redNew: SwiftUI.Color { .init(.redNew) }

    /// The "teal_accent" asset catalog color.
    static var tealAccent: SwiftUI.Color { .init(.tealAccent) }

    /// The "teal_new" asset catalog color.
    static var tealNew: SwiftUI.Color { .init(.tealNew) }

    /// The "yellow_accent" asset catalog color.
    static var yellowAccent: SwiftUI.Color { .init(.yellowAccent) }

    /// The "yellow_new" asset catalog color.
    static var yellowNew: SwiftUI.Color { .init(.yellowNew) }

}
#endif

// MARK: - Image Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    /// The "amex" asset catalog image.
    static var amex: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .amex)
#else
        .init()
#endif
    }

    /// The "discover" asset catalog image.
    static var discover: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .discover)
#else
        .init()
#endif
    }

    /// The "mastercard" asset catalog image.
    static var mastercard: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .mastercard)
#else
        .init()
#endif
    }

    /// The "visa" asset catalog image.
    static var visa: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .visa)
#else
        .init()
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    /// The "amex" asset catalog image.
    static var amex: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .amex)
#else
        .init()
#endif
    }

    /// The "discover" asset catalog image.
    static var discover: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .discover)
#else
        .init()
#endif
    }

    /// The "mastercard" asset catalog image.
    static var mastercard: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .mastercard)
#else
        .init()
#endif
    }

    /// The "visa" asset catalog image.
    static var visa: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .visa)
#else
        .init()
#endif
    }

}
#endif

// MARK: - Thinnable Asset Support -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ColorResource {

    private init?(thinnableName: Swift.String, bundle: Foundation.Bundle) {
#if canImport(AppKit) && os(macOS)
        if AppKit.NSColor(named: NSColor.Name(thinnableName), bundle: bundle) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIColor(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
#if !targetEnvironment(macCatalyst)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}
#endif

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ImageResource {

    private init?(thinnableName: Swift.String, bundle: Foundation.Bundle) {
#if canImport(AppKit) && os(macOS)
        if bundle.image(forResource: NSImage.Name(thinnableName)) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIImage(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ImageResource?) {
#if !targetEnvironment(macCatalyst)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ImageResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

