//
//  Category.swift
//  Category Dictionary (Key for each category)
//  Categories: [Travel, Dining, Groceries, Gas, Entertainment, Shopping]
//

import Foundation

//var globalCategoryList: [Category] =
//[
//    Category(name: "Travel", cardRebates: []),
//    Category(name: "Dining", cardRebates: []),
//    Category(name: "Groceries", cardRebates: []),
//    Category(name: "Gas", cardRebates: []),
//    Category(name: "Digital Wallets", cardRebates: []),
//    Category(name: "Online Shopping", cardRebates: [])
//]

struct Category: Identifiable, Codable {
    let id: UUID
    var name: String
    var cardRebates = [CreditCard.cardID_rebates]()
    
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
    
    init(id: UUID = UUID(), name: String, cardRebates: [CreditCard.cardID_rebates]) {
        self.id = id
        self.name = name
        self.cardRebates = cardRebates
    }
}
    
extension Category {
//    struct cardID_rebate: Codable {
//        var cardID: UUID
//        var rebate: Int
//
//        init(cardID: UUID, rebate: Int) {
//            self.cardID = cardID
//            self.rebate = rebate
//        }
//    }
    
    static var emptyCategory: Category {
        Category(name: "", cardRebates: [])
    }
}

func searchCategoryListNames(name: String, categoryList: [Category]) -> Int? {
  return categoryList.firstIndex { $0.name == name }
}

func searchCategoryListRebateIDs(rebateID: UUID, categoryList: [Category]) -> Int? {
    return categoryList.firstIndex { category in category.cardRebates.contains { $0.id == rebateID } }
}

func searchCardID_Rebates(cardID: UUID, cardIDRebates: [CreditCard.cardID_rebates]) -> Int? {
    return cardIDRebates.firstIndex { $0.cardID == cardID }
}

func sorterforCategory(this: CreditCard.cardID_rebates, that: CreditCard.cardID_rebates) -> Bool {
    return this.rebate > that.rebate
}

extension Category {
    static let sampleCategories: [Category] =
    [
        Category(name: "Groceries", cardRebates: CreditCard.sampleCardRebatesGroceries),
        Category(name: "Dining", cardRebates: CreditCard.sampleCardRebatesDining),
        Category(name: "Gas", cardRebates: CreditCard.sampleCardRebatesGas)
    ]
}
