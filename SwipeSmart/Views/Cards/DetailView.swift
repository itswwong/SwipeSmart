//
//  DetailView.swift
//  cardapp
//
//  Displays individual credit card info.
//

import SwiftUI

struct DetailView: View {
    @Binding var card: CreditCard
    @Binding var categories: [Category]
    
    @State private var editingCard = CreditCard.emptyCard
    @State private var editingCategories = [Category]()
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            Section(header: Text("Card Info")) {
                HStack {
                    Label("Bank Name", systemImage: "building.columns.fill")
                    Spacer()
                    Text(card.bankName)
                }
                HStack {
                    Label("Card Name", systemImage: "creditcard.fill")
                    Spacer()
                    Text(card.cardName)
                }
            }
            Section(header: Text("Rewards")) {
                ForEach(card.categories) { category in
                    VStack {
                        HStack {
                            Label(category.categoryName, systemImage: "person")
                            Spacer()
                            Text("\(category.reward) %")
                        }
                        if let startDate = category.startDate {
                            HStack {
                                Text("Start Date:")
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
                                Text("Expiration Date:")
                                Spacer()
                                Text(expirationDate, format: Date.FormatStyle()
                                    .month(.twoDigits)
                                    .day(.twoDigits)
                                    .year(.defaultDigits))
                            }
                            .padding(.top)
                        } else {
                            HStack {
                                Text("Expiration Date:")
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
                DetailEditView(card: $editingCard, categories: $editingCategories)
                    .toolbar {
                        ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                if  card.bankName.isEmpty || card.cardName.isEmpty {
                                    return
                                }
                                isPresentingEditView = false
                                card = editingCard
                                categories = editingCategories
                            }
                        }
                    }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(card: .constant(CreditCard.testCards[0]), categories: .constant(Category.sampleCategories))
        }
    }
}
