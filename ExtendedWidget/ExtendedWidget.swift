//
//  ExtendedWidget.swift
//  ExtendedWidget
//
//  Created by Tyler Xiao on 10/21/24.
//

import WidgetKit
import SwiftUI
import Foundation
@main
struct ExtendedWidget: WidgetBundle {
    let defaults = UserDefaults.standard
    @StateObject private var storeCards = CardStore()
    @StateObject private var storeCategories = CategoryStore()
    @State private var errorWrapper: ErrorWrapper?
    @WidgetBundleBuilder
    var body: some Widget {
        //defaults.set("CurrCard", forKey: CreditCard.sampleCards[0])
        WidgetInfo()
        WidgetInfo2()

    }
    
}
struct WidgetInfo : Widget {

    let kind: String = "ExtendedWidget"
    var card: CreditCard = CreditCard.sampleCards[0]

    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: WidgetProvider(isOne: true)) { entry in ExtendedWidgetEntryView(entry: entry, card: card).containerBackground(.fill.tertiary, for: .widget)

        }
        .configurationDisplayName("Swipe Smart Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemMedium])
    }
}
struct WidgetInfo2 : Widget {
    
    let kind: String = "ExtendedWidget2"
    var card: CreditCard = CreditCard.sampleCards[1]

    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: WidgetProvider(isOne:false)) { entry in ExtendedWidgetEntryView(entry: entry, card: card).containerBackground(.fill.tertiary, for: .widget)

        }
        .configurationDisplayName("Swipe Smart Widget 2")
        .description("This is an example widget.")
        .supportedFamilies([.systemMedium])
    }
}
/*
#Preview(as: .systemMedium) {
    ExtendedWidget()
} timeline: {
    SimpleEntry(date: .now)
}*/
