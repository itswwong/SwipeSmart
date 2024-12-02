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
        VStack {
            Text("Card Info")
                .frame(maxWidth: .infinity, alignment: .leading)
                .fontWeight(.bold)
                .font(.system(size: 24))
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
                ZStack {
                    ColorView(color: card.theme)
                    Text("Color")
                        .font(.system(size: 16))
                }
                .frame(maxWidth: .infinity, maxHeight: 40, alignment: .leading)
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
                            .font(.system(size: 16))
                        Spacer()
                        Text(category.reward == floor(category.reward) ? "\(Int(category.reward))%" : String(format: "%.1f%%", category.reward))
                            .fontWeight(.bold)
                            .font(.system(size: 16))
                    }
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
                .padding([.top, .bottom])
            }
            
            Spacer()
            
            HStack(spacing: 0) {
                Button(action: {}) {
                    HStack {
                        Image(systemName: "dollarsign.circle")
                            .foregroundColor(.black)
                        Text("REWARDS")
                            .foregroundColor(.black)
                            .font(.system(size: 14))
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(.systemGray5))
                    .cornerRadius(10)
                }
                
                Button(action: {}) {
                    HStack {
                        Image(systemName: "creditcard")
                            .foregroundColor(.white)
                        Text("CARDS")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(.darkGray))
                    .cornerRadius(10)
                }
            }
            .frame(height: 50)
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 15)
        .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
            Button(action: {
                editingCard = card
                editingCategories = categories
            }) {
                    Image(systemName: "arrow.left")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isPresentingEditView = true
                    editingCard = card
                    editingCategories = categories
                }) {
                    Image(systemName: "square.and.pencil")
                }
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationStack {
                DetailEditView(card: $editingCard, cards: $cards, categories: $editingCategories, duplicateError: $duplicateError, showDelete: true, onDeleteCard: { deleteCard() })
                    .toolbar {
                        ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                            .tint(.blue)
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                duplicateError = false
                                categories = editingCategories
                                card = editingCard
                            }
                            .disabled(editingCard.bankName.isEmpty || editingCard.cardType.isEmpty || duplicateError)
                            .tint(editingCard.bankName.isEmpty || editingCard.cardType.isEmpty || duplicateError ? .gray : .blue)
                        }
                    }
            }
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
