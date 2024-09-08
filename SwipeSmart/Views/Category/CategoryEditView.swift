//
//  CategoryEditView.swift
//
//  Edit mode for each category.
//

import SwiftUI

struct CategoryEditView: View {
    @Binding var cards: [CreditCard]
    @Binding var category: Category
    @Binding var categories: [Category]
    @Binding var categoryExists: Bool
    @Binding var categoryEmpty: Bool
    
    @State private var newCategoryName: String
    
    init(cards: Binding<[CreditCard]>, category: Binding<Category>, categories: Binding<[Category]>, categoryExists: Binding<Bool>, categoryEmpty: Binding<Bool>) {
        self._cards = cards
        self._category = category
        self._categories = categories
        self._categoryExists = categoryExists
        self._categoryEmpty = categoryEmpty
        self._newCategoryName = State(initialValue: category.wrappedValue.name)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            TextField("Category Name", text: $newCategoryName)
                .font(.title2.weight(.bold))
                .onChange(of: newCategoryName) {
                    categoryEmpty = newCategoryName.isEmpty
                    categoryExists = categories.contains {
                        $0.name.lowercased() == newCategoryName.lowercased() && $0.id != category.id
                    }
                    if !categoryEmpty && !categoryExists {
                        updateCategoryName()
                    }
                }
            
            if newCategoryName.isEmpty {
                Text("Please enter a category name.")
                    .foregroundColor(.red)
                    .font(.footnote)
            } else if (categories.contains {
                $0.name.lowercased() == newCategoryName.lowercased() && $0.id != category.id
            }) {
                Text("Category already exists.")
                    .foregroundColor(.red)
                    .font(.footnote)
            }
            Spacer()
        }
    }
    
//    private func updateCategoryName() {
//        guard !categoryExists && !categoryEmpty else {
//            print("empty or exists")
//            return
//        }
//        
//        for cardIndex in cards.indices {
//            print("hello")
//            if let categoryIndex = cards[cardIndex].categories.firstIndex(where: { $0.categoryName == category.name }) {
//                print("cards are being updated")
//                cards[cardIndex].categories[categoryIndex].categoryName = newCategoryName
//            }
//        }
//        
//        self.category.name = newCategoryName
//        print("category list updated")
//    }
    private func updateCategoryName() {
        // Only update the name if the new name is different
        if newCategoryName != category.name {
            // Update the category in each card that contains this category
            for cardIndex in cards.indices {
                if let categoryIndex = cards[cardIndex].categories.firstIndex(where: { $0.categoryName == category.name }) {
                    cards[cardIndex].categories[categoryIndex].categoryName = newCategoryName
                }
            }
            
            // Update the category name in the global list
            self.category.name = newCategoryName
        }
    }
}

struct CategoryEditView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryEditView(cards: .constant(CreditCard.testCards), category: .constant(Category.sampleCategories[0]), categories: .constant(Category.sampleCategories), categoryExists: .constant(false), categoryEmpty: .constant(false))
    }
}
