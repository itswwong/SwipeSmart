//
//  CategorySelectorView.swift
//
//  Displays all available categories.
//

import SwiftUI

enum ViewState {
    case categories
    case cashback
}

struct CategorySelectorView: View {
    @Binding var cards: [CreditCard]
    @Binding var categories: [Category]

    @State private var viewState: ViewState = .cashback
    @State private var editCategoryExists = false
    @State private var editCategoryEmpty = false
    @State private var addCategoryExists = false
    @State private var addCategoryEmpty = true
    @State private var addCategoryName = ""
    @State private var showingAddCategoryAlert = false
    
    @State private var showingDeleteConfirmation = false
    @State private var categoryToDelete: IndexSet? = nil
    
    var body: some View {
        NavigationStack {
            List {
                switch viewState {
                case .categories:
                    ForEach($categories) { $category in
                        CategoryEditView(cards: $cards, category: $category, categories: $categories, categoryExists: $editCategoryExists, categoryEmpty: $editCategoryEmpty)
                            .listRowInsets(.init(top: 30, leading: 20, bottom: 30, trailing: 25))
                            .listRowBackground(
                                RoundedRectangle(cornerRadius: 15)
                                    .background(.clear)
                                    .foregroundStyle(foregroundColor(category: category))
                                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                            )
                            .listRowSeparator(.hidden)
                    }
                    .onMove(perform: moveCategory)
                    .onDelete(perform: confirmDeleteCategory)
                    
                    Button(action: {
                        showingAddCategoryAlert = true
                    }) {
                        HStack {
                            Spacer()
                            Image(systemName: "plus")
                                .bold()
                                .font(.title)
                            Spacer()
                        }
                        .frame(height: 40)
                    }
                    .buttonStyle(addButton())
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    .listRowInsets(.init(top: 5, leading: 0, bottom: 0, trailing: 0))
                    
//                    Button(action: {
//                        showingAddCategoryAlert = true
//                    }) {
//                        Text("Add Category")
//                            .bold()
//                            .padding(20)
//                            .foregroundStyle(.black)
//                            .frame(width: .infinity, alignment: .center)
//                    }
//                    .listRowInsets(.init(top: 5, leading: 0, bottom: 5, trailing: 0))
//                    .listRowSeparator(.hidden)
//                    .listRowBackground(
//                        RoundedRectangle(cornerRadius: 15)
//                            .background(.clear)
//                            .foregroundStyle(.white)
//                            .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
//                    )
                    
                case .cashback:
                    ForEach($categories) { $category in
                        if !category.cardRewards.isEmpty {
                            NavigationLink(destination: RewardsView(cards: $cards, category: $category)) {
                                CategoryView(cards: $cards, category: $category)
                            }
                            .listRowInsets(.init(top: 30, leading: 20, bottom: 30, trailing: 25))
                            .listRowBackground(
                                RoundedRectangle(cornerRadius: 15)
                                    .background(.clear)
                                    .foregroundStyle(foregroundColor(category: category))
                                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                            )
                            .listRowSeparator(.hidden)
                        }
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text(viewState == .categories ? "Categories" : "Best Cash Back")
                        .font(.largeTitle .weight(.bold))
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(viewState == .categories ? "Done" : "Categories") {
                        viewState = viewState == .categories ? .cashback : .categories
                    }
                    .disabled(editCategoryExists || editCategoryEmpty)
                }
            }
            .alert("Are you sure you want to delete this category?", isPresented: $showingDeleteConfirmation, presenting: categoryToDelete) { category in
                Button("Delete", role: .destructive) {
                    deleteCategory()
                }
                Button("Cancel", role: .cancel) {}
            } message: { category in
                Text("This will permanently remove all rewards associated with this category.")
            }
            .sheet(isPresented: $showingAddCategoryAlert) {
                AddCategorySheet(
                    isPresented: $showingAddCategoryAlert,
                    addCategoryName: $addCategoryName,
                    addCategoryExists: $addCategoryExists,
                    addCategoryEmpty: $addCategoryEmpty,
                    categories: $categories,
                    onAdd: addNewCategory
                )
            }
        }
    }
    
    private func moveCategory(from source: IndexSet, to destination: Int) {
        categories.move(fromOffsets: source, toOffset: destination)
    }
    
    private func confirmDeleteCategory(at offsets: IndexSet) {
        categoryToDelete = offsets
        showingDeleteConfirmation = true
    }
    
    private func deleteCategory() {
        guard let offsets = categoryToDelete else { return }
        
        for index in offsets {
            let categoryToDelete = categories[index]
            
            for cardIndex in cards.indices {
                cards[cardIndex].categories.removeAll { reward in
                    reward.categoryName == categoryToDelete.name
                }
            }
        }

        categories.remove(atOffsets: offsets)
        categoryToDelete = nil
    }
    
    private func addNewCategory() {
        let newCategory = Category(name: addCategoryName, cardRewards: [])
        categories.append(newCategory)
        
        addCategoryName = ""
        addCategoryEmpty = false
        addCategoryExists = false
    }
    
    
    private func foregroundColor(category: Category) -> Color {
        if category.cardRewards.isEmpty {
            return .pastelgray
        }

        if let index = cards.firstIndex(where: { $0.id == category.cardRewards[0].cardID }) {
            return category.cardRewards[0].expired ? .pastelgraydark : cards[index].theme.mainColor
        }
        
        return .pastelgray
    }
}

struct addButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.pastelgraydark)
            .foregroundColor(.white)
            .cornerRadius(15)
            .opacity(configuration.isPressed ? 0.75 : 1)
    }
}

struct CategorySelectorView_Previews: PreviewProvider {
    static var previews: some View {
        CategorySelectorView(cards: .constant(CreditCard.testCards), categories: .constant(Category.sampleCategories))
    }
}

