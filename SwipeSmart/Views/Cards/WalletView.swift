//
//  WalletView.swift
//
//  Displays list of all user cards
//

import SwiftUI

struct WalletView: View {
    @Binding var cards: [CreditCard]
    @Binding var categories: [Category]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewCardView = false
    let saveAction: ()->Void
    
    var body: some View {
        NavigationStack {
            List($cards) { $card in
                NavigationLink(destination: DetailView(card: $card, categories: $categories)) {
                    CardView(card: card)
                }
                .foregroundColor(.white)
                .listRowInsets(.init(top: 30, leading: 10, bottom: 30, trailing: 15))
                .listRowBackground(
                    RoundedRectangle(cornerRadius: 7)
                        .background(.clear)
                        .foregroundColor(.gray)
                        .padding(
                            EdgeInsets(
                                top: 5,
                                leading: 0,
                                bottom: 5,
                                trailing: 0
                            )
                        )
                )
                .listRowSeparator(.hidden)
            }
            .navigationTitle("My Wallet")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button(action: {
                    isPresentingNewCardView = true
                }) {
                    Image(systemName: "plus")
                        .foregroundColor(Color.gray)
                        .padding(
                            EdgeInsets(
                                top: 0,
                                leading: 0,
                                bottom: 0,
                                trailing: 2
                            )
                        )
                }
                .accessibilityLabel("New Card")
            }
        }
        .sheet(isPresented: $isPresentingNewCardView) {
            NewCreditCard(cards: $cards, categories: $categories, isPresentingNewCardView: $isPresentingNewCardView)
        }
        .onChange(of: scenePhase) {
            if scenePhase == .inactive { saveAction() }
        }
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView(cards: .constant(CreditCard.testCards), categories: .constant(Category.sampleCategories), saveAction: {})
    }
}
