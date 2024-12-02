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

}

// MARK: - Image Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ImageResource {

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

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

    /// The "AccentColor" asset catalog color.
    static var accent: SwiftUI.Color { .init(.accent) }

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

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    /// The "AccentColor" asset catalog color.
    static var accent: SwiftUI.Color { .init(.accent) }

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

}
#endif

// MARK: - Image Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

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

