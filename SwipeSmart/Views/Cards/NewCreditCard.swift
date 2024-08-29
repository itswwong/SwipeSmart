//
//  NewCreditCard.swift
//
//  Adds new credit card.
//

import SwiftUI

struct NewCreditCard: View {
    @State private var newCard = CreditCard.emptyCard
    @Binding var cards: [CreditCard]
    @Binding var categories: [Category]
    @Binding var isPresentingNewCardView: Bool
    
    var body: some View {
        NavigationStack {
            DetailEditView(card: $newCard, categories: $categories)
                .navigationTitle("Add New Card")
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            isPresentingNewCardView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            cards.append(newCard)
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
