//
//  ScrumsView.swift
//  Scrumdinger
//  Render array of DailyScrum objects into a list on UI
//  Created by Le Minh Giang on 28/6/23.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum] // now a modifiable state
    
    @Environment(\.scenePhase) private var scenePhase // observe this value, save / read based on changes
    
    // whether or not we are showing new scrum for adding
    @State private var isPresentingNewScrumView = false
    
    let saveAction: () -> Void // provide this when we init this view
    
    var body: some View {
        NavigationStack {
            List($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    // destination is another view!!
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar { // add icon top right corner
                Button(action: {
                    isPresentingNewScrumView = true
                }) {
                    Image(systemName: "plus")
                }
            }
            .accessibilityLabel("New Scrum")
        }
        .sheet(isPresented: $isPresentingNewScrumView) {
            NewScrumSheet(isPresentingNewScrumView: $isPresentingNewScrumView, scrums: $scrums)
        }
        .onChange(of: scenePhase) { phase in
            // when app closes and goes to the background -> save
            if phase == .inactive {
                saveAction()
            }
        }
    }
}

struct ScrumsView_Preview: PreviewProvider {
    static var scrums: [DailyScrum] = DailyScrum.sampleData
    static var previews: some View {
        ScrumsView(scrums: .constant(scrums), saveAction: {})
    }
}
