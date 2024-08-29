//
//  CardStore.swift
//
//  Manages the loading, saving, and real-time updating of CreditCard objects.
//

import SwiftUI

@MainActor
class CardStore: ObservableObject {
    @Published var cards: [CreditCard] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("cards.data")
    }
    
    func load() async throws {
        let task = Task<[CreditCard], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            
            let creditCards = try JSONDecoder().decode([CreditCard].self, from: data)
            return creditCards
        }
        
        let cards = try await task.value
        self.cards = cards
    }
    
    func save(cards: [CreditCard]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(cards)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        
        _ = try await task.value
    }
}
