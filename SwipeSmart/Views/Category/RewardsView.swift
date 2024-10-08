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
                        RewardsCardView(card: cards[index], reward: cardID_reward.reward, startDate: cardID_reward.startDate, expirationDate: cardID_reward.expirationDate, expired: cardID_reward.expired, future: cardID_reward.future)
                            .listRowInsets(.init(top: 30, leading: 10, bottom: 30, trailing: 15))
                            .listRowBackground(
                                RoundedRectangle(cornerRadius: 15)
                                    .background(.clear)
                                    .foregroundStyle(cardID_reward.expired || cardID_reward.future ? .pastelgraydark : cards[index].theme.mainColor)
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
            .toolbar {
                ToolbarItem (placement: .principal) {
                    Text(category.name)
                        .font(.largeTitle .weight(.bold))
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
    }
}

struct RewardsView_Previews: PreviewProvider {
    static var previews: some View {
        RewardsView(cards: .constant(CreditCard.testCards), category: .constant(Category.sampleCategories[0]))
    }
}
