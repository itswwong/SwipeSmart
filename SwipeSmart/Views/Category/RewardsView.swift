//
//  RewardsView.swift
//
//  Displays list of credit cards that offer rewards for a specific purchase category.
//

import SwiftUI

struct RewardsView: View {
    @Binding var cards: [CreditCard]
    @Binding var category: Category
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(category.cardRewards) { cardID_reward in
                    if let index = cards.firstIndex(where: { $0.id == cardID_reward.cardID }) {
                            RewardsCardView(card: cards[index], reward: cardID_reward.reward, expirationDate: cardID_reward.expirationDate, expired: cardID_reward.expired)
                            .listRowInsets(.init(top: 30, leading: 10, bottom: 30, trailing: 15))
                            .listRowBackground(
                                RoundedRectangle(cornerRadius: 7)
                                    .background(.clear)
                                    .foregroundColor(cardID_reward.expired ? darkGray : pastelGreen)
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
            .navigationTitle("Best Cards for \(category.name):")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct RewardsView_Previews: PreviewProvider {
    static var previews: some View {
        RewardsView(cards: .constant(CreditCard.testCards), category: .constant(Category.sampleCategories[0]))
    }
}
