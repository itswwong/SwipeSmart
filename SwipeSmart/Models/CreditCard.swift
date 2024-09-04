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
    struct cardID_rewards: Identifiable, Codable, Equatable {
        let id: UUID
        let cardID: UUID
        var categoryName: String
        var reward: Int
        var startDate: Date?
        var expirationDate: Date?
        var expired: Bool
        
        init(id: UUID = UUID(), cardID: UUID, categoryName: String, reward: Int, startDate: Date?, expirationDate: Date?, expired: Bool) {
            self.id = id
            self.cardID = cardID
            self.categoryName = categoryName
            self.reward = reward
            self.startDate = startDate
            self.expirationDate = expirationDate
            self.expired = expired
        }
        
        init(id: UUID = UUID(), cardID: UUID, categoryName: String, reward: Int, expired: Bool) {
            self.id = id
            self.cardID = cardID
            self.categoryName = categoryName
            self.reward = reward
            self.expired = expired
        }
        
        public mutating func updateDate(startDate: Date?, expirationDate: Date?, categories: inout [Category]) {
            // Update the start and expiration dates in the local category object
            self.startDate = startDate
            self.expirationDate = expirationDate
            
            // Update the expired status
            let currentDate = Date()
            if let date = expirationDate {
                self.expired = date < currentDate
            } else {
                self.expired = false
            }
            
            // Update the corresponding values in the global categories list
            if let categoryIndex = categories.firstIndex(where: { $0.name == self.categoryName }) {
                if let rewardIndex = categories[categoryIndex].cardRewards.firstIndex(where: { $0.id == self.id }) {
                    categories[categoryIndex].cardRewards[rewardIndex].startDate = startDate
                    categories[categoryIndex].cardRewards[rewardIndex].expirationDate = expirationDate
                    categories[categoryIndex].cardRewards[rewardIndex].expired = self.expired
                    
                    categories[categoryIndex].cardRewards.sort(by: sortbyExpirationAndReward)
                }
            }
        }
    }
    
    static var emptyCard: CreditCard {
        CreditCard(bankName: "", cardName: "", categories: [])
    }
}

func sortbyExpirationAndReward(this: CreditCard.cardID_rewards, that: CreditCard.cardID_rewards) -> Bool {
    // If 'this' has expired and 'that' hasn't, move 'this' to the end
    if this.expired && !that.expired {
        return false
    }
    
    // If 'that' has expired and 'this' hasn't, move 'that' to the end
    if that.expired && !this.expired {
        return true
    }
    
    return this.reward > that.reward
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
        cardID_rewards(cardID: CreditCard.sampleCards[0].id, categoryName: "Groceries", reward: 3, startDate: Date.now, expirationDate: Date.now, expired: false),
        cardID_rewards(cardID: CreditCard.sampleCards[0].id, categoryName: "Dining", reward: 3,  startDate: Date.now, expirationDate: Date.now, expired: false),
        cardID_rewards(cardID: CreditCard.sampleCards[0].id, categoryName: "Gas", reward: 1, startDate: Date.now, expirationDate: Date.now, expired: false),
    ]
    
    static let sampleCategoryRewards1: [cardID_rewards] =
    [
        cardID_rewards(cardID: CreditCard.sampleCards[1].id, categoryName: "Groceries", reward: 2, expired: false),
        cardID_rewards(cardID: CreditCard.sampleCards[1].id, categoryName: "Dining", reward: 1, expired: false),
        cardID_rewards(cardID: CreditCard.sampleCards[1].id, categoryName: "Gas", reward: 2, expired: false),
    ]
    
    static let sampleCategoryRewards2: [cardID_rewards] =
    [
        cardID_rewards(cardID: CreditCard.sampleCards[2].id, categoryName: "Groceries", reward: 1, expired: false),
        cardID_rewards(cardID: CreditCard.sampleCards[2].id, categoryName: "Gas", reward: 3, expired: false)
    ]
    
    // In category
    static let sampleCardRewardsGroceries: [cardID_rewards] =
    [
        cardID_rewards(cardID: CreditCard.sampleCards[0].id, categoryName: "Groceries", reward: 3, startDate: Date.now, expirationDate: Date.now, expired: false),
        cardID_rewards(cardID: CreditCard.sampleCards[1].id, categoryName: "Groceries", reward: 2, expired: false),
        cardID_rewards(cardID: CreditCard.sampleCards[2].id, categoryName: "Groceries", reward: 1, expired: false)
    ]
    
    static let sampleCardRewardsDining: [cardID_rewards] =
    [
        cardID_rewards(cardID: CreditCard.sampleCards[0].id, categoryName: "Dining", reward: 3,  startDate: Date.now, expirationDate: Date.now, expired: false),
        cardID_rewards(cardID: CreditCard.sampleCards[1].id, categoryName: "Dining", reward: 1, expired: false)
    ]
    
    static let sampleCardRewardsGas: [cardID_rewards] =
    [
        cardID_rewards(cardID: CreditCard.sampleCards[0].id, categoryName: "Gas", reward: 1,  startDate: Date.now, expirationDate: Date.now, expired: false),
        cardID_rewards(cardID: CreditCard.sampleCards[1].id, categoryName: "Gas", reward: 2, expired: false),
        cardID_rewards(cardID: CreditCard.sampleCards[2].id, categoryName: "Gas", reward: 3, expired: false)
    ]
}
