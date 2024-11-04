//
//  ExtendedWidget.swift
//  ExtendedWidget
//
//  Created by Tyler Xiao on 10/21/24.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), emoji: "😀")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), emoji: "😀")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, emoji: "😀")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }

//    func relevances() async -> WidgetRelevances<Void> {
//        // Generate a list containing the contexts this widget is relevant in.
//    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let emoji: String
}

struct ExtendedWidgetEntryView : View {
    var entry: Provider.Entry
    let card: CreditCard

    var body: some View {
        VStack {
            //Text("Time:")
            //Text(entry.date, style: .time)

            //Text("Emoji:")
            //Text(entry.emoji)
            
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading){
                        Text(card.bankName)
                            .font(.title3.weight(.bold))
                            .padding(.bottom, 5)
                        Text(card.cardName)
                            .multilineTextAlignment(.trailing)
                        Spacer()
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text((card.cardType == "Discover" || card.cardType == "American Express") ? "" : card.cardType)
                            .font(.title3.weight(.bold))
                        Spacer()
                    }
                    .padding(.trailing, -25)
                }
                RoundedRectangle(cornerRadius:7)
                    .frame(width: 30, height: 20)
                    .padding(.bottom, 5)
                    .foregroundStyle(Color("pastelgraylight"))
                HStack {
                    if card.digits.isEmpty {
                        Text("**** **** **** ****")
                    }
                    else {
                        Text("**** **** **** \(card.digits)")
                    }
                }
            }
            .padding()
        }
    }
}

struct ExtendedWidget: Widget {
    let kind: String = "ExtendedWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                ExtendedWidgetEntryView(entry: entry, card: CreditCard.sampleCards[0])
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                ExtendedWidgetEntryView(entry: entry,card:  CreditCard.sampleCards[0])
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        //.supportedFamilies([.systemMedium])
    }
}

#Preview(as: .systemSmall) {
    ExtendedWidget()
} timeline: {
    SimpleEntry(date: .now, emoji: "😀")
    SimpleEntry(date: .now, emoji: "🤩")
}
