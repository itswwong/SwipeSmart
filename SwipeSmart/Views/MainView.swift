//
//  MainView.swift
//
//  Defines CreditCard and Category view interface.
//

import SwiftUI

struct MainView: View {
    @Binding var cards: [CreditCard]
    @Binding var categories: [Category]
    
    let saveAction: ()->Void
    
    var body: some View {
        TabView {
            CategorySelectorView(cards: $cards, categories: $categories)
                .tabItem {
                    Label("Cash Back", systemImage: "dollarsign.square.fill")
                }
                .tag(1)

            WalletView(cards: $cards, categories: $categories, saveAction: saveAction)
                .tabItem {
                    Label("Wallet", systemImage: "wallet.pass.fill")
                }
                .tag(2)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(cards: .constant(CreditCard.testCards), categories: .constant(Category.sampleCategories), saveAction: {})
    }
}
