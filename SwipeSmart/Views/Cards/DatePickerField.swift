//
//  DatePickerField.swift
//
//  Expiration date picker field.
//

import SwiftUI

struct DatePickerField: View {
    @Binding var startDate: Date?
    @Binding var expirationDate: Date?
    @Binding var dateSet: Bool
    
    var body: some View {
        Toggle("Expiration Date?", isOn: $dateSet)
            .onChange(of: dateSet) {
                if !dateSet {
                    startDate = nil
                    expirationDate = nil
                }
            }
        
        if dateSet {
            VStack {
                // Input start date
                HStack {
                    DatePicker("Start Date:", selection: Binding(
                        get: { startDate ?? Date() },
                        set: { newValue in
                            startDate = newValue
                            
                            if let date = expirationDate, date <= newValue {
                                expirationDate = Calendar.current.date(byAdding: .day, value: 1, to: newValue)
                            }
                        }
                    ), displayedComponents: .date)
                    .tint(.blue)
                }
                
                // Input expiration date
                HStack {
                    DatePicker("Expiration Date:", selection: Binding(
                        get: { expirationDate ?? Date() },
                        set: { newValue in
                            let date = Date()
                            if newValue < date {
                                
                            }
                            expirationDate = newValue
                        }
                    ), in: (Calendar.current.date(byAdding: .day, value: 1, to: startDate ?? Date()) ?? Date())..., displayedComponents: .date)
                    .tint(.blue)
                }
            }
            .onAppear {
                if startDate == nil {
                    startDate = Date()
                }
                if expirationDate == nil {
                    expirationDate = Calendar.current.date(byAdding: .day, value: 1, to: startDate!)
                }
            }
        }
    }
}

struct DatePickerField_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerField(startDate: .constant(nil), expirationDate: .constant(nil), dateSet: .constant(false))
    }
}
