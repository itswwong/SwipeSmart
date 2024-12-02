//
//  WidgetProvider.swift
//  SwipeSmart
//
//  Created by Tyler Xiao on 11/4/24.
//
import WidgetKit
import SwiftUI
import Foundation
struct WidgetProvider: TimelineProvider {
    let isOne : Bool
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), isOne: isOne)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), isOne: isOne)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        //var entries: [SimpleEntry] = []

        // Update the widget every 15 minutes
        let currentDate = Date()
        let nextUpdateDate = Calendar.current.date(byAdding: .minute, value: 15, to: currentDate)!

        
        let entry = SimpleEntry(date: currentDate, isOne: isOne)

        let timeline = Timeline(entries: [entry], policy: .after(nextUpdateDate))
        completion(timeline)
    }
}
