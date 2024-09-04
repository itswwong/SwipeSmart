//
//  NewRewardView.swift
//
//  Displays new reward input fields in DetailEditView
//

import SwiftUI

struct NewRewardView: View {
    @Binding var card: CreditCard
    @Binding var categories: [Category]
    @State private var selectedCategoryName = ""
    @State private var newUserReward = ""
    @State private var newReward: Int = 0
    @State private var startDate: Date? = nil
    @State private var expirationDate: Date? = nil
    @State private var ifExpired: Bool = false
    @State private var addNewReward = false
    @State private var dateSet: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    HStack {
                        Menu {
                            Picker(selection: $selectedCategoryName, label: Text("")) {
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
                            .padding(.leading)
                            .textFieldStyle(.roundedBorder)
                        Text("%")
                    }
                    
                    DatePickerField(startDate: $startDate ,expirationDate: $expirationDate, dateSet: $dateSet)
                        .padding(.top)
                }
                .padding(.trailing)
            }
            .padding([.top, .bottom], 5)
            
            HStack {
                Spacer()
                Button(action: addReward) {
                    Text("Done")
                }
                .disabled(selectedCategoryName.isEmpty || newUserReward.isEmpty)
                .buttonStyle(.borderless)
                Spacer()
            }
        }
    }
    
    private func addReward() {
        withAnimation {
            newReward = Int(newUserReward) ?? 0
            
            let newCategoryReward: CreditCard.cardID_rewards

            if dateSet {
                let currentDate = Date()
                if let date = expirationDate {
                    ifExpired = date < currentDate
                } else {
                    ifExpired = false
                }
                
                newCategoryReward = CreditCard.cardID_rewards(cardID: card.id, categoryName: selectedCategoryName, reward: newReward, startDate: startDate, expirationDate: expirationDate, expired: ifExpired)
            } else {
                newCategoryReward = CreditCard.cardID_rewards(cardID: card.id, categoryName: selectedCategoryName, reward: newReward, expired: false)
            }
            
            if let categoryIndex = categories.firstIndex(where: { $0.name == selectedCategoryName }) {
                if let existingRewardIndex = card.categories.firstIndex(where: { $0.categoryName == selectedCategoryName }) {
                    // Update the existing reward
                    card.categories[existingRewardIndex].reward = newReward
                    card.categories[existingRewardIndex].expirationDate = dateSet ? expirationDate : nil
                    card.categories[existingRewardIndex].startDate = dateSet ? startDate : nil
                    card.categories[existingRewardIndex].expired = ifExpired
                    
                    if let rewardInCategoryIndex = categories[categoryIndex].cardRewards.firstIndex(where: { $0.id == card.categories[existingRewardIndex].id }) {
                        categories[categoryIndex].cardRewards[rewardInCategoryIndex].reward = newReward
                        categories[categoryIndex].cardRewards[rewardInCategoryIndex].expirationDate = dateSet ? expirationDate : nil
                        categories[categoryIndex].cardRewards[rewardInCategoryIndex].startDate = dateSet ? startDate : nil
                        categories[categoryIndex].cardRewards[rewardInCategoryIndex].expired = ifExpired
                    }
                } else {
                    // Category exists, but not in credit card
                    card.categories.append(newCategoryReward)
                    categories[categoryIndex].cardRewards.append(newCategoryReward)
                }
                categories[categoryIndex].cardRewards.sort(by: sortbyExpirationAndReward)
            } else {
                // New category
                card.categories.append(newCategoryReward)
                let newCategory = Category(name: selectedCategoryName, cardRewards: [newCategoryReward])
                categories.append(newCategory)
            }
            
            // Reset fields
            selectedCategoryName = ""
            newUserReward = ""
            newReward = 0
            expirationDate = nil
            startDate = nil
            dateSet = false
            addNewReward = false
            ifExpired = false
        }
    }
}

struct NewRewardView_Previews: PreviewProvider {
    static var previews: some View {
        NewRewardView(card: .constant(CreditCard.sampleCards[0]), categories: .constant(Category.sampleCategories))
    }
}
