//
//  DetailView.swift
//  cardapp
//
//  Displays individual credit card info.
//

import SwiftUI

struct DetailView: View {
    @Binding var card: CreditCard
    @Binding var cards: [CreditCard]
    @Binding var categories: [Category]
    
    @State private var editingCard = CreditCard.emptyCard
    @State private var editingCategories = [Category]()
    @State private var isPresentingEditView = false
    @State private var duplicateError = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Card Info")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fontWeight(.bold)
                    .font(.system(size: 24))
                    .padding(.top, 30)
                Divider()
                    .frame(height: 1)
                    .background(Color.gray)
                    .padding(.bottom)
                HStack {
                    Text("BANK NAME")
                        .foregroundColor(Color.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 16))
                    Spacer()
                    Text(card.bankName)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 16))
                }
                .padding(.vertical, 10)
                HStack {
                    Text("CARD TYPE")
                        .foregroundColor(Color.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 16))
                    Spacer()
                    Text(card.cardType)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 16))
                }
                .padding(.vertical, 10)
                HStack {
                    Text("CARD NAME")
                        .foregroundColor(Color.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 16))
                    Spacer()
                    Text(card.cardName)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 16))
                }
                .padding(.vertical, 10)
                HStack {
                    Text("LAST 4 DIGITS")
                        .foregroundColor(Color.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 16))
                    Spacer()
                    Text(card.digits)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 16))
                }
                .padding(.vertical, 10)
                HStack {
                    Text("BACKGROUND")
                        .foregroundColor(Color.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 16))
                    Spacer()
                    ColorView(color: card.theme)
                        .frame(alignment: .leading)
                }
                .padding(.vertical, 10)
                
                Spacer()
                
                Text("Cash Back Rewards")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fontWeight(.bold)
                    .font(.system(size: 24))
                    .padding(.top)
                Divider()
                    .frame(height: 1)
                    .background(Color.gray)
                    .padding(.bottom)
                
                ForEach(card.categories) { category in
                    VStack {
                        HStack {
                            Text("\(category.categoryName)")
                                .fontWeight(.bold)
                                .font(.system(size: 18))
                            Spacer()
                            Text(category.reward == floor(category.reward) ? "\(Int(category.reward))%" : String(format: "%.1f%%", category.reward))
                                .fontWeight(.bold)
                                .font(.system(size: 18))
                            
                        }
                        .padding(.bottom, 5)
                        if let startDate = category.startDate {
                            HStack {
                                Text("START")
                                    .foregroundColor(Color.gray)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.system(size: 16))
                                Spacer()
                                Text(startDate, format: Date.FormatStyle()
                                    .month(.abbreviated)
                                    .year(.defaultDigits))
                                .foregroundColor(Color.gray)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .font(.system(size: 16))
                            }
                            .padding(.top, 5)
                        }
                        if let expirationDate = category.expirationDate {
                            HStack {
                                Text("EXPIRY")
                                    .foregroundColor(Color.gray)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.system(size: 16))
                                Spacer()
                                Text(expirationDate, format: Date.FormatStyle()
                                    .month(.abbreviated)
                                    .year(.defaultDigits))
                                .foregroundColor(Color.gray)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .font(.system(size: 16))
                            }
                            .padding(.top, 5)
                        } else {
                            HStack {
                                Text("EXPIRY")
                                    .foregroundColor(Color.gray)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.system(size: 16))
                                Spacer()
                                Text("None")
                                    .foregroundColor(Color.gray)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .font(.system(size: 16))
                            }
                            .padding(.top, 5)
                        }
                    }
                    .padding(.bottom, 30)
                }
                
                Spacer()
            }
            .padding(.horizontal, 30)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.backward")
                        .bold()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isPresentingEditView = true
                    editingCard = card
                    editingCategories = categories
                }) {
                    Image(systemName: "square.and.pencil")
                        .bold()
                }
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationStack {
                ScrollView {
                    VStack {
                        Text("Edit Card")
                            .fontWeight(.bold)
                            .font(.system(size: 24))
                        DetailEditView(card: $editingCard, cards: $cards, categories: $editingCategories, duplicateError: $duplicateError, showDelete: true, onDeleteCard: { deleteCard() })
                            .padding(.horizontal, 10)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: ToolbarItemPlacement.cancellationAction) {
                        Button(action: {
                            isPresentingEditView = false
                        }) {
                            Image(systemName: "xmark")
                                .tint(Color("AccentColor"))
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            isPresentingEditView = false
                            duplicateError = false
                            categories = editingCategories
                            card = editingCard
                        }
                        .disabled(editingCard.bankName.isEmpty || editingCard.cardType.isEmpty || duplicateError)
                        .tint(editingCard.bankName.isEmpty || editingCard.cardType.isEmpty || duplicateError ? .gray : Color("AccentColor"))
                    }
                }
            }
            .padding(15)
        }
    }
    
    private func deleteCard() {
        // Remove the card from the list of cards
        if let index = cards.firstIndex(where: { $0.id == card.id }) {
            // Remove all rewards associated with this card from the categories
            for categoryIndex in categories.indices {
                if let rewardIndex = categories[categoryIndex].cardRewards.firstIndex(where: { $0.cardID == card.id }) {
                    categories[categoryIndex].cardRewards.remove(at: rewardIndex)
                }
            }
            
            cards.remove(at: index)
        }
        
        // Dismiss the view to return to WalletView
        presentationMode.wrappedValue.dismiss()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(card: .constant(CreditCard.testCards[2]), cards: .constant(CreditCard.testCards), categories: .constant(Category.sampleCategories))
        }
    }
}
