//
//  DetailEditView.swift
//
//  Edit credit card info.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var card: CreditCard
    @Binding var categories: [Category]
    @State private var category = Category.emptyCategory
    @State private var newCategoryName = ""
    @State private var newUserRebate = ""
    @State private var newRebate: Int = 0

    @State private var editingIndex: Int? // state to track index of rebate being edited
    @State private var editingCategoryName = ""
    @State private var editingRebate = ""
    @FocusState private var isEditingFieldFocused: Bool // track focus state of text field

    var body: some View {
        Form {
            Section(header: Text("Card Info")) {
                TextField("Bank Name", text: $card.bankName)
                TextField("Card Name", text: $card.cardName)
            }
            
            Section(header: Text("Rebates")) {
                ForEach(card.categories.indices, id: \.self) { index in
                    HStack {
                        if editingIndex == index {
                            TextField("Category Name", text: $editingCategoryName)
                                .focused($isEditingFieldFocused)
                            Spacer()
                            TextField("Rebate", text: $editingRebate)
                                .keyboardType(.numberPad)
                                .focused($isEditingFieldFocused)
                            Button(action: {
                                if let rebateValue = Int(editingRebate), rebateValue > 0 {
                                    saveEditedRebate(at: index, newCategoryName: editingCategoryName, newRebate: rebateValue)
                                }
                            }) {
                                Image(systemName: "plus.circle.fill")
                            }
                            .disabled(editingCategoryName.isEmpty || editingRebate.isEmpty)
                        } else {
                            Text(card.categories[index].categoryName)
                                .onTapGesture {
                                    startEditingRebate(at: index)
                                }
                            Spacer()
                            Text("\(card.categories[index].rebate) %")
                                .onTapGesture {
                                    startEditingRebate(at: index)
                                }
                        }
                    }
                }
                .onDelete(perform: removeRebate)
                
                HStack {
                    TextField("Add Category", text: $newCategoryName)
                    TextField("Add Rebate", text: $newUserRebate)
                        .keyboardType(.numberPad)
                    Button(action: addRebate) {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newCategoryName.isEmpty || newUserRebate.isEmpty)
                }
            }
        }
    }

    private func startEditingRebate(at index: Int) {
        editingIndex = index
        editingCategoryName = card.categories[index].categoryName
        editingRebate = "\(card.categories[index].rebate)"
        isEditingFieldFocused = true // automatically focus field after tapping
    }

    private func saveEditedRebate(at index: Int, newCategoryName: String, newRebate: Int) {
        card.categories[index].categoryName = newCategoryName
        card.categories[index].rebate = newRebate

        if let categoryIndex = searchCategoryListNames(name: newCategoryName, categoryList: categories),
           let rebateIndex = searchCardID_Rebates(cardID: card.id, cardIDRebates: categories[categoryIndex].cardRebates) {
            categories[categoryIndex].cardRebates[rebateIndex].categoryName = newCategoryName
            categories[categoryIndex].cardRebates[rebateIndex].rebate = newRebate
            
            // sort the rebates in the category
            categories[categoryIndex].cardRebates.sort(by: sorterforCategory)
        }

        // reset editing state
        editingIndex = nil
        editingCategoryName = ""
        editingRebate = ""
    }

    private func addRebate() {
        withAnimation {
            newRebate = Int(newUserRebate) ?? 0
            if (searchCategoryListNames(name: newCategoryName, categoryList: categories) == nil) {
                let newCategoryRebate = CreditCard.cardID_rebates(cardID: card.id, categoryName: newCategoryName, rebate: newRebate)
                card.categories.append(newCategoryRebate)
                category.cardRebates.append(newCategoryRebate)
                category.name = newCategoryName
                categories.append(category)
                category = Category.emptyCategory
            } else if (searchCreditCardCategoryNames(categoryName: newCategoryName, categories: card.categories) == nil) {
                let newCategoryRebate = CreditCard.cardID_rebates(cardID: card.id, categoryName: newCategoryName, rebate: newRebate)
                card.categories.append(newCategoryRebate)
                let indexCategory = searchCategoryListNames(name: newCategoryName, categoryList: categories) ?? 0
                categories[indexCategory].cardRebates.append(newCategoryRebate)
                categories[indexCategory].cardRebates.sort(by: sorterforCategory)
            } else {
                let indexCard = searchCreditCardCategoryNames(categoryName: newCategoryName, categories: card.categories) ?? 0
                card.categories[indexCard].rebate = newRebate
                let indexCategory = searchCategoryListNames(name: newCategoryName, categoryList: categories) ?? 0
                let indexCardID_Rebate = searchCardID_Rebates(cardID: card.id, cardIDRebates: categories[indexCategory].cardRebates) ?? 0
                categories[indexCategory].cardRebates[indexCardID_Rebate].rebate = newRebate
                categories[indexCategory].cardRebates.sort(by: sorterforCategory)
            }
            newCategoryName = ""
            newUserRebate = ""
            newRebate = 0
        }
    }

    func removeRebate(at indices: IndexSet) {
        guard !indices.isEmpty else { return }
        
        for index in indices {
            let categoryAtIndex = card.categories[index]
            
            if let categoryIndex = searchCategoryListRebateIDs(rebateID: categoryAtIndex.id, categoryList: categories) {
                if categoryIndex < categories.count {
                    categories[categoryIndex].cardRebates.removeAll { $0.id == categoryAtIndex.id }
                }
            }
        }
        
        card.categories.remove(atOffsets: indices)
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(card: .constant(CreditCard.sampleCards[0]), categories: .constant(Category.sampleCategories))
    }
}
