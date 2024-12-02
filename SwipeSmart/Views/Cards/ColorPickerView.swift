//
//  ColorPickerView.swift
//
//  Color picker for credit card background.
//

import SwiftUI

struct ColorPicker: View {
    @Binding var selection: Theme
    @State var showPicker: Bool = false

    var body: some View {
        Picker(selection: $selection, label: Text("")) {
            ForEach(Theme.allCases) { color in
                ColorView(color: color)
                    .tag(color)
            }
        }
        .pickerStyle(.navigationLink)
        .labelsHidden()
    }
}

struct ColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        ColorPicker(selection: .constant(.blue_new))
    }
}

