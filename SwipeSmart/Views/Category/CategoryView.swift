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
                    .padding(.bottom, 10)
                HStack {
                    if category.cardRewards.isEmpty {
                        Text("No rewards in this category.")
                        Spacer()
                    }
                    else if let index = cards.firstIndex(where: { $0.id == category.cardRewards[0].cardID }) {
                        if category.cardRewards[0].expired {
                            HStack {
                                Text("No active rewards in this category.")
                                    .font(.subheadline)
                            }
                        }
                        else {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(cards[index].bankName)
                                        .font(.headline)
                                        .padding(.bottom, 1)
                                    Text(cards[index].cardName.isEmpty ? cards[index].cardType : cards[index].cardName).font(.subheadline)
                                }
                                Spacer()
                                Circle()
                                    .fill(.white)
                                    .frame(width: 45, height: 45)
                                    .overlay(
                                        Text("\(category.cardRewards[0].reward)%")
                                            .foregroundColor(pastelGreen)
                                            .font(.headline)
                                    )
                            }
                        }
                        Spacer()
                    }
                }
                Spacer()
            }
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(cards: .constant(CreditCard.testCards), category: .constant(Category.sampleCategories[0]))
    }
}
