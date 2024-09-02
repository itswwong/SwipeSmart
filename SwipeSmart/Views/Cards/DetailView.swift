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
                        
                        if let date = category.expirationDate {
                            Text(date, format: .dateTime.day().month().year())
                        } else {
                            Text("None")
                                .foregroundColor(.gray)
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
                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
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
