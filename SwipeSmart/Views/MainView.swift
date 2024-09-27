//
//  MainView.swift
//
//  Defines CreditCard and Category view interface.
//

//
//  MainView.swift
//
//  Defines CreditCard and Category view interface.
//

import SwiftUI

struct MainView: View {
    @Binding var cards: [CreditCard]
    @Binding var categories: [Category]
    
    let saveAction: () -> Void
    
    @StateObject private var dayChangeObserver: DayChangeObserver

    init(cards: Binding<[CreditCard]>, categories: Binding<[Category]>, saveAction: @escaping () -> Void) {
        self._cards = cards
        self._categories = categories
        self.saveAction = saveAction
        _dayChangeObserver = StateObject(wrappedValue: DayChangeObserver(cards: cards, categories: categories))
    }

    var body: some View {
        TabView {
            CategorySelectorView(cards: $cards, categories: $categories)
                .tabItem {
                    Label("Cash Back Rewards", systemImage: "dollarsign.square.fill")
                }
                .tag(1)

            WalletView(cards: $cards, categories: $categories, saveAction: saveAction)
                .tabItem {
                    Label("Credit Cards", systemImage: "wallet.pass.fill")
                }
                .tag(2)
        }
        .onAppear {
            dayChangeObserver.updateAllRewards()
        }
    }
}

class DayChangeObserver: ObservableObject {
    @Binding var cards: [CreditCard]
    @Binding var categories: [Category]
    
    init(cards: Binding<[CreditCard]>, categories: Binding<[Category]>) {
        self._cards = cards
        self._categories = categories
        NotificationCenter.default.addObserver(self, selector: #selector(dayDidChange), name: .NSCalendarDayChanged, object: nil)
    }

    @objc private func dayDidChange() {
        updateAllRewards()
    }

    func updateAllRewards() {
        for cardIndex in cards.indices {
            for categoryIndex in cards[cardIndex].categories.indices {
                cards[cardIndex].categories[categoryIndex].updateFlags()
            }
        }

        for categoryIndex in categories.indices {
            for rewardIndex in categories[categoryIndex].cardRewards.indices {
                categories[categoryIndex].cardRewards[rewardIndex].updateFlags()
            }
            categories[categoryIndex].cardRewards.sort(by: sortbyExpirationAndReward)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(cards: .constant(CreditCard.testCards), categories: .constant(Category.sampleCategories), saveAction: {})
    }
}
