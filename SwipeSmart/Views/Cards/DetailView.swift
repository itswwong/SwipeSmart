//
//  DetailView.swift
//  cardapp
//
//  Displays card info
//

import SwiftUI

struct DetailView: View {
    @Binding var card: CreditCard
    @Binding var categories: [Category]
    
    @State private var editingCard = CreditCard.emptyCard
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            Section(header: Text("Card Info")) {
                HStack {
                    Label("Bank Name", systemImage: "building.columns.fill")
                        .font(bodyFont)
                    Spacer()
                    Text(card.bankName)
//                        .font(bodyFont)
                }
                HStack {
                    Label("Card Name", systemImage: "creditcard.fill")
                        .font(bodyFont)
                    Spacer()
                    Text(card.cardName)
//                        .font(bodyFont)
                }
            }
            Section(header: Text("Rebates")) {
                ForEach(card.categories) { category in
                    HStack {
                        Label(category.categoryName, systemImage: "person")
                            .font(bodyFont)
                        Spacer()
                        Text("\(category.rebate) %")
                    }
                }
            }
        }
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                editingCard = card
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationStack {
                DetailEditView(card: $editingCard, categories: $categories)
                    .toolbar {
                        ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                card = editingCard
                            }
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
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
