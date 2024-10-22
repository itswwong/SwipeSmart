//
//  AppIntent.swift
//  SwipeSmartWidget
//
//  Created by Tyler Xiao on 10/18/24.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource { "Configuration" }
    static var description: IntentDescription { "This is an example widget." }

    // An example configurable parameter.
    @Parameter(title: "Name", default: "Joe Bruin")
    //var creditCard: CreditCard
    var name: String
    @Parameter(title: "Favorite Emoji", default: "😃")
    var favoriteEmoji: String
    @Parameter(title: "Favorite Club", default: "Creative Labs")
    var club: String
    //var cards : [CreditCard]
}
