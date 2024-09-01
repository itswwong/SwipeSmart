//
//  MainView.swift
//
//  Defines CreditCard and Category view interface.
//

import SwiftUI

let bodyFont = Font.system(.body, design: .serif, weight: .bold)
let smallFont = Font.system(.caption, design: .serif, weight: .black)
let titleFont = Font.system(.subheadline, design: .serif, weight: .bold)

struct MainView: View {
    @Binding var cards: [CreditCard]
    @Binding var categories: [Category]
    let saveAction: ()->Void
    
    var body: some View {
        TabView {
            CategorySelectorView(cards: $cards, categories: $categories)
                .tabItem {
                    Label("Shopping", systemImage: "cart.fill")
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
