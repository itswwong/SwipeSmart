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
    @State private var addCategoryEmpty = false
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
                                        .overlay(
                                            // border
                                            RoundedRectangle(cornerRadius: 15)
                                                .stroke(
                                                    outlineColor(category: category)
                                                )
                                        )
                                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                                )
                                .listRowSeparator(.hidden)
                        }
                        .onMove(perform: moveCategory)
                        .onDelete(perform: confirmDeleteCategory)
                        .toolbar(.hidden, for: .tabBar)
                   
                    
                    // Work on this case
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
                                        .overlay(
                                            // border
                                            RoundedRectangle(cornerRadius: 15)
                                                .stroke(
                                                    outlineColor(category: category), lineWidth: 2
                                                )
                                        )
                                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                                )
                                .listRowSeparator(.hidden)
                                .foregroundColor(outlineColor(category: category))
                            }
                        }
                        .toolbar(.visible, for: .tabBar)
                }
            }
            .padding(.top, -30)
            .scrollContentBackground(.hidden)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("", systemImage:viewState == .categories ? "arrow.backward" : "") {
                        viewState = viewState == .categories ? .cashback : .categories
                    }
                    .disabled(editCategoryExists || editCategoryEmpty)
                }
                //Spacer()
                ToolbarItem(placement: .principal) {
                    Text(viewState == .categories ? "Categories" : "Best Cash Back")
                        .font(.title3 .weight(.semibold))
                }
                //Spacer()
                ToolbarItem(placement: .topBarTrailing) {
                    Button("",systemImage:(viewState == .categories ? "plus.circle" : "line.3.horizontal"),action: {
                        if viewState == .categories {
                            showingAddCategoryAlert = true
                        } else {
                            viewState = viewState == .categories ? .cashback : .categories
                        }
                    })
                    .buttonStyle(addButton())
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
            }
            .navigationBarTitleDisplayMode(.inline)
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
            return Color("pastelgray")
        }

        if let index = cards.firstIndex(where: { $0.id == category.cardRewards[0].cardID }) {
            return category.cardRewards[0].expired || category.cardRewards[0].future ? Color("pastelgraydark") : cards[index].theme.mainColor
        }
        
        return Color("pastelgray")
    }
    
    // accent color (for text and border)
    private func outlineColor(category: Category) -> Color {
        if category.cardRewards.isEmpty {
            return Color("pastelgraydark")
        }

        if let index = cards.firstIndex(where: { $0.id == category.cardRewards[0].cardID }) {
            return category.cardRewards[0].expired || category.cardRewards[0].future ? Color("pastelgraydarkest") : cards[index].theme.accentColor
        }
        
        return Color("pastelgraydark")
    }
}

struct addButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .cornerRadius(15)
            .opacity(configuration.isPressed ? 0.75 : 1)
    }
}

struct CategorySelectorView_Previews: PreviewProvider {
    static var previews: some View {
        CategorySelectorView(cards: .constant(CreditCard.testCards), categories: .constant(Category.sampleCategories))
    }
}

