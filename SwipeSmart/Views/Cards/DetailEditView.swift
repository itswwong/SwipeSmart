//
//  DetailEditView.swift
//
//  Edit credit card info.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var card: CreditCard
    @Binding var categories: [Category]
    @State private var addNewReward = false

    var body: some View {
        Form {
            Section(header: Text("Card Info *")) {
                TextField("Bank Name", text: $card.bankName)
                TextField("Card Name", text: $card.cardName)
            }
            
            Section(header: Text("Rewards")) {
                ForEach(card.categories.indices, id: \.self) { index in
                    RewardRowView(category: $card.categories[index], categories: $categories)
                }
                .onDelete(perform: removeReward)
            }
            
            Button(action: {
                withAnimation {
                    addNewReward = true
                }
            }) {
                Text("Add New Reward")
                    .foregroundColor(addNewReward ? .primary : .blue)
            }
            .disabled(addNewReward)
            
            if addNewReward {
                NewRewardView(card: $card, categories: $categories)
                .transition(.move(edge: .top))
            }
        }
    }

    func removeReward(at indices: IndexSet) {
        for index in indices {
            let reward = card.categories[index]
            if let categoryIndex = categories.firstIndex(where: { $0.name == reward.categoryName }) {
                categories[categoryIndex].cardRewards.removeAll { $0.id == reward.id }
            }
        }
        card.categories.remove(atOffsets: indices)
    }
    
    private func updateCategoryName(for index: Int, newCategoryName: String) {
        // Remove the reward from the old category
        if let oldCategoryIndex = categories.firstIndex(where: { $0.name == card.categories[index].categoryName }) {
            categories[oldCategoryIndex].cardRewards.removeAll { $0.id == card.categories[index].id }
        }
        
        card.categories[index].categoryName = newCategoryName
        
        // Update the global categories list to reflect this change
        if let categoryIndex = categories.firstIndex(where: { $0.name == newCategoryName }) {
            if let rewardIndex = categories[categoryIndex].cardRewards.firstIndex(where: { $0.id == card.categories[index].id }) {
                categories[categoryIndex].cardRewards[rewardIndex].categoryName = newCategoryName
            } else {
                let newReward = CreditCard.cardID_rewards(
                    id: card.categories[index].id,
                    cardID: card.id,
                    categoryName: newCategoryName,
                    reward: card.categories[index].reward
                )
                categories[categoryIndex].cardRewards.append(newReward)
            }
            
            categories[categoryIndex].cardRewards.sort(by: sorterforCategory)
        }
    }

}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(card: .constant(CreditCard.testCards[0]), categories: .constant(Category.sampleCategories))
    }
}
