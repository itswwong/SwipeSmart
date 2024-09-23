//
//  SwipeSmart
//
//  An IOS app that manages credit card cash back rewards and helps users select
//  the best credit card to use for different kinds of purchases.
//

import SwiftUI

@main
struct SwipeSmartApp: App {
    @StateObject private var storeCards = CardStore()
    @StateObject private var storeCategories = CategoryStore()
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some Scene {
        WindowGroup {
            MainView(cards: $storeCards.cards, categories: $storeCategories.categories) {
                Task {
                    do {
                        try await storeCards.save(cards: storeCards.cards)
                        try await storeCategories.save(categories: storeCategories.categories)
                    } catch {
                        errorWrapper = ErrorWrapper(error: error,
                                                    guidance: "Try again later.")
                    }
                }
            }
            .task {
                do {
                    try await storeCards.load()
                    try await storeCategories.load()
                } catch {
                    errorWrapper = ErrorWrapper(error: error,
                                                guidance: "Swipe-Smart will load empty data and continue.")
                }
            }
            .sheet(item: $errorWrapper) {
                storeCards.cards = []
                storeCategories.categories = [
                    Category(name: "Travel", cardRewards: []),
                    Category(name: "Dining", cardRewards: []),
                    Category(name: "Groceries", cardRewards: []),
                    Category(name: "Gas", cardRewards: []),
                    Category(name: "Entertainment", cardRewards: []),
                    Category(name: "Shopping", cardRewards: []),
                    Category(name: "Everything Else", cardRewards: [])
                ]
            } content: { wrapper in
                ErrorView(errorWrapper: wrapper)
            }
        }
    }
}
