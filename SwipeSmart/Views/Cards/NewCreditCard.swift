//
//  NewCreditCard.swift
//
//  Adds new credit card.
//

import SwiftUI

struct NewCreditCard: View {
    @State private var newCard = CreditCard.emptyCard
    @State private var editingCategories = [Category]()
    @State private var duplicateError = false
    
    @Binding var cards: [CreditCard]
    @Binding var categories: [Category]
    @Binding var isPresentingNewCardView: Bool
    
    var body: some View {
        NavigationStack {
            DetailEditView(card: $newCard, cards: $cards, categories: $editingCategories, duplicateError: $duplicateError, showDelete: false, onDeleteCard: {})
                .navigationTitle("Add New Card")
                .onAppear {
                    editingCategories = categories
                }
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            isPresentingNewCardView = false
                        }
                        .tint(.blue)
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            isPresentingNewCardView = false
                            duplicateError = false
                            categories = editingCategories
                            cards.append(newCard)
                        }
                        .disabled(newCard.bankName.isEmpty || newCard.cardType.isEmpty || newCard.digits.isEmpty || duplicateError)
                        .tint(newCard.bankName.isEmpty || newCard.cardType.isEmpty || newCard.digits.isEmpty || duplicateError ? .gray : .blue)
                    }
                }
        }
    }
}

struct NewCreditCard_Previews: PreviewProvider {
    static var previews: some View {
        NewCreditCard(cards: .constant(CreditCard.sampleCards), categories: .constant(Category.sampleCategories), isPresentingNewCardView: .constant(true))
    }
}
