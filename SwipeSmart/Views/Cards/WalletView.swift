//
//  WalletView.swift
//
//  Displays list of all user credit cards.
//

import SwiftUI

struct WalletView: View {
    @Binding var cards: [CreditCard]
    @Binding var categories: [Category]
    
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewCardView = false
    @State private var s = -50
    @State private var isSelected = false

    
    let saveAction: ()->Void
    
    var body: some View {
        NavigationStack {
            VStack (spacing: CGFloat(s)) {
                ForEach($cards) { $card in
                    NavigationLink(destination: DetailView(card: $card, cards: $cards, categories: $categories)) {
                        CardView(card: card)
                            .padding(20)
                    }
                    .background(
                       RoundedRectangle(cornerRadius: 15)
                           .foregroundStyle(card.theme.mainColor)
                   )
                }
                .padding()
            }
//            List($cards) { $card in
//                NavigationLink(destination: DetailView(card: $card, cards: $cards, categories: $categories)) {
//                    CardView(card: card)
//                }
//                .listRowInsets(.init(top: 30, leading: 10, bottom: 30, trailing: 15))
//                .listRowBackground(
//                    RoundedRectangle(cornerRadius: 15)
//                        .background(.clear)
//                        .foregroundStyle(card.theme.mainColor)
//                        .padding(
//                            EdgeInsets(
//                                top: 5,
//                                leading: 0,
//                                bottom: 5,
//                                trailing: 0
//                            )
//                        )
//                )
//                .listRowSeparator(.hidden)
//            }
            .toolbar {
                ToolbarItem (placement: .topBarLeading) {
                    Text("Credit Cards")
                        .font(.largeTitle .weight(.bold))
                }
                ToolbarItem (placement: .topBarTrailing) {
                    Button(action: {
                        isPresentingNewCardView = true
                    }) {
                        Image(systemName: "plus")
                            .bold()
                    }
                    .accessibilityLabel("New Card")
                }
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
