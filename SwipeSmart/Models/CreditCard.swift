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
    var categories: [cardID_rewards]
    
    init(id: UUID = UUID(), bankName: String, cardName: String, categories: [cardID_rewards]) {
        self.id = id
        self.bankName = bankName
        self.cardName = cardName
        self.categories = categories
    }
}

extension CreditCard {
    struct cardID_rewards: Identifiable, Codable {
        let id: UUID
        let cardID: UUID
        var categoryName: String
        var reward: Int
        var startDate: Date?
        var expirationDate: Date?
        
        init(id: UUID = UUID(), cardID: UUID, categoryName: String, reward: Int, startDate: Date?, expirationDate: Date?) {
            self.id = id
            self.cardID = cardID
            self.categoryName = categoryName
            self.reward = reward
            self.startDate = startDate
            self.expirationDate = expirationDate
        }
        
        init(id: UUID = UUID(), cardID: UUID, categoryName: String, reward: Int) {
            self.id = id
            self.cardID = cardID
            self.categoryName = categoryName
            self.reward = reward
        }
    }
    
    static var emptyCard: CreditCard {
        CreditCard(bankName: "", cardName: "", categories: [])
    }
}

extension CreditCard {
    // In credit card
    static let sampleCards: [CreditCard] =
    [
        CreditCard(bankName: "American Express", cardName: "Blue", categories: []),
        CreditCard(bankName: "Discover", cardName: "", categories: []),
        CreditCard(bankName: "Bank of America", cardName: "Visa Signature", categories: [])
    ]
    
    static let testCards: [CreditCard] =
    [
        CreditCard(id: CreditCard.sampleCards[0].id, bankName: "American Express", cardName: "Blue", categories: sampleCategoryRewards0),
        CreditCard(id: CreditCard.sampleCards[1].id, bankName: "Discover", cardName: "", categories: sampleCategoryRewards1),
        CreditCard(id: CreditCard.sampleCards[2].id, bankName: "Bank of America", cardName: "Visa Signature", categories: sampleCategoryRewards2)
    ]
    
    static let sampleCategoryRewards0: [cardID_rewards] =
    [
        cardID_rewards(cardID: CreditCard.sampleCards[0].id, categoryName: "Groceries", reward: 3, startDate: Date.now, expirationDate: Date.now),
        cardID_rewards(cardID: CreditCard.sampleCards[0].id, categoryName: "Dining", reward: 3,  startDate: Date.now, expirationDate: Date.now),
        cardID_rewards(cardID: CreditCard.sampleCards[0].id, categoryName: "Gas", reward: 1, startDate: Date.now, expirationDate: Date.now),
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
    
    // In category
    static let sampleCardRewardsGroceries: [cardID_rewards] =
    [
        cardID_rewards(cardID: CreditCard.sampleCards[0].id, categoryName: "Groceries", reward: 3, startDate: Date.now, expirationDate: Date.now),
        cardID_rewards(cardID: CreditCard.sampleCards[1].id, categoryName: "Groceries", reward: 2),
        cardID_rewards(cardID: CreditCard.sampleCards[2].id, categoryName: "Groceries", reward: 1)
    ]
    
    static let sampleCardRewardsDining: [cardID_rewards] =
    [
        cardID_rewards(cardID: CreditCard.sampleCards[0].id, categoryName: "Dining", reward: 3,  startDate: Date.now, expirationDate: Date.now),
        cardID_rewards(cardID: CreditCard.sampleCards[1].id, categoryName: "Dining", reward: 1)
    ]
    
    static let sampleCardRewardsGas: [cardID_rewards] =
    [
        cardID_rewards(cardID: CreditCard.sampleCards[0].id, categoryName: "Gas", reward: 1,  startDate: Date.now, expirationDate: Date.now),
        cardID_rewards(cardID: CreditCard.sampleCards[1].id, categoryName: "Gas", reward: 2),
        cardID_rewards(cardID: CreditCard.sampleCards[2].id, categoryName: "Gas", reward: 3)
    ]
}
