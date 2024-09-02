//
//  DatePickerField.swift
//
//  Expiration date picker field.
//

import SwiftUI

struct DatePickerField: View {
    @Binding var date: Date?
    @Binding var dateSet: Bool
    
    var body: some View {
        Toggle("Expiration Date?", isOn: $dateSet)
            .onChange(of: dateSet) {
                if !dateSet {
                    date = nil
                }
            }
        
        if dateSet {
            HStack {
                Spacer()
                DatePicker("", selection: Binding(
                    get: { date ?? Date() },
                    set: { newValue in
                        date = newValue
                    }
                ), displayedComponents: .date)
                .labelsHidden()
            }
            .onAppear {
                if date == nil {
                    date = Date()
                }
            }
        }
    }
}

struct DatePickerField_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerField(date: .constant(nil), dateSet: .constant(false))
    }
}
