//
//  SwipeSmartWidgetBundle.swift
//  SwipeSmartWidget
//
//  Created by Tyler Xiao on 10/18/24.
//

import WidgetKit
import SwiftUI

@main
struct SwipeSmartWidgetBundle: WidgetBundle {
    var body: some Widget {
        SwipeSmartWidget()
        SwipeSmartWidgetControl()
        SwipeSmartWidgetLiveActivity()
    }
}
