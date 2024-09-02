//
//  Category.swift
//
//  Data template for each Category object.
//  Categories: [Travel, Dining, Groceries, Gas, Entertainment, Shopping, Other]
//

import Foundation

struct Category: Identifiable, Codable {
    let id: UUID
    var name: String
    var cardRewards = [CreditCard.cardID_rewards]()
    
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
    
    init(id: UUID = UUID(), name: String, cardRewards: [CreditCard.cardID_rewards]) {
        self.id = id
        self.name = name
        self.cardRewards = cardRewards
    }
}
    
extension Category {
    static var emptyCategory: Category {
        Category(name: "", cardRewards: [])
    }
}

//func searchCategoryListNames(name: String, categoryList: [Category]) -> Int? {
//  return categoryList.firstIndex { $0.name == name }
//}
//
//func searchCategoryListRewardIDs(rewardID: UUID, categoryList: [Category]) -> Int? {
//    return categoryList.firstIndex { category in category.cardRewards.contains { $0.id == rewardID } }
//}
//
//func searchCardID_Rewards(cardID: UUID, cardIDRewards: [CreditCard.cardID_rewards]) -> Int? {
//    return cardIDRewards.firstIndex { $0.cardID == cardID }
//}
//
func sorterforCategory(this: CreditCard.cardID_rewards, that: CreditCard.cardID_rewards) -> Bool {
    return this.reward > that.reward
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
