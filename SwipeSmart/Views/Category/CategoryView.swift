//
//  CategoryView.swift
//
//  Displays individual category within CategorySelectorView.
//

import SwiftUI

struct CategoryView: View {
    @Binding var cards: [CreditCard]
    @Binding var category: Category
    
    var body: some View {
        HStack {
            let topReward = category.cardRewards.first?.reward ?? 0
            let topRewardCards = category.cardRewards.filter { $0.reward == topReward && $0.expired == false && $0.future == false }
            
            VStack(alignment: .leading) {
                Spacer()
                Text(category.name)
                    .font(.title.weight(.bold))
                
                if topRewardCards.isEmpty || topReward == 0 {
                    Text("No active rewards in this category.")
                        .font(.subheadline)
                        .padding(.top, 6)
                }
                else {
                    ForEach(topRewardCards) { card in
                        if let index = cards.firstIndex(where: { $0.id == card.cardID }) {
                            if cards[index].bankName == cards[index].cardType {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(cards[index].bankName)
                                            .font(.title3.weight(.bold))
                                            .padding(.top, 6)
                                        if !cards[index].cardName.isEmpty {
                                            HStack {
                                                Text("\(cards[index].cardName) ")
                                                
                                                if cards[index].digits.isEmpty {
                                                    Text("****")
                                                }
                                                else {
                                                    Text(cards[index].digits)
                                                }
                                            }
                                            .padding(.top, 1)
                                        }
                                        else {
                                            if cards[index].digits.isEmpty {
                                                Text("****")
                                                    .padding(.top, 1)
                                            }
                                            else {
                                                Text(cards[index].digits)
                                                    .padding(.top, 1)
                                            }
                                        }
                                    }
                                    Spacer()
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 50, height: 50)
                                        .overlay(
                                            Text(category.cardRewards[0].reward == floor(category.cardRewards[0].reward) ? "\(Int(category.cardRewards[0].reward))%" : String(format: "%.1f%%", category.cardRewards[0].reward))
                                                .foregroundStyle(categoryRewardColor(card: card, topRewardsCards: topRewardCards))
                                                .font(.headline)
                                        )
                                        .padding()
                                }
                            }
                            else {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(cards[index].bankName)
                                            .font(.title3.weight(.bold))
                                            .padding(.top, 6)
                                        Text("\(cards[index].cardType) \(cards[index].digits)")
                                            .padding(.top, 1)
                                        if !cards[index].cardName.isEmpty {
                                            HStack {
                                                Text("\(cards[index].cardName) ")
                                                
                                                if cards[index].digits.isEmpty {
                                                    Text("****")
                                                }
                                                else {
                                                    Text(cards[index].digits)
                                                }
                                            }
                                            .padding(.top, 1)
                                        }
                                        else {
                                            if cards[index].digits.isEmpty {
                                                Text("****")
                                                    .padding(.top, 1)
                                            }
                                            else {
                                                Text(cards[index].digits)
                                                    .padding(.top, 1)
                                            }
                                        }
                                    }
                                    Spacer()
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 50, height: 50)
                                        .overlay(
                                            Text(category.cardRewards[0].reward == floor(category.cardRewards[0].reward) ? "\(Int(category.cardRewards[0].reward))%" : String(format: "%.1f%%", category.cardRewards[0].reward))
                                                .foregroundStyle(categoryRewardColor(card: card, topRewardsCards: topRewardCards))
                                                .font(.headline)
                                        )
                                        .padding()
                                }
                            }
                            if card != topRewardCards.last {
                                customDivider()
                                    .padding(.top, 20)
                                    .padding(.bottom, 10)
                            }
                        }
                    }
                }
                Spacer()
            }
        }
    }
    
    private func categoryRewardColor(card: CreditCard.cardID_rewards, topRewardsCards: [CreditCard.cardID_rewards]) -> Color {
        if card == topRewardsCards.first {
            if let index = cards.firstIndex(where: { $0.id == card.cardID }) {
                return cards[index].theme.mainColor
            }
        }
        else {
            if let index = cards.firstIndex(where: { $0.id == topRewardsCards[0].cardID }) {
                return cards[index].theme.mainColor
            }
        }
        
        return Color("pastelgraydark")
    }
}

struct customDivider: View {
    var body: some View {
        Rectangle()
            .fill(.primary)
            .frame(height: 1)
            .edgesIgnoringSafeArea(.horizontal)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(cards: .constant(CreditCard.testCards), category: .constant(Category.sampleCategories[0]))
    }
}
