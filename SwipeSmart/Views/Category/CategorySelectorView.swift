//
//  CategorySelectorView.swift
//
//  Displays all available categories.
//

import SwiftUI

struct CategorySelectorView: View {
    @Binding var cards: [CreditCard]
    @Binding var categories: [Category]
    
    var body: some View {
        NavigationStack {
            // Don't display categories with no rewards
            List($categories.filter{ !$0.cardRewards.isEmpty }) { $category in
                NavigationLink(destination: RewardsView(cards: $cards, category: $category)) {
                    CategoryView(cards: $cards, category: $category)
                }
                .listRowInsets(.init(top: 30, leading: 20, bottom: 30, trailing: 25))
                .listRowBackground(
                    RoundedRectangle(cornerRadius: 15)
                        .background(.clear)
                        .foregroundColor(
                            cards.firstIndex(where: { $0.id == category.cardRewards[0].cardID }).map { index in
                                category.cardRewards[0].expired ? .pastelgraydark : cards[index].color.mainColor
                            } ?? .pastelgraydark
                        )
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
            .toolbar {
                ToolbarItem (placement: .topBarLeading) {
                    Text("Rewards")
                        .font(.largeTitle .weight(.bold))
                }
            }
        }
    }
}

struct CategorySelectorView_Previews: PreviewProvider {
    static var previews: some View {
        CategorySelectorView(cards: .constant(CreditCard.testCards), categories: .constant(Category.sampleCategories))
    }
}
