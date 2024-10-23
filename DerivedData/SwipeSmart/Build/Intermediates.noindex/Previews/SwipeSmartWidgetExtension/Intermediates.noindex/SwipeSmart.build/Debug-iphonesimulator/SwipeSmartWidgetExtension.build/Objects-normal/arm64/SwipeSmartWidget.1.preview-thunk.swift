@_private(sourceFile: "SwipeSmartWidget.swift") import SwipeSmartWidgetExtension
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import WidgetKit
import SwiftUI

extension SwipeSmartWidgetEntryView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/lindsayqin/Desktop/Workspace/swipe-smart/SwipeSmart/SwipeSmartWidget/SwipeSmartWidget.swift", line: 46)
        VStack {
            Text(__designTimeString("#3662.[4].[1].property.[0].[0].arg[0].value.[0].arg[0].value", fallback: "Time:"))
            Text(entry.date, style: .time)

            Text(__designTimeString("#3662.[4].[1].property.[0].[0].arg[0].value.[2].arg[0].value", fallback: "Emoji:"))
            Text(entry.emoji)
        }
    
#sourceLocation()
    }
}

extension Provider {
    @_dynamicReplacement(for: getTimeline(in:completion:)) private func __preview__getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        #sourceLocation(file: "/Users/lindsayqin/Desktop/Workspace/swipe-smart/SwipeSmart/SwipeSmartWidget/SwipeSmartWidget.swift", line: 22)
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in __designTimeInteger("#3662.[2].[2].[2].sequence.[0]", fallback: 0) ..< __designTimeInteger("#3662.[2].[2].[2].sequence.[1]", fallback: 5) {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, emoji: __designTimeString("#3662.[2].[2].[2].[1].value.arg[1].value", fallback: "😀"))
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    
#sourceLocation()
    }
}

extension Provider {
    @_dynamicReplacement(for: getSnapshot(in:completion:)) private func __preview__getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        #sourceLocation(file: "/Users/lindsayqin/Desktop/Workspace/swipe-smart/SwipeSmart/SwipeSmartWidget/SwipeSmartWidget.swift", line: 17)
        let entry = SimpleEntry(date: Date(), emoji: __designTimeString("#3662.[2].[1].[0].value.arg[1].value", fallback: "😀"))
        completion(entry)
    
#sourceLocation()
    }
}

extension Provider {
    @_dynamicReplacement(for: placeholder(in:)) private func __preview__placeholder(in context: Context) -> SimpleEntry {
        #sourceLocation(file: "/Users/lindsayqin/Desktop/Workspace/swipe-smart/SwipeSmart/SwipeSmartWidget/SwipeSmartWidget.swift", line: 13)
        SimpleEntry(date: Date(), emoji: __designTimeString("#3662.[2].[0].[0].arg[1].value", fallback: "😀"))
    
#sourceLocation()
    }
}

import struct SwipeSmartWidgetExtension.Provider
import struct SwipeSmartWidgetExtension.SimpleEntry
import struct SwipeSmartWidgetExtension.SwipeSmartWidgetEntryView
import struct SwipeSmartWidgetExtension.SwipeSmartWidget
#Preview(as: .systemSmall) {
    SwipeSmartWidget()
} timeline: {
    SimpleEntry(date: .now, emoji: "😀")
    SimpleEntry(date: .now, emoji: "🤩")
}



