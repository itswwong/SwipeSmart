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
    var categories: [cardID_rewards]
    
    init(id: UUID = UUID(), bankName: String, cardName: String, notes: String, categories: [cardID_rewards]) {
        self.id = id
        self.bankName = bankName
        self.cardName = cardName
        self.notes = notes
        self.categories = categories
    }
}

extension CreditCard {
    struct cardID_rewards: Identifiable, Codable {
        let id: UUID
        let cardID: UUID
        var categoryName: String
        var reward: Int
        
        init(id: UUID = UUID(), cardID: UUID, categoryName: String, reward: Int) {
            self.id = id
            self.cardID = cardID
            self.categoryName = categoryName
            self.reward = reward
        }
    }
    
    static var emptyCard: CreditCard {
        CreditCard(bankName: "", cardName: "", notes: "", categories: [])
    }
}

func searchCreditCardCategoryNames(categoryName: String, categories: [CreditCard.cardID_rewards]) -> Int? {
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
        CreditCard(id: CreditCard.sampleCards[0].id, bankName: "American Express", cardName: "Blue", notes: "use this one for Geico", categories: sampleCategoryRewards0),
        CreditCard(id: CreditCard.sampleCards[1].id, bankName: "Discover", cardName: "", notes: "use this one for online shopping", categories: sampleCategoryRewards1),
        CreditCard(id: CreditCard.sampleCards[2].id, bankName: "Bank of America", cardName: "Visa Signature", notes: "use this one for gas", categories: sampleCategoryRewards2)
    ]
    
    static let sampleCategoryRewards0: [cardID_rewards] =
    [
        cardID_rewards(cardID: CreditCard.sampleCards[0].id, categoryName: "Groceries", reward: 3),
        cardID_rewards(cardID: CreditCard.sampleCards[0].id, categoryName: "Dining", reward: 3),
        cardID_rewards(cardID: CreditCard.sampleCards[0].id, categoryName: "Gas", reward: 1),
    ]
    
    static let sampleCategoryRewards1: [cardID_rewards] =
    [
        cardID_rewards(cardID: CreditCard.sampleCards[1].id, categoryName: "Groceries", reward: 2),
        cardID_rewards(cardID: CreditCard.sampleCards[1].id, categoryName: "Dining", reward: 1),
        cardID_rewards(cardID: CreditCard.sampleCards[1].id, categoryName: "Gas", reward: 2),
    ]
    
    static let sampleCategoryRewards2: [cardID_rewards] =
    [
        cardID_rewards(cardID: CreditCard.sampleCards[2].id, categoryName: "Groceries", reward: 1),
        cardID_rewards(cardID: CreditCard.sampleCards[2].id, categoryName: "Gas", reward: 3)
    ]
    
    // in category
    static let sampleCardRewardsGroceries: [cardID_rewards] =
    [
        cardID_rewards(cardID: CreditCard.sampleCards[0].id, categoryName: "Groceries", reward: 3),
        cardID_rewards(cardID: CreditCard.sampleCards[1].id, categoryName: "Groceries", reward: 2),
        cardID_rewards(cardID: CreditCard.sampleCards[2].id, categoryName: "Groceries", reward: 1)
    ]
    
    static let sampleCardRewardsDining: [cardID_rewards] =
    [
        cardID_rewards(cardID: CreditCard.sampleCards[0].id, categoryName: "Dining", reward: 3),
        cardID_rewards(cardID: CreditCard.sampleCards[1].id, categoryName: "Dining", reward: 1)
    ]
    
    static let sampleCardRewardsGas: [cardID_rewards] =
    [
        cardID_rewards(cardID: CreditCard.sampleCards[0].id, categoryName: "Gas", reward: 1),
        cardID_rewards(cardID: CreditCard.sampleCards[1].id, categoryName: "Gas", reward: 2),
        cardID_rewards(cardID: CreditCard.sampleCards[2].id, categoryName: "Gas", reward: 3)
    ]
}
