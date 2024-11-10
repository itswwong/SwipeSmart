//
//  WidgetError.swift
//  SwipeSmart
//
//  Created by Tyler Xiao on 11/4/24.
//

import Foundation
import WidgetKit
import SwiftUI
struct WidgetError : View {
    let errorWrapper: ErrorWrapper

    var body:some View{
        VStack {
            Text("An error has occurred!")
                .font(.title)
                .padding(.bottom)
            Text(errorWrapper.error.localizedDescription)
                .font(.headline)
            Text(errorWrapper.guidance)
                .font(.caption)
                .padding(.top)
            Spacer()
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(16)
    }
}
