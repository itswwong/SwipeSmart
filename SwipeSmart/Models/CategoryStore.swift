//
//  CategoryStore.swift
//
//  Manages the loading, saving, and real-time updating of Category objects.
//
//  Categories: [Travel, Dining, Groceries, Gas, Entertainment, Shopping, Other]

import SwiftUI

@MainActor
class CategoryStore: ObservableObject {
    @Published var categories = [
        Category(name: "Travel", cardRewards: []),
        Category(name: "Dining", cardRewards: []),
        Category(name: "Gas", cardRewards: []),
        Category(name: "Entertainment", cardRewards: []),
        Category(name: "Shopping", cardRewards: []),
        Category(name: "Other", cardRewards: [])
    ]
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("categories.data")
    }
    
    func load() async throws {
        let task = Task<[Category], Error> {
            let fileURL = try Self.fileURL()
            guard FileManager.default.fileExists(atPath: fileURL.path) else {
                return self.categories
            }
                        
            let data = try Data(contentsOf: fileURL)
            let categories = try JSONDecoder().decode([Category].self, from: data)
            return categories.isEmpty ? self.categories : categories // return default categories unless there is user data
        }
        
        let categories = try await task.value
        self.categories = categories
    }
    
    func save(categories: [Category]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(categories)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        
        _ = try await task.value
    }
}
