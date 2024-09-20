//
//  DetailEditView.swift
//
//  Edit credit card info.
//

import SwiftUI
import Combine

struct DetailEditView: View {
    @Binding var card: CreditCard
    @Binding var cards: [CreditCard]
    @Binding var categories: [Category]
    @Binding var duplicateError: Bool
    
    @State private var addNewReward = false
    @State private var showConfirmation = false
    
    var showDelete: Bool
    let onDeleteCard: () -> Void
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Form {
            Section(header: Text("Card Info")) {
                LabeledContent {
                    TextField("", text: $card.bankName)
                        .multilineTextAlignment(.trailing)
                        .onChange(of: card.bankName) {
                            validateUniqueDigits()
                        }
                } label: {
                    Text("Bank Name")
                }
                LabeledContent {
                    Menu {
                        Picker(selection: $card.cardType, label: Text("")) {
                            ForEach(cardTypeList, id: \.self) { type in
                                Text(type).tag(type)
                            }
                        }
                    } label: {
                        HStack {
                            Text(card.cardType.isEmpty ? "Select Card Type" : card.cardType)
                                .foregroundStyle(card.cardType.isEmpty ? .gray : .primary)
                            Image(systemName: "chevron.down")
                                .foregroundStyle(.gray)
                        }
                        .padding(.trailing, -12)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                } label: {
                    Text("Card Type")
                }
                
                LabeledContent {
                    TextField(text: $card.cardName, label: {
                        Text("optional")
                            .multilineTextAlignment(.trailing)
                    })
                        .multilineTextAlignment(.trailing)
                } label: {
                    Text("Card Name")
                }
                
                LabeledContent {
                    TextField(text: $card.digits, label: {
                        Text("optional")
                            .multilineTextAlignment(.trailing)
                    })
                        .keyboardType(.numberPad)
                        .onReceive(Just($card.digits)) { _ in
                            limitText()
                            validateUniqueDigits()
                        }
                        .multilineTextAlignment(.trailing)
                        .foregroundStyle(duplicateError ? .red : .primary)
                } label: {
                    Text("Last 4 Digits")
                }
                
                LabeledContent {
                    ColorPicker(selection: $card.theme)
                        .frame(width: 100)
                        .padding(.trailing, -12)
                } label: {
                    Text("Background Color")
                }
                
                if duplicateError {
                    Text("Credit card already exists.")
                        .foregroundStyle(.red)
                        .font(.footnote)
                }
            }
            
            if !card.categories.isEmpty {
                Section(header: Text("Cash Back Rewards")) {
                    ForEach(card.categories.indices, id: \.self) { index in
                        RewardRowView(card: $card, category: $card.categories[index], categories: $categories)
                    }
                    .onDelete(perform: removeReward)
                }
            }
            
            Button(action: {
                withAnimation {
                    addNewReward = true
                }
            }) {
                Text("Add New Cash Back Reward")
                    .foregroundStyle(addNewReward ? .gray : .blue)
            }
            .disabled(addNewReward)
            
            if addNewReward {
                NewRewardView(card: $card, categories: $categories)
                .transition(.move(edge: .top))
            }
            
            if showDelete {
                Section {
                    Button(action: {
                        showConfirmation = true
                    }) {
                        Text("Delete Card")
                            .foregroundStyle(.red)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .confirmationDialog("Are you sure?", isPresented: $showConfirmation) {
                        Button("Delete Card", role: .destructive, action: {
                            presentationMode.wrappedValue.dismiss()  // Dismiss the view
                            onDeleteCard()  // Trigger card deletion
                        })
                    } message: {
                        Text("You cannot undo this action.")
                    }
                }
            }
        }
        .scrollDismissesKeyboard(.immediately)
    }

    private func validateUniqueDigits() {
        if card.digits.isEmpty {
            duplicateError = false
        }
        else {
            // Check for duplicate digits within the same bank
            let hasDuplicate = cards.contains(where: { $0.bankName == card.bankName && $0.cardType == card.cardType && $0.digits == card.digits && $0.id != card.id })
            
            duplicateError = hasDuplicate
        }
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
    
    private func limitText() {
        if card.digits.count > 4 {
            card.digits = String(card.digits.prefix(4))
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(card: .constant(CreditCard.sampleCards[0]), cards: .constant(CreditCard.sampleCards), categories: .constant(Category.sampleCategories), duplicateError: .constant(false), showDelete: true, onDeleteCard: {})
    }
}
