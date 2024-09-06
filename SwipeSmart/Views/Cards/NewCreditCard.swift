//
//  NewCreditCard.swift
//
//  Adds new credit card.
//

import SwiftUI

struct NewCreditCard: View {
    @State private var newCard = CreditCard.emptyCard
    @State private var editingCategories = [Category]()
    @Binding var cards: [CreditCard]
    @Binding var categories: [Category]
    @Binding var isPresentingNewCardView: Bool
    
    var body: some View {
        NavigationStack {
            DetailEditView(card: $newCard, cards: $cards, categories: $editingCategories, showDelete: false, onDeleteCard: {})
                .navigationTitle("Add New Card")
                .onAppear {
                    editingCategories = categories
                }
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            isPresentingNewCardView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            if newCard.bankName.isEmpty || newCard.cardType.isEmpty {
                                return
                            }
                            cards.append(newCard)
                            categories = editingCategories
                            isPresentingNewCardView = false
                        }
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
