//
//  DetailEditView.swift
//
//  Edit credit card info.
//

import SwiftUI
import Combine

struct DetailEditView: View {
    @Binding var card: CreditCard
    @Binding var categories: [Category]
    @State private var addNewReward = false

    var body: some View {
        Form {
            Section(header: Text("Card Info")) {
                TextField("Bank Name *", text: $card.bankName)
                Menu {
                    Picker(selection: $card.cardType, label: Text("")) {
                        ForEach(cardTypeList, id: \.self) { type in
                            Text(type).tag(type)
                        }
                    }
                } label: {
                    HStack {
                        Text(card.cardType.isEmpty ? "Select Card Type *" : card.cardType)
                            .foregroundColor(card.cardType.isEmpty ? .gray : .primary)
                        Spacer()
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                TextField("Card Name", text: $card.cardName)
                TextField("Last Four Digits *", text: $card.digits)
                    .keyboardType(.numberPad)
                    .onReceive(Just($card.digits)) { _ in limitText(4) }
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

    private func removeReward(at indices: IndexSet) {
        for index in indices {
            let reward = card.categories[index]
            if let categoryIndex = categories.firstIndex(where: { $0.name == reward.categoryName }) {
                categories[categoryIndex].cardRewards.removeAll { $0.id == reward.id }
            }
        }
        card.categories.remove(atOffsets: indices)
    }
    
    private func limitText(_ upper: Int) {
        if card.digits.count > upper {
            card.digits = String(card.digits.prefix(upper))
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(card: .constant(CreditCard.testCards[0]), categories: .constant(Category.sampleCategories))
    }
}
