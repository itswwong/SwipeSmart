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
        List {
            Section(header: Text("Card Info")) {
                HStack {
                    Text("Bank Name")
                    Spacer()
                    Text(card.bankName)
                }
                HStack {
                    Text("Card Type")
                    Spacer()
                    Text(card.cardType)
                }
                HStack {
                    Text("Card Name")
                    Spacer()
                    Text(card.cardName)
                }
                HStack {
                    Text("Last 4 Digits")
                    Spacer()
                    Text(card.digits)
                }
                HStack {
                    Text("Background Color")
                    Spacer()
                    ColorView(color: card.theme)
                        .frame(width: 100)
                }
                .accessibilityElement(children: .combine)
            }
            Section(header: Text("Rewards")) {
                ForEach(card.categories) { category in
                    VStack {
                        HStack {
                            Text("\(category.categoryName)")
                            Spacer()
                            Text("\(category.reward) %")
                        }
                        if let startDate = category.startDate {
                            HStack {
                                Text("Start Date")
                                Spacer()
                                Text(startDate, format: Date.FormatStyle()
                                    .month(.twoDigits)
                                    .day(.twoDigits)
                                    .year(.defaultDigits))
                            }
                            .padding(.top)
                        }
                        if let expirationDate = category.expirationDate {
                            HStack {
                                Text("Expiration Date")
                                Spacer()
                                Text(expirationDate, format: Date.FormatStyle()
                                    .month(.twoDigits)
                                    .day(.twoDigits)
                                    .year(.defaultDigits))
                            }
                            .padding(.top)
                        } else {
                            HStack {
                                Text("Expiration Date")
                                Spacer()
                                Text("None")
                            }
                            .padding(.top)
                        }
                    }
                    .padding([.top, .bottom])
                }
            }
        }
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                editingCard = card
                editingCategories = categories
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
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                duplicateError = false
                                categories = editingCategories
                                card = editingCard
                            }
                            .disabled(editingCard.bankName.isEmpty || editingCard.cardType.isEmpty || editingCard.digits.isEmpty || duplicateError)
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
            DetailView(card: .constant(CreditCard.testCards[0]), cards: .constant(CreditCard.testCards), categories: .constant(Category.sampleCategories))
        }
    }
}
