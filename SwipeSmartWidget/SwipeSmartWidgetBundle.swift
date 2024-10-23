//
//  SwipeSmartWidgetBundle.swift
//  SwipeSmartWidget
//
//  Created by William Jiang on 2024-10-22.
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
