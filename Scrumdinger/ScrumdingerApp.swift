//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Le Minh Giang on 28/6/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    // hydrate app! Load data from storage
    @StateObject private var store = ScrumStore()
    @State private var errorWrapper: ErrorWrapper? // ? means if uninitialised, default value is nil
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $store.scrums) {
                // closure for saveAction
                Task {
                    do {
                        try await store.save(scrums: store.scrums)
                        
                    } catch {
                        errorWrapper = ErrorWrapper(error: error, guidance: "Please try again later.")
                    }
                }
            } // make root view (when app launches) to be scrumsView
            .task {
                // async function call to load
                do {
                    try await store.load()
                } catch {
                    errorWrapper = ErrorWrapper(error: error, guidance: "Scrumdinger could not load data from disk. Loading sample data")
                }
            }
            .sheet(item: $errorWrapper) {
                // closure for onDismiss
                store.scrums = DailyScrum.sampleData
                // automatically resets errorWrapper to nil when dismissed
            } content: { wrapper in // unwraps
                // closure for content
                ErrorView(errorWrapper: wrapper)
            }
        }
        
    }
}
