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
                                                guidance: "cardApp will load sample data and continue.")
                }
            }
            .sheet(item: $errorWrapper) {
                storeCards.cards = CreditCard.testCards
                storeCategories.categories = Category.sampleCategories
            } content: { wrapper in
                ErrorView(errorWrapper: wrapper)
            }
        }
    }
}
