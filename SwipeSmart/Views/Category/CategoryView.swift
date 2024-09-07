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
            VStack(alignment: .leading) {
                Spacer()
                Text(category.name)
                    .font(.title2.weight(.bold))
                HStack {
                    if !category.cardRewards.isEmpty, let index = cards.firstIndex(where: { $0.id == category.cardRewards[0].cardID }) {
                        if category.cardRewards[0].expired {
                            Text("No active rewards in this category.")
                                .font(.subheadline)
                                .padding(.top, 10)
                        }
                        else if cards[index].bankName == cards[index].cardType {
                            VStack(alignment: .leading) {
                                Text(cards[index].bankName)
                                    .font(.title3.weight(.bold))
                                    .padding(.top, 10)
                                if !cards[index].cardName.isEmpty {
                                    Text("\(cards[index].cardName) \(cards[index].digits)")
                                        .padding(.top, 1)
                                }
                                else {
                                    Text(cards[index].digits)
                                        .padding(.top, 1)
                                }
                            }
                        }
                        else {
                            VStack(alignment: .leading) {
                                Text(cards[index].bankName)
                                    .font(.title3.weight(.bold))
                                    .padding(.top, 10)
                                Text("\(cards[index].cardType) \(cards[index].digits)")
                                    .padding(.top, 1)
                                if !cards[index].cardName.isEmpty {
                                    Text(cards[index].cardName)
                                        .padding(.top, 1)
                                }
                            }
                        }
                    }
                }
                Spacer()
            }
            Spacer()
            if !category.cardRewards.isEmpty, let index = cards.firstIndex(where: { $0.id == category.cardRewards[0].cardID }) {
                Circle()
                    .fill(.white)
                    .frame(width: 45, height: 45)
                    .overlay(
                        Text("\(category.cardRewards[0].reward)%")
                            .foregroundStyle(category.cardRewards[0].expired ? .pastelgraydark : cards[index].theme.mainColor)
                            .font(.headline)
                    )
                    .padding()
            }
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(cards: .constant(CreditCard.testCards), category: .constant(Category.sampleCategories[0]))
    }
}
