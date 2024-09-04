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
                    .foregroundColor(addNewReward ? .primary : pastelGreen)
            }
            .disabled(addNewReward)
            
            if addNewReward {
                NewRewardView(card: $card, categories: $categories)
                .transition(.move(edge: .top))
            }
        }
        .scrollDismissesKeyboard(.immediately)
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
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(card: .constant(CreditCard.testCards[0]), categories: .constant(Category.sampleCategories))
    }
}
