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
    @State private var selectedCategoryName = ""
    @State private var newUserRebate = ""
    @State private var newRebate: Int = 0

    var body: some View {
        Form {
            Section(header: Text("Card Info")) {
                TextField("Bank Name", text: $card.bankName)
                TextField("Card Name", text: $card.cardName)
            }
            
            Section(header: Text("Rebates")) {
                ForEach(card.categories.indices, id: \.self) { index in
                    HStack {
                        TextField("Category Name", text: $card.categories[index].categoryName)
                            .textFieldStyle(PlainTextFieldStyle())
                        
                        Spacer()
                        
                        TextField("Rebate", text: Binding(
                            get: {
                                String(card.categories[index].rebate)
                            },
                            set: { newValue in
                                if let newRebateValue = Int(newValue) {
                                    updateRebateValue(for: index, with: newRebateValue)
                                }
                            }
                        ))
                        .keyboardType(.numberPad)
                        .textFieldStyle(PlainTextFieldStyle())
                    }
                }
                .onDelete(perform: removeRebate)
                
                HStack {
                    Menu {
                        Picker("Categories", selection: $selectedCategoryName) {
                            ForEach(categoryList, id: \.self) { category in
                                Text(category).tag(category)
                            }
                        }
                    } label: {
                        HStack {
                            Text(selectedCategoryName.isEmpty ? "Select Category" : selectedCategoryName)
                                .foregroundColor(selectedCategoryName.isEmpty ? .gray : .primary)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.gray)
                        }
                    }
                    
                    TextField("Add Rebate", text: $newUserRebate)
                        .keyboardType(.numberPad)
                        .padding(.leading)
                    
                    Button(action: addRebate) {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(selectedCategoryName.isEmpty || newUserRebate.isEmpty)
                }
            }
        }
    }

    private func updateRebateValue(for index: Int, with newRebateValue: Int) {
        card.categories[index].rebate = newRebateValue

        // Update the corresponding entry in the categories array
        if let categoryIndex = searchCategoryListNames(name: card.categories[index].categoryName, categoryList: categories),
           let rebateIndex = searchCardID_Rebates(cardID: card.id, cardIDRebates: categories[categoryIndex].cardRebates) {
            categories[categoryIndex].cardRebates[rebateIndex].rebate = newRebateValue
            categories[categoryIndex].cardRebates.sort(by: sorterforCategory)
        }
    }

    private func addRebate() {
        withAnimation {
            newRebate = Int(newUserRebate) ?? 0
            if (searchCategoryListNames(name: selectedCategoryName, categoryList: categories) == nil) {
                let newCategoryRebate = CreditCard.cardID_rebates(cardID: card.id, categoryName: selectedCategoryName, rebate: newRebate)
                card.categories.append(newCategoryRebate)
                category.cardRebates.append(newCategoryRebate)
                category.name = selectedCategoryName
                categories.append(category)
                category = Category.emptyCategory
            } else if (searchCreditCardCategoryNames(categoryName: selectedCategoryName, categories: card.categories) == nil) {
                let newCategoryRebate = CreditCard.cardID_rebates(cardID: card.id, categoryName: selectedCategoryName, rebate: newRebate)
                card.categories.append(newCategoryRebate)
                let indexCategory = searchCategoryListNames(name: selectedCategoryName, categoryList: categories) ?? 0
                categories[indexCategory].cardRebates.append(newCategoryRebate)
                categories[indexCategory].cardRebates.sort(by: sorterforCategory)
            } else {
                let indexCard = searchCreditCardCategoryNames(categoryName: selectedCategoryName, categories: card.categories) ?? 0
                card.categories[indexCard].rebate = newRebate
                let indexCategory = searchCategoryListNames(name: selectedCategoryName, categoryList: categories) ?? 0
                let indexCardID_Rebate = searchCardID_Rebates(cardID: card.id, cardIDRebates: categories[indexCategory].cardRebates) ?? 0
                categories[indexCategory].cardRebates[indexCardID_Rebate].rebate = newRebate
                categories[indexCategory].cardRebates.sort(by: sorterforCategory)
            }
            selectedCategoryName = ""
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
