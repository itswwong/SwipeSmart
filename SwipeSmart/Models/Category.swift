//
//  Category.swift
//
//  Data template for each Category object.
//
//  Categories: [Travel, Dining, Groceries, Gas, Entertainment, Shopping, Other]
//

import Foundation

struct Category: Identifiable, Codable {
    let id: UUID
    var name: String
    var cardRewards = [CreditCard.cardID_rewards]()
    var backgroundColor: String = "Teal" // Default color is Teal

    init(id: UUID = UUID(), name: String, backgroundColor: String = "Teal") {
        self.id = id
        self.name = name
        self.backgroundColor = backgroundColor
    }
    
    init(id: UUID = UUID(), name: String, cardRewards: [CreditCard.cardID_rewards], backgroundColor: String = "Teal") {
        self.id = id
        self.name = name
        self.cardRewards = cardRewards
        self.backgroundColor = backgroundColor
    }
}
    
extension Category {
    static var emptyCategory: Category {
        Category(name: "", cardRewards: [])
    }
}

extension Category {
    static let sampleCategories: [Category] =
    [
        Category(name: "Groceries", cardRewards: CreditCard.sampleCardRewardsGroceries),
        Category(name: "Travel", cardRewards: []),
        Category(name: "Dining", cardRewards: CreditCard.sampleCardRewardsDining),
        Category(name: "Gas", cardRewards: CreditCard.sampleCardRewardsGas)
    ]
}
