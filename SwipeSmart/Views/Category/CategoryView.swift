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
        HStack() {
            Spacer()
            VStack {
                Spacer()
                Text(category.name)
                    .padding(.bottom)
                HStack() {
                    if category.cardRebates.isEmpty {
                        Text("No rewards in this category.")
                        Spacer()
                    }
                    else if let index = findCreditCardFromID(cardID: category.cardRebates[0].cardID, cards: cards) {
                        HStack() {
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
                                    Text("\(category.cardRebates[0].rebate)%")
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
            .background(.gray)
            .previewLayout(.fixed(width: 250, height: 150))
    }
}
