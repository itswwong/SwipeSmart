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
    
    let customLightGray = Color(red: 0.95, green: 0.95, blue: 0.95)
    let customLightMidGray = Color(red: 0.9, green: 0.9, blue: 0.9)
    let customMidGray = Color(red: 0.8, green: 0.8, blue: 0.8)
    let customDarkGray = Color(red: 0.4, green: 0.4, blue: 0.4)

    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    HStack {
                        Text("BANK NAME")
                            .foregroundColor(Color.gray)
                        Spacer()
                        TextField("", text: $card.bankName)
                            .padding(10)
                            .onChange(of: card.bankName) {
                                validateUniqueDigits()
                            }
                            .overlay(RoundedRectangle(cornerRadius:5).stroke(Color.gray, lineWidth: 1))
                            .foregroundColor(Color("AccentColor"))
                            .frame(width: 200)
                    }
                    .padding(.vertical, 10)
                    HStack {
                        Text("CARD TYPE")
                            .foregroundColor(Color.gray)
                        Spacer()
                        Menu {
                            Picker(selection: $card.cardType, label: Text("")) {
                                ForEach(cardTypeList, id: \.self) { type in
                                    Text(type).tag(type)
                                }
                            }
                        }
                        label: {
                            HStack {
                                Text(card.cardType.isEmpty ? "Select Card Type" : card.cardType)
                                    .foregroundStyle(Color.gray)
                                    .padding(10)
                                Image(systemName: "chevron.down")
                                    .foregroundStyle(Color.gray)
                            }
                            .frame(width: 200, height: 45)
                            .overlay(RoundedRectangle(cornerRadius:5).stroke(customLightGray, lineWidth: 1)
                                .frame(width: 200, height: 45))
                            .background(customLightGray)
                        }
                        .menuStyle(.borderlessButton)
                    }
                    .padding(.vertical, 10)
                    HStack {
                        Text("CARD NAME")
                            .foregroundColor(Color.gray)
                        Spacer()
                        TextField(text: $card.cardName, label: {
                            Text("Optional")
                        })
                        .padding(10)
                        .overlay(RoundedRectangle(cornerRadius:5).stroke(Color.gray, lineWidth: 1))
                        .foregroundColor(Color("AccentColor"))
                        .frame(width: 200)
                    }
                    .padding(.vertical, 10)
                    HStack {
                        Text("LAST 4 DIGITS")
                            .foregroundColor(Color.gray)
                        Spacer()
                        TextField(text: $card.digits, label: {
                            Text("Optional")
                        })
                        .foregroundColor(Color("AccentColor"))
                        
                        .keyboardType(.numberPad)
                        .onReceive(Just($card.digits)) { _ in
                            limitText()
                            validateUniqueDigits()
                        }
                        .foregroundStyle(duplicateError ? .red : .primary)
                        .padding(10)
                        .overlay(RoundedRectangle(cornerRadius:5).stroke(Color.gray, lineWidth: 1))
                        .frame(width: 200)
                    }
                    .padding(.vertical, 10)
                    HStack {
                        Text("BACKGROUND")
                            .foregroundColor(Color.gray)
                        Spacer()
                        ZStack {
                            ColorPicker(selection: $card.theme)
                            HStack {
                                Spacer()
//                                Text("Color")
//                                    .foregroundStyle(Color.gray)
//                                    .padding(10)
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(Color.gray)
                                    .padding(10)
                            }
                        }
                        .frame(width: 217, height: 55)
                        .padding(.trailing, -4)
                    }
                    .padding(.bottom, 20)
                    
                    if duplicateError {
                        Text("Credit card already exists.")
                            .foregroundStyle(.red)
                            .font(.footnote)
                    }
                }
                
                if !card.categories.isEmpty {
                    Section(header:
                                Text("Cash Back Rewards").fontWeight(.bold).font(.system(size: 24))
                        .padding(.bottom, 10)
                    ) {
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
                    Text("ADD NEW CASHBACK REWARD")
                        .padding(.vertical, 15)
                        .padding(.horizontal, 55)
                        .overlay(RoundedRectangle(cornerRadius:5).stroke(Color("tabbar"), lineWidth: 1).fill(.clear))
                        .foregroundColor(Color("tabbar"))
                        .fontWeight(.bold)
                }
                .buttonStyle(.plain)
                .disabled(addNewReward)
                .padding(.vertical, 15)
                
                if addNewReward {
                    NewRewardView(card: $card, categories: $categories)
                        .transition(.move(edge: .top))
                }
                
                if showDelete {
                    Section {
                        Button(action: {
                            showConfirmation = true
                        }) {
                            Text("DELETE CARD")
                                .padding(.vertical, 15)
                                .padding(.horizontal, 125)
                                .fontWeight(.bold)
                                .background(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color("tabbar"), lineWidth: 1)
                                        .fill(Color("tabbar"))
                                )
                                .foregroundColor(.white)
                        }
                        .buttonStyle(.plain)
                        .confirmationDialog("Are you sure?", isPresented: $showConfirmation) {
                            Button("Delete Card", role: .destructive, action: {
                                presentationMode.wrappedValue.dismiss()
                                onDeleteCard()
                            })
                        } message: {
                            Text("You cannot undo this action.")
                        }
                    }
                    .padding(.bottom, 15)
                }
            }
            .padding(.horizontal, 5)
        }
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
        DetailEditView(card: .constant(CreditCard.testCards[0]), cards: .constant(CreditCard.testCards), categories: .constant(Category.sampleCategories), duplicateError: .constant(false), showDelete: true, onDeleteCard: {})
    }
}

