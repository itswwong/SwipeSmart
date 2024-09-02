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
            Spacer()
            VStack {
                Spacer()
                Text(category.name)
                    .padding(.bottom)
                HStack {
                    if category.cardRewards.isEmpty {
                        Text("No rewards in this category.")
                        Spacer()
                    }
                    else if let index = cards.firstIndex(where: { $0.id == category.cardRewards[0].cardID }) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(cards[index].bankName)
                                    .font(.headline)
                                Text(cards[index].cardName).font(.subheadline)
                            }
                            Spacer()
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 40, height: 40)
                                .overlay(
                                    Text("\(category.cardRewards[0].reward)%")
                                        .foregroundColor(.white)
                                        .font(.subheadline)
                                )
                        }
                        Spacer()
                    }
                }
                Spacer()
            }
            Spacer()
        }
        .padding()
        .foregroundColor(.white)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(cards: .constant(CreditCard.testCards), category: .constant(Category.sampleCategories[0]))
    }
}
