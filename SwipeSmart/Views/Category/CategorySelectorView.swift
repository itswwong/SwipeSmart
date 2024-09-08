//
//  CategorySelectorView.swift
//
//  Displays all available categories.
//

import SwiftUI

struct CategorySelectorView: View {
    @Binding var cards: [CreditCard]
    @Binding var categories: [Category]
    
    @State private var isEditing = false
    @State private var categoryExists = false
    @State private var categoryEmpty = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($categories) { $category in
                    if isEditing {
                        CategoryEditView(cards: $cards, category: $category, categories: $categories, categoryExists: $categoryExists, categoryEmpty: $categoryEmpty)
                            .listRowInsets(.init(top: 30, leading: 20, bottom: 30, trailing: 25))
                            .listRowBackground(
                                RoundedRectangle(cornerRadius: 15)
                                    .background(.clear)
                                    .foregroundStyle(
                                        cards.firstIndex(where: { $0.id == category.cardRewards.first?.cardID }).map { index in
                                            category.cardRewards.first?.expired ?? false ? .pastelgraydark : cards[index].theme.mainColor
                                        } ?? .pastelgray
                                    )
                                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                            )
                            .listRowSeparator(.hidden)
                    } else if !category.cardRewards.isEmpty {
                        NavigationLink(destination: RewardsView(cards: $cards, category: $category)) {
                            CategoryView(cards: $cards, category: $category)
                        }
                        .listRowInsets(.init(top: 30, leading: 20, bottom: 30, trailing: 25))
                        .listRowBackground(
                            RoundedRectangle(cornerRadius: 15)
                                .background(.clear)
                                .foregroundStyle(
                                    cards.firstIndex(where: { $0.id == category.cardRewards.first?.cardID }).map { index in
                                        category.cardRewards.first?.expired ?? false ? .pastelgraydark : cards[index].theme.mainColor
                                    } ?? .pastelgraydark
                                )
                                .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                        )
                        .listRowSeparator(.hidden)
                    }
                }
                .onMove(perform: moveCategory)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text(isEditing ? "Categories" : "Best Cash Back")
                        .font(.largeTitle .weight(.bold))
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(isEditing ? "Done" : "Categories") {
                        isEditing.toggle()
                    }
                    .disabled(categoryExists || categoryEmpty)
                }
            }
            .environment(\.editMode, .constant(isEditing ? .active : .inactive))
        }
    }
    
    // Function to move categories
    private func moveCategory(from source: IndexSet, to destination: Int) {
        categories.move(fromOffsets: source, toOffset: destination)
    }
}

struct CategorySelectorView_Previews: PreviewProvider {
    static var previews: some View {
        CategorySelectorView(cards: .constant(CreditCard.testCards), categories: .constant(Category.sampleCategories))
    }
}
