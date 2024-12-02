//
//  Category.swift
//
//  Data template for each Category object.
//
//  Categories: [Travel, Dining, Groceries, Gas, Entertainment, Shopping, Other]
//

import Foundation

let categoryColors = [
    "black_accent",
    "black_new",
    "blue_accent",
    "blue_new",
    "blueblack_accent",
    "blueblack_new",
    "bluegray_accent",
    "bluegray_new",
    "brown_accent",
    "brown_new",
    "copper_accent",
    "copper_new",
    "gray_accent",
    "gray_new",
    "green_accent",
    "green_new",
    "orange_accent",
    "orange_new",
    "pastelgraydarkest",
    "pink_accent",
    "pink_new",
    "purple_accent",
    "purple_new",
    "red_accent",
    "red_new",
    "teal_accent",
    "teal_new",
    "yellow_accent",
    "yellow_new",    
]

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
