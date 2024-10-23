//
//  ExtendedWidgetBundle.swift
//  ExtendedWidget
//
//  Created by Tyler Xiao on 10/21/24.
//

import WidgetKit
import SwiftUI

@main
struct ExtendedWidgetBundle: WidgetBundle {
    var body: some Widget {
        ExtendedWidget()
        ExtendedWidgetControl()
        ExtendedWidgetLiveActivity()
    }
}
