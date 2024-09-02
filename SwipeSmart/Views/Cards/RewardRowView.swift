//
//  RewardRowView.swift
//

import SwiftUI

struct RewardRowView: View {
    @Binding var category: CreditCard.cardID_rewards
    @Binding var categories: [Category]
    @State private var newCategoryName: String
    @State private var expirationDate: Date?
    @State private var dateSet: Bool
    
    init(category: Binding<CreditCard.cardID_rewards>, categories: Binding<[Category]>) {
        self._category = category
        self._categories = categories
        self._newCategoryName = State(initialValue: category.wrappedValue.categoryName)
        self._expirationDate = State(initialValue: category.wrappedValue.expirationDate)
        self._dateSet = State(initialValue: category.wrappedValue.expirationDate != nil)
    }
    
    var body: some View {
        VStack {
            HStack {
                Menu {
                    Picker(selection: $newCategoryName, label: Text("")) {
                        ForEach(categories) { category in
                            Text(category.name).tag(category.name)
                        }
                    }
                } label: {
                    HStack {
                        Text(newCategoryName.isEmpty ? "Select Category" : newCategoryName)
                            .foregroundColor(newCategoryName.isEmpty ? .gray : .primary)
                        Spacer()
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .onChange(of: newCategoryName) {
                    updateCategoryName(newCategoryName: newCategoryName)
                }
                
                Spacer()
                
                TextField("Rewards", text: Binding(
                    get: {
                        String(category.reward)
                    },
                    set: { newValue in
                        if let newRewardValue = Int(newValue) {
                            updateRewardValue(for: category, with: newRewardValue)
                        }
                    }
                ))
                .keyboardType(.numberPad)
                .padding(.leading)
            }
            
            DatePickerField(date: $category.expirationDate, dateSet: $dateSet)
                .padding(.top)
        }
    }
    
    private func updateRewardValue(for category: CreditCard.cardID_rewards, with newRewardValue: Int) {
        // Update the reward value in the card's categories
        self.category.reward = newRewardValue
        
        // Find the matching category and reward in the global categories list
        if let categoryIndex = categories.firstIndex(where: { $0.name == category.categoryName }) {
            
            if let rewardIndex = categories[categoryIndex].cardRewards.firstIndex(where: { $0.id == category.id }) {
                
                categories[categoryIndex].cardRewards[rewardIndex].reward = newRewardValue
                
                categories[categoryIndex].cardRewards.sort(by: sorterforCategory)
            }
        }
    }
    
    private func updateCategoryName(newCategoryName: String) {
        // Remove the reward from the old category
        if let oldCategoryIndex = categories.firstIndex(where: { $0.name == category.categoryName }) {
            categories[oldCategoryIndex].cardRewards.removeAll { $0.id == category.id }
        }
        
        category.categoryName = newCategoryName
        
        // Update the global categories list to reflect this change
        if let categoryIndex = categories.firstIndex(where: { $0.name == newCategoryName }) {
            if let rewardIndex = categories[categoryIndex].cardRewards.firstIndex(where: { $0.id == category.id }) {
                categories[categoryIndex].cardRewards[rewardIndex].categoryName = newCategoryName
            } else {
                let newReward = CreditCard.cardID_rewards(
                    id: category.id,
                    cardID: category.cardID,
                    categoryName: newCategoryName,
                    reward: category.reward
                )
                categories[categoryIndex].cardRewards.append(newReward)
            }
            
            categories[categoryIndex].cardRewards.sort(by: sorterforCategory)
        }
    }
}

struct RewardRowView_Previews: PreviewProvider {
    static var previews: some View {
        RewardRowView(category: .constant(CreditCard.testCards[0].categories[0]), categories: .constant(Category.sampleCategories))
    }
}
