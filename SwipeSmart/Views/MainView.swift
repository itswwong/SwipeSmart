//
//  MainView.swift
//
//  Defines CreditCard and Category view interface.
//

import SwiftUI

let bodyFont = Font.system(.body, design: .serif, weight: .bold)
let smallFont = Font.system(.caption, design: .serif, weight: .black)
let titleFont = Font.system(.subheadline, design: .serif, weight: .bold)

let pastelGreen = Color(red: 48/255, green: 105/255, blue: 48/255)
let pastelBrown = Color(red: 0.5137, green: 0.4118 , blue: 0.3255)
let darkGray = Color(red: 70/255, green: 70/255, blue: 70/255)

struct MainView: View {
    @Binding var cards: [CreditCard]
    @Binding var categories: [Category]
    let saveAction: ()->Void
    
    var body: some View {
        TabView {
            CategorySelectorView(cards: $cards, categories: $categories)
                .tabItem {
                    Label("Rewards", systemImage: "dollarsign.square.fill")
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
