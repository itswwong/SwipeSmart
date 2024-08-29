//
//  RebatesView.swift
//
//  Displays list of credit cards that offer rebates for a specific purchase category.
//

import SwiftUI

struct RebatesView: View {
    @Binding var cards: [CreditCard]
    @Binding var category: Category
    
    var body: some View {
        let categoryNameLower = category.name.lowercased()
        
        NavigationStack {
            List {
                ForEach(category.cardRebates) { cardID_rebate in
                    if let index = findCreditCardFromID(cardID: cardID_rebate.cardID, cards: cards) {
                        let rebate = cardID_rebate.rebate  // Get the rebate for this card
                        RebatesCardView(card: cards[index], rebate: rebate)
                            .foregroundColor(.white)
                            .listRowInsets(.init(top: 30, leading: 10, bottom: 30, trailing: 15))
                            .listRowBackground(
                                RoundedRectangle(cornerRadius: 7)
                                    .background(.clear)
                                    .foregroundColor(.gray)
                                    .padding(
                                        EdgeInsets(
                                            top: 5,
                                            leading: 0,
                                            bottom: 5,
                                            trailing: 0
                                        )
                                    )
                            )
                            .listRowSeparator(.hidden)
                    }
                }
            }
            .navigationTitle("Best cards for \(categoryNameLower):")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct RebatesView_Previews: PreviewProvider {
    static var previews: some View {
        RebatesView(cards: .constant(CreditCard.testCards), category: .constant(Category.sampleCategories[0]))
    }
}
