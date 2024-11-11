//
//  NewCreditCard.swift
//
//  Adds new credit card.
//

import SwiftUI

struct NewCreditCard: View {
    
    let customLightGray = Color(red: 0.95, green: 0.95, blue: 0.95)
    let customLightMidGray = Color(red: 0.9, green: 0.9, blue: 0.9)
    let customMidGray = Color(red: 0.8, green: 0.8, blue: 0.8)
    let customDarkGray = Color(red: 0.4, green: 0.4, blue: 0.4)
    
    @State private var newCard = CreditCard.emptyCard
    @State private var editingCategories = [Category]()
    @State private var duplicateError = false
    
    @Binding var cards: [CreditCard]
    @Binding var categories: [Category]
    @Binding var isPresentingNewCardView: Bool
    
    var body: some View {
        NavigationStack {
            
            
            VStack {
                Text("Add a New Card")
                    .fontWeight(.bold)
                    .font(.system(size: 24))
                    .padding(20)
                DetailEditView(card: $newCard, cards: $cards, categories: $editingCategories, duplicateError: $duplicateError, showDelete: false, onDeleteCard: {})
                    .padding(.vertical, 5)
                Button("ADD CARD") {
                    isPresentingNewCardView = false
                    duplicateError = false
                    categories = editingCategories
                    cards.append(newCard)
                }
                .padding(.vertical, 15)
                .padding(.horizontal, 139)
                .overlay(RoundedRectangle(cornerRadius:5).stroke(customLightMidGray, lineWidth: 1))
                .foregroundColor(Color.white)
                .background(customLightMidGray)
                .fontWeight(.bold)
                .disabled(newCard.bankName.isEmpty || newCard.cardType.isEmpty || duplicateError)
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: {
                        isPresentingNewCardView = false
                    }) {
                        Image(systemName: "xmark")
                    }
                }
                
            }
        }
        .padding(15)
    }
}

struct NewCreditCard_Previews: PreviewProvider {
    static var previews: some View {
        NewCreditCard(cards: .constant(CreditCard.sampleCards), categories: .constant(Category.sampleCategories), isPresentingNewCardView: .constant(true))
    }
}
