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
            ScrollView {
                VStack (spacing: CGFloat(s)) {
                    ForEach($cards) { $card in
                        NavigationLink(destination: DetailView(card: $card, cards: $cards, categories: $categories)) {
                            CardView(card: card, strokeColor: card.theme.accentColor)
                                .padding(20)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundStyle(card.theme.mainColor)
                                .overlay(
                                    // border
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(
                                            card.theme.accentColor
                                        )
                                )
                                .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                        )
                        .onTapGesture {
                            withAnimation {
                                isSelected.toggle()
                                if isSelected {
                                    s = 20
                                } else {
                                    s = -50
                                }
                            }
                        }
                    }
                    .padding()
                }
                .padding(.top, -30)
                .toolbar {
                    ToolbarItem (placement: .principal) {
                        Text("Credit Cards")
                            .font(.title3 .weight(.semibold))
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
                .navigationBarTitleDisplayMode(.inline)
            }
            .sheet(isPresented: $isPresentingNewCardView) {
                NewCreditCard(cards: $cards, categories: $categories, isPresentingNewCardView: $isPresentingNewCardView)
            }
            .onChange(of: scenePhase) {
                if scenePhase == .inactive { saveAction() }
            }
        }
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView(cards: .constant(CreditCard.testCards), categories: .constant(Category.sampleCategories), saveAction: {})
    }
}
