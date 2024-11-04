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
    
    private var adjustedExpirationDate: Date? {
        /*
         Adjusted expiration date for internal use, expires on October 24, 11:59 PM if displayed date is October 25.
         */
        guard let expirationDate = expirationDate else { return nil }
        return Calendar.current.date(byAdding: DateComponents(day: -1, hour: 23, minute: 59, second: 59), to: expirationDate)
    }
    
    var body: some View {
        Toggle("Expiration Date?", isOn: $dateSet)
            .onChange(of: dateSet) { newValue in
                if !newValue {
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
    
    func isCardExpired() -> Bool {
    /*
     Checks if card is expired
     */
        guard let adjustedDate = adjustedExpirationDate else { return false }
        return Date() > adjustedDate
    }
}

struct DatePickerField_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerField(startDate: .constant(nil), expirationDate: .constant(nil), dateSet: .constant(false))
    }
}
