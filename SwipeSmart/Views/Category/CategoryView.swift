import SwiftUI

//extension UIColor {
//    var isLight: Bool {
//        var white: CGFloat = 0
//        self.getWhite(&white, alpha: nil)
//        return white >= 0.7 // Adjust this threshold as needed
//    }
//}

struct CategoryView: View {
    @Binding var cards: [CreditCard]
    @Binding var category: Category
    
    var body: some View {
        HStack {
            let topReward = category.cardRewards.first?.reward ?? 0
            let topRewardCards = category.cardRewards.filter { $0.reward == topReward && $0.expired == false && $0.future == false }
            
            VStack(alignment: .leading) {
                Spacer()
                
                if topRewardCards.isEmpty || topReward == 0 {
                    Text(category.name)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(outlineColor(category: category))
                    Text("No active rewards in this category.")
                        .font(.subheadline)
                        .padding(.top, 6)
                }
                else {
                    ForEach(topRewardCards) { card in
                        Text(category.name)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(categoryRewardColor(card: card, topRewardsCards: topRewardCards))
                        if let index = cards.firstIndex(where: { $0.id == card.cardID }) {
                            let cardDisplayName = cards[index].bankName == cards[index].cardType
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(cards[index].bankName)
                                        .foregroundColor(categoryRewardColor(card: card, topRewardsCards: topRewardCards))
                                        .font(.system(size: 18))
                                        .padding(.top, 25)
                                        .padding(.bottom, 25)
                                        .textCase(.uppercase)
                                    
                                    // Only display card name and last 4 digits when bank name and card type are the same
                                    if cardDisplayName {
                                        if !cards[index].cardName.isEmpty {
                                            HStack {
                                                Text("\(cards[index].cardName) ")
                                                    .foregroundColor(categoryRewardColor(card: card, topRewardsCards: topRewardCards))
                                                    .font(.system(size: 18))
                                                    
                                                
                                                if cards[index].digits.isEmpty {
                                                    Text("****")
                                                        .foregroundColor(categoryRewardColor(card: card, topRewardsCards: topRewardCards))
                                                }
                                                else {
                                                    Text(cards[index].digits)
                                                        .foregroundColor(categoryRewardColor(card: card, topRewardsCards: topRewardCards))
                                                        .font(.system(size: 18))
                                                }
                                            }
                                            .padding(.top, 1)
                                        }
                                        else {
                                            if cards[index].digits.isEmpty {
                                                Text("****")
                                                    .padding(.top, 1)
                                                    .foregroundColor(categoryRewardColor(card: card, topRewardsCards: topRewardCards))
                                            }
                                            else {
                                                if !cards[index].cardName.isEmpty {
                                                    Text("\(cards[index].cardName) \(cards[index].digits)")
                                                        .font(.system(size: 18))
                                                        .foregroundColor(categoryRewardColor(card: card, topRewardsCards: topRewardCards))
                                                }
                                                else {
                                                    Text(cards[index].digits)
                                                        .padding(.top, 1)
                                                        .foregroundColor(categoryRewardColor(card: card, topRewardsCards: topRewardCards))
                                                }
                                            }
                                        }
                                    } else {
                                        Text("\(cards[index].cardType) \(cards[index].digits)")
                                            .padding(.top, 1)
                                            .foregroundColor(categoryRewardColor(card: card, topRewardsCards: topRewardCards))
                                    }
                                }
                                Spacer()
                                Text(category.cardRewards[0].reward == floor(category.cardRewards[0].reward) ? "\(Int(category.cardRewards[0].reward))%" : String(format: "%.1f%%", category.cardRewards[0].reward))
                                    .foregroundColor(categoryRewardColor(card: card, topRewardsCards: topRewardCards))
                                    .font(.headline)
                                    .offset(y: -75)
                                    .padding()
                            }
                            if card != topRewardCards.last {
                                customDivider()
                                    .foregroundColor(categoryRewardColor(card: card, topRewardsCards: topRewardCards))
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
                return cards[index].theme.accentColor
            }
        }
        else {
            if let index = cards.firstIndex(where: { $0.id == topRewardsCards[0].cardID }) {
                return cards[index].theme.accentColor
            }
        }
        
        return Color("pastelgraydarkest")
    }
    
    private func outlineColor(category: Category) -> Color {
        if category.cardRewards.isEmpty {
            return Color("pastelgraydark")
        }

        if let index = cards.firstIndex(where: { $0.id == category.cardRewards[0].cardID }) {
            return category.cardRewards[0].expired || category.cardRewards[0].future ? Color("pastelgraydarkest") : cards[index].theme.accentColor
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
