//
//  ColorView.swift
//
//  Color view for ColorPickerView.
//

import SwiftUI

struct ColorView: View {
    let color: Theme
    
    var body: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(color.mainColor)
            .padding(4)
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(color: .green_new)
    }
}
