import SwiftUI

extension UIColor {
    var isLight: Bool {
        var white: CGFloat = 0
        self.getWhite(&white, alpha: nil)
        return white >= 0.7 // Adjust this threshold as needed
    }
}

struct CategoryView: View {
    @Binding var cards: [CreditCard]
    @Binding var category: Category
    
    var body: some View {
        HStack {
            let topReward = category.cardRewards.first?.reward ?? 0
            let topRewardCards = category.cardRewards.filter { $0.reward == topReward && $0.expired == false && $0.future == false }
            
            VStack(alignment: .leading) {
                Spacer()
//                Text(category.name)
//                    .font(.system(size: 18, weight: .bold))
                
                if topRewardCards.isEmpty || topReward == 0 {
                    Text("No active rewards in this category.")
                        .font(.subheadline)
                        .padding(.top, 6)
                }
                else {
                    ForEach(topRewardCards) { card in
                        Text(category.name)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(UIColor(categoryRewardColor(card: card, topRewardsCards: topRewardCards)).isLight ? .black : .white) // If foreground color is light, then display black text, and same for other way around
                        if let index = cards.firstIndex(where: { $0.id == card.cardID }) {
                            let cardDisplayName = cards[index].bankName == cards[index].cardType
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(cards[index].bankName)
                                        .foregroundColor(UIColor(categoryRewardColor(card: card, topRewardsCards: topRewardCards)).isLight ? Color(white: 0.2) : Color(white: 0.8)) // If foreground color is light, then display black text, and same for other way around
                                        .font(.system(size: 18))
                                        .padding(.top, 25)
                                        .padding(.bottom, 25)
                                        .textCase(.uppercase)
                                    
                                    // Only display card name and last 4 digits when bank name and card type are the same
                                    if cardDisplayName {
                                        if !cards[index].cardName.isEmpty {
                                            HStack {
                                                Text("\(cards[index].cardName) ")
                                                    .foregroundColor(UIColor(categoryRewardColor(card: card, topRewardsCards: topRewardCards)).isLight ? .black : .white) // If foreground color is light, then display black text, and same for other way around
                                                    .font(.system(size: 18))
                                                    
                                                
                                                if cards[index].digits.isEmpty {
                                                    Text("****")
                                                        .foregroundColor(UIColor(categoryRewardColor(card: card, topRewardsCards: topRewardCards)).isLight ? .black : .white) // If foreground color is light, then display black text, and same for other way around
                                                }
                                                else {
                                                    Text(cards[index].digits)
                                                        .foregroundColor(UIColor(categoryRewardColor(card: card, topRewardsCards: topRewardCards)).isLight ? .black : .white) // If foreground color is light, then display black text, and same for other way around
                                                        .font(.system(size: 18))
                                                }
                                            }
                                            .padding(.top, 1)
                                        }
                                        else {
                                            if cards[index].digits.isEmpty {
                                                Text("****")
                                                    .padding(.top, 1)
                                                    .foregroundColor(UIColor(categoryRewardColor(card: card, topRewardsCards: topRewardCards)).isLight ? .black : .white) // If foreground color is light, then display black text, and same for other way around
                                            }
                                            else {
                                                Text("\(cards[index].cardName) \(cards[index].digits)")
                                                    .font(.system(size: 18))
                                                    .foregroundColor(UIColor(categoryRewardColor(card: card, topRewardsCards: topRewardCards)).isLight ? .black : .white) // If foreground color is light, then display black text, and same for other way around
                                                Text(cards[index].digits)
                                                    .padding(.top, 1)
                                                    .foregroundColor(UIColor(categoryRewardColor(card: card, topRewardsCards: topRewardCards)).isLight ? .black : .white) // If foreground color is light, then display black text, and same for other way around
                                            }
                                        }
                                    } else {
                                        Text("\(cards[index].cardType) \(cards[index].digits)")
                                            .padding(.top, 1)
                                            .foregroundColor(UIColor(categoryRewardColor(card: card, topRewardsCards: topRewardCards)).isLight ? .black : .white) // If foreground color is light, then display black text, and same for other way around
                                    }
                                }
                                Spacer()
                                Text(category.cardRewards[0].reward == floor(category.cardRewards[0].reward) ? "\(Int(category.cardRewards[0].reward))%" : String(format: "%.1f%%", category.cardRewards[0].reward))
                                    //.foregroundStyle(categoryRewardColor(card: card, topRewardsCards: topRewardCards))
                                    .foregroundColor(UIColor(categoryRewardColor(card: card, topRewardsCards: topRewardCards)).isLight ? .black : .white) // If foreground color is light, then display black text, and same for other way around
                                    .font(.headline)
                                    .offset(y: -75) // Moves the text up by 75 points
                                    .padding()
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
