//
//  CategoryStore.swift
//
//  Manages the loading, saving, and real-time updating of Category objects.
//

import SwiftUI

@MainActor
class CategoryStore: ObservableObject {
    @Published var categories: [Category] = []
    
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
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            
            let categories = try JSONDecoder().decode([Category].self, from: data)
            return categories
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
