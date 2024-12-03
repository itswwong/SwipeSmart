//
//  RewardsView.swift
//
//  Displays list of credit cards that offer rewards for a specific purchase category.
//

import SwiftUI

struct RewardsView: View {
    @Binding var cards: [CreditCard]
    @Binding var category: Category
    
    @State private var isSelected = false
    @State private var s = -50
        
    var body: some View {
        let topReward = category.cardRewards.first?.reward ?? 0
        let topRewardCards = category.cardRewards.filter { $0.reward == topReward && $0.expired == false && $0.future == false }
        let displayedCards = category.cardRewards.filter { $0.reward != topReward || $0.expired == true || $0.future == true }

        HStack {
            Text("Best Savings")
                .font(.custom("Inter-Regular_SemiBold", size: 20))
                .padding(.leading, 20)
                .padding(.top, 0)
            Spacer()
        }
        ScrollView {
            VStack (spacing:20) {
                ForEach(topRewardCards) { card in
                    if let index = cards.firstIndex(where: { $0.id == card.cardID }) {
                        RewardsCardView(
                            card: cards[index],
                            reward: card.reward,
                            startDate: card.startDate,
                            expirationDate: card.expirationDate,
                            expired: card.expired,
                            future: card.future,
                            strokeColor: cards[index].theme.accentColor)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .background(.clear)
                                .foregroundStyle(card.expired || card.future ? .pastelgraydark : cards[index].theme.mainColor)
                                .padding(
                                    EdgeInsets(
                                        top: 0,
                                        leading: 0,
                                        bottom: 0,
                                        trailing: 0
                                    )
                                )
                                .overlay(
                                    // border
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(
                                            card.expired || card.future ? .pastelgraydarkest : cards[index].theme.accentColor
                                        )
                                )
                                .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                        )
                    }
                }
            }
            .padding(.bottom, 10)
            VStack (spacing: CGFloat(s)) {
                ForEach(displayedCards) { card in
                    if let index = cards.firstIndex(where: { $0.id == card.cardID }) {
                        RewardsCardView(
                            card: cards[index],
                            reward: card.reward,
                            startDate: card.startDate,
                            expirationDate: card.expirationDate,
                            expired: card.expired,
                            future: card.future,
                            strokeColor: cards[index].theme.accentColor)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .background(.clear)
                                .foregroundStyle(card.expired || card.future ? .pastelgraydark : cards[index].theme.mainColor)
                                .padding(
                                    EdgeInsets(
                                        top: 0,
                                        leading: 0,
                                        bottom: 0,
                                        trailing: 0
                                    )
                                )
                                .overlay(
                                    // border
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(
                                            card.expired || card.future ? .pastelgraydarkest : cards[index].theme.accentColor
                                        )
                                )
                                .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                        )
                        .onTapGesture {
                            withAnimation {
                                isSelected.toggle()
                                if isSelected {
                                    s = 20
                                } else {
                                    s = -50
                                }
                            }
                        }
                    }
                }
            }
        }
        .padding()
        .toolbar {
            ToolbarItem (placement: .principal) {
                Text(category.name)
                    .font(.custom("Inter-Regular_SemiBold", size: 20))
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
    
    
    struct RewardsView_Previews: PreviewProvider {
        static var previews: some View {
            RewardsView(cards: .constant(CreditCard.testCards), category: .constant(Category.sampleCategories[0]))
        }
    }
}
