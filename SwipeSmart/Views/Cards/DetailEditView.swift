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
    @State private var newUserReward = ""
    @State private var newReward: Int = 0

    var body: some View {
        Form {
            Section(header: Text("Card Info")) {
                TextField("Bank Name", text: $card.bankName)
                TextField("Card Name", text: $card.cardName)
            }
            
            Section(header: Text("Rewards")) {
                ForEach(card.categories.indices, id: \.self) { index in
                    HStack {
                        TextField("Category Name", text: $card.categories[index].categoryName)
                            .textFieldStyle(PlainTextFieldStyle())
                        
                        Spacer()
                        
                        TextField("Rewards", text: Binding(
                            get: {
                                String(card.categories[index].reward)
                            },
                            set: { newValue in
                                if let newRewardValue = Int(newValue) {
                                    updateRewardValue(for: index, with: newRewardValue)
                                }
                            }
                        ))
                        .keyboardType(.numberPad)
                        .textFieldStyle(PlainTextFieldStyle())
                    }
                }
                .onDelete(perform: removeReward)
                
                HStack {
                    Menu {
                        Picker("Categories", selection: $selectedCategoryName) {
                            ForEach(categories) { category in
                                Text(category.name).tag(category.name)
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
                    
                    TextField("Add Reward", text: $newUserReward)
                        .keyboardType(.numberPad)
                        .padding(.leading)
                    
                    Button(action: addReward) {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(selectedCategoryName.isEmpty || newUserReward.isEmpty)
                }
            }
        }
    }

    private func updateRewardValue(for index: Int, with newRewardValue: Int) {
        card.categories[index].reward = newRewardValue

        // Update the corresponding entry in the categories array
        if let categoryIndex = searchCategoryListNames(name: card.categories[index].categoryName, categoryList: categories),
           let rewardIndex = searchCardID_Rewards(cardID: card.id, cardIDRewards: categories[categoryIndex].cardRewards) {
            categories[categoryIndex].cardRewards[rewardIndex].reward = newRewardValue
            categories[categoryIndex].cardRewards.sort(by: sorterforCategory)
        }
    }

    private func addReward() {
        withAnimation {
            newReward = Int(newUserReward) ?? 0
            if (searchCategoryListNames(name: selectedCategoryName, categoryList: categories) == nil) {
                let newCategoryReward = CreditCard.cardID_rewards(cardID: card.id, categoryName: selectedCategoryName, reward: newReward)
                card.categories.append(newCategoryReward)
                category.cardRewards.append(newCategoryReward)
                category.name = selectedCategoryName
                categories.append(category)
                category = Category.emptyCategory
            } else if (searchCreditCardCategoryNames(categoryName: selectedCategoryName, categories: card.categories) == nil) {
                let newCategoryReward = CreditCard.cardID_rewards(cardID: card.id, categoryName: selectedCategoryName, reward: newReward)
                card.categories.append(newCategoryReward)
                let indexCategory = searchCategoryListNames(name: selectedCategoryName, categoryList: categories) ?? 0
                categories[indexCategory].cardRewards.append(newCategoryReward)
                categories[indexCategory].cardRewards.sort(by: sorterforCategory)
            } else {
                let indexCard = searchCreditCardCategoryNames(categoryName: selectedCategoryName, categories: card.categories) ?? 0
                card.categories[indexCard].reward = newReward
                let indexCategory = searchCategoryListNames(name: selectedCategoryName, categoryList: categories) ?? 0
                let indexCardID_Reward = searchCardID_Rewards(cardID: card.id, cardIDRewards: categories[indexCategory].cardRewards) ?? 0
                categories[indexCategory].cardRewards[indexCardID_Reward].reward = newReward
                categories[indexCategory].cardRewards.sort(by: sorterforCategory)
            }
            selectedCategoryName = ""
            newUserReward = ""
            newReward = 0
        }
    }

    func removeReward(at indices: IndexSet) {
        guard !indices.isEmpty else { return }
        
        for index in indices {
            let categoryAtIndex = card.categories[index]
            
            if let categoryIndex = searchCategoryListRewardIDs(rewardID: categoryAtIndex.id, categoryList: categories) {
                if categoryIndex < categories.count {
                    categories[categoryIndex].cardRewards.removeAll { $0.id == categoryAtIndex.id }
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
