//
//  ExtendedWidgetLiveActivity.swift
//  ExtendedWidget
//
//  Created by Tyler Xiao on 10/21/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct ExtendedWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct ExtendedWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: ExtendedWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension ExtendedWidgetAttributes {
    fileprivate static var preview: ExtendedWidgetAttributes {
        ExtendedWidgetAttributes(name: "World")
    }
}

extension ExtendedWidgetAttributes.ContentState {
    fileprivate static var smiley: ExtendedWidgetAttributes.ContentState {
        ExtendedWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: ExtendedWidgetAttributes.ContentState {
         ExtendedWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: ExtendedWidgetAttributes.preview) {
   ExtendedWidgetLiveActivity()
} contentStates: {
    ExtendedWidgetAttributes.ContentState.smiley
    ExtendedWidgetAttributes.ContentState.starEyes
}
