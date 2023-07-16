//
//  ScrumStore.swift
//  Scrumdinger
//
//  Created by Le Minh Giang on 6/7/23.
//

import SwiftUI

@MainActor
// views can bind to values marked @Published. This can serve as a source of truth, same as redux
class ScrumStore: ObservableObject {
    @Published var scrums: [DailyScrum] = []
    
    // returns file path to write to
    private static func fileUrl() throws -> URL {
        // Get location of Documents directory
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("scrums.data")
    }
    
    // used to hydrate the app
    func load() async throws {
        let task = Task<[DailyScrum], Error> { // returns DailyScrum and may throw error
            // async work done here. Return results are saved
            let fileUrl = try Self.fileUrl()
            guard let data = try? Data(contentsOf: fileUrl) else {
                return []
            }
            
            let dailyScrums = try JSONDecoder().decode([DailyScrum].self, from: data) // decode(type, data)
            return dailyScrums
        }
        
        let scrums = try await task.value
        
        // Main thread runs this!!
        self.scrums = scrums
    }
    
    // save app data to storage (hard disk)
    func save(scrums: [DailyScrum]) async throws {
        let task = Task {
            let outFile = try Self.fileUrl()
            let data = try JSONEncoder().encode(self.scrums)
            try data.write(to: outFile)
        }
        
        _ = try await task.value // have to call this for the function to be executed
    }
}
