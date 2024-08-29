//
//  CreditCard.swift
//
//  Data template for each CreditCard object.
//

import Foundation

struct CreditCard: Identifiable, Codable {
    let id: UUID
    var bankName: String
    var cardName: String
    var notes: String
    var categories: [cardID_rebates]
    
    init(id: UUID = UUID(), bankName: String, cardName: String, notes: String, categories: [cardID_rebates]) {
        self.id = id
        self.bankName = bankName
        self.cardName = cardName
        self.notes = notes
        self.categories = categories
    }
}

extension CreditCard {
    struct cardID_rebates: Identifiable, Codable {
        let id: UUID
        let cardID: UUID
        var categoryName: String
        var rebate: Int
        
        init(id: UUID = UUID(), cardID: UUID, categoryName: String, rebate: Int) {
            self.id = id
            self.cardID = cardID
            self.categoryName = categoryName
            self.rebate = rebate
        }
    }
    
    static var emptyCard: CreditCard {
        CreditCard(bankName: "", cardName: "", notes: "", categories: [])
    }
}

func searchCreditCardCategoryNames(categoryName: String, categories: [CreditCard.cardID_rebates]) -> Int? {
  return categories.firstIndex { $0.categoryName == categoryName }
}

func findCreditCardFromID(cardID: UUID, cards: [CreditCard]) -> Int? {
    return cards.firstIndex { $0.id == cardID }
}

extension CreditCard {
    // in credit card
    static let sampleCards: [CreditCard] =
    [
        CreditCard(bankName: "American Express", cardName: "Blue", notes: "use this one for Geico", categories: []),
        CreditCard(bankName: "Discover", cardName: "", notes: "use this one for online shopping", categories: []),
        CreditCard(bankName: "Bank of America", cardName: "Visa Signature", notes: "use this one for gas", categories: [])
    ]
    
    static let testCards: [CreditCard] =
    [
        CreditCard(id: CreditCard.sampleCards[0].id, bankName: "American Express", cardName: "Blue", notes: "use this one for Geico", categories: sampleCategoryRebates0),
        CreditCard(id: CreditCard.sampleCards[1].id, bankName: "Discover", cardName: "", notes: "use this one for online shopping", categories: sampleCategoryRebates1),
        CreditCard(id: CreditCard.sampleCards[2].id, bankName: "Bank of America", cardName: "Visa Signature", notes: "use this one for gas", categories: sampleCategoryRebates2)
    ]
    
    static let sampleCategoryRebates0: [cardID_rebates] =
    [
        cardID_rebates(cardID: CreditCard.sampleCards[0].id, categoryName: "Groceries", rebate: 3),
        cardID_rebates(cardID: CreditCard.sampleCards[0].id, categoryName: "Dining", rebate: 3),
        cardID_rebates(cardID: CreditCard.sampleCards[0].id, categoryName: "Gas", rebate: 1),
    ]
    
    static let sampleCategoryRebates1: [cardID_rebates] =
    [
        cardID_rebates(cardID: CreditCard.sampleCards[1].id, categoryName: "Groceries", rebate: 2),
        cardID_rebates(cardID: CreditCard.sampleCards[1].id, categoryName: "Dining", rebate: 1),
        cardID_rebates(cardID: CreditCard.sampleCards[1].id, categoryName: "Gas", rebate: 2),
    ]
    
    static let sampleCategoryRebates2: [cardID_rebates] =
    [
        cardID_rebates(cardID: CreditCard.sampleCards[2].id, categoryName: "Groceries", rebate: 1),
        cardID_rebates(cardID: CreditCard.sampleCards[2].id, categoryName: "Gas", rebate: 3)
    ]
    
    // in category
    static let sampleCardRebatesGroceries: [cardID_rebates] =
    [
        cardID_rebates(cardID: CreditCard.sampleCards[0].id, categoryName: "Groceries", rebate: 3),
        cardID_rebates(cardID: CreditCard.sampleCards[1].id, categoryName: "Groceries", rebate: 2),
        cardID_rebates(cardID: CreditCard.sampleCards[2].id, categoryName: "Groceries", rebate: 1)
    ]
    
    static let sampleCardRebatesDining: [cardID_rebates] =
    [
        cardID_rebates(cardID: CreditCard.sampleCards[0].id, categoryName: "Dining", rebate: 3),
        cardID_rebates(cardID: CreditCard.sampleCards[1].id, categoryName: "Dining", rebate: 1)
    ]
    
    static let sampleCardRebatesGas: [cardID_rebates] =
    [
        cardID_rebates(cardID: CreditCard.sampleCards[0].id, categoryName: "Gas", rebate: 1),
        cardID_rebates(cardID: CreditCard.sampleCards[1].id, categoryName: "Gas", rebate: 2),
        cardID_rebates(cardID: CreditCard.sampleCards[2].id, categoryName: "Gas", rebate: 3)
    ]
}
