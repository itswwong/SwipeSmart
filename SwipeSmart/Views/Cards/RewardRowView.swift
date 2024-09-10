//
//  RewardRowView.swift
//
//  Displays existing rewards in DetailEditView
//

import SwiftUI

struct RewardRowView: View {
    @Binding var card: CreditCard
    @Binding var category: CreditCard.cardID_rewards
    @Binding var categories: [Category]
    
    @State private var newCategoryName: String
    @State private var startDate: Date?
    @State private var expirationDate: Date?
    @State private var dateSet: Bool
    @State private var newReward: String
    
    init(card: Binding<CreditCard>, category: Binding<CreditCard.cardID_rewards>, categories: Binding<[Category]>) {
        self._card = card
        self._category = category
        self._categories = categories
        self._newCategoryName = State(initialValue: category.wrappedValue.categoryName)
        self._startDate = State(initialValue: category.wrappedValue.startDate)
        self._expirationDate = State(initialValue: category.wrappedValue.expirationDate)
        self._dateSet = State(initialValue: category.wrappedValue.startDate != nil)
        self._newReward = State(initialValue: String(category.wrappedValue.reward))
    }
    
    var body: some View {
        VStack {
            HStack {
                Menu {
                    Picker(selection: $newCategoryName, label: Text("")) {
                        ForEach(categories.filter { category in
                            category.name == newCategoryName ||
                            !card.categories.contains { $0.categoryName == category.name } }) { category in
                            Text(category.name).tag(category.name)
                        }
                    }
                    .labelsHidden()
                } label: {
                    HStack {
                        Text(newCategoryName.isEmpty ? "Select Category" : newCategoryName)
                            .foregroundStyle(newCategoryName.isEmpty ? .gray : .primary)
                        Spacer()
                        Image(systemName: "chevron.down")
                            .foregroundStyle(.gray)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .onChange(of: newCategoryName) {
                    updateCategoryName(newCategoryName: newCategoryName)
                }
                
                Spacer()

                TextField("Rewards", text: $newReward)
                    .keyboardType(.decimalPad)
                    .padding(.leading)
                    .textFieldStyle(.roundedBorder)
                    .onChange(of: newReward) {
                        updateRewardValue(for: category, with: newReward)
                    }
                Text("%")
            }
            
            DatePickerField(startDate: $startDate, expirationDate: $expirationDate, dateSet: $dateSet)
                .padding(.top)
                .onChange(of: startDate) {
                    category.updateDate(startDate: startDate, expirationDate: expirationDate, categories: &categories)
                }
                .onChange(of: expirationDate) {
                    category.updateDate(startDate: startDate, expirationDate: expirationDate, categories: &categories)
                }
        }
    }
    
    private func updateRewardValue(for category: CreditCard.cardID_rewards, with newReward: String) {
        if newReward.isEmpty {
            self.category.reward = 0
            
            if let categoryIndex = categories.firstIndex(where: { $0.name == category.categoryName }) {
                
                if let rewardIndex = categories[categoryIndex].cardRewards.firstIndex(where: { $0.id == category.id }) {
                    categories[categoryIndex].cardRewards[rewardIndex].reward = 0
                    
                    categories[categoryIndex].cardRewards.sort(by: sortbyExpirationAndReward)
                }
            }
        }
        if let newRewardValue = Double(newReward) {
            self.category.reward = newRewardValue

            if let categoryIndex = categories.firstIndex(where: { $0.name == category.categoryName }) {
                
                if let rewardIndex = categories[categoryIndex].cardRewards.firstIndex(where: { $0.id == category.id }) {
                    categories[categoryIndex].cardRewards[rewardIndex].reward = newRewardValue
                    
                    categories[categoryIndex].cardRewards.sort(by: sortbyExpirationAndReward)
                }
            }
        }
    }
    
    private func updateCategoryName(newCategoryName: String) {
        if let oldCategoryIndex = categories.firstIndex(where: { $0.name == category.categoryName }) {
            if let oldRewardIndex = categories[oldCategoryIndex].cardRewards.firstIndex(where: { $0.id == category.id }) {
                categories[oldCategoryIndex].cardRewards.remove(at: oldRewardIndex)
            }
        }
        
        if let newCategoryIndex = categories.firstIndex(where: { $0.name == newCategoryName }) {
            if let rewardIndex = categories[newCategoryIndex].cardRewards.firstIndex(where: { $0.id == category.id }) {
                categories[newCategoryIndex].cardRewards[rewardIndex].categoryName = newCategoryName
            } else {
                let newReward = CreditCard.cardID_rewards(
                    id: category.id,
                    cardID: category.cardID,
                    categoryName: newCategoryName,
                    reward: category.reward,
                    expired: category.expired
                )
                categories[newCategoryIndex].cardRewards.append(newReward)
            }
            categories[newCategoryIndex].cardRewards.sort(by: sortbyExpirationAndReward)
        }
        
        if let cardCategoryIndex = card.categories.firstIndex(where: { $0.id == category.id }) {
            card.categories[cardCategoryIndex].categoryName = newCategoryName
        }
        
        category.categoryName = newCategoryName
    }
}

struct RewardRowView_Previews: PreviewProvider {
    static var previews: some View {
        RewardRowView(card: .constant(CreditCard.testCards[0]),category: .constant(CreditCard.testCards[0].categories[0]), categories: .constant(Category.sampleCategories))
    }
}
