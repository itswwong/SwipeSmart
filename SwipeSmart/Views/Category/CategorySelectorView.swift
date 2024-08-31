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
            List($categories) { $category in
                NavigationLink(destination: RebatesView(cards: $cards, category: $category)) {
                    CategoryView(cards: $cards, category: $category)
                }
                .foregroundColor(.white)
                .listRowInsets(.init(top: 30, leading: 10, bottom: 30, trailing: 15))
                .listRowBackground(
                    RoundedRectangle(cornerRadius: 7)
                        .background(.clear)
                        .foregroundColor(.gray)
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
            .navigationTitle("Which card should you use?")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CategorySelectorView_Previews: PreviewProvider {
    static var previews: some View {
        CategorySelectorView(cards: .constant(CreditCard.testCards), categories: .constant(Category.sampleCategories))
    }
}
