//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Le Minh Giang on 5/7/23.
//

import SwiftUI

struct NewScrumSheet: View {
    @Binding var isPresentingNewScrumView: Bool
    
    // append to array once added
    @Binding var scrums: [DailyScrum]
    
    // store new scrum data
    @State private var newScrum: DailyScrum = DailyScrum.emptyScrum
    var body: some View {
        NavigationStack {
            EditView(scrum: $newScrum)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewScrumView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            scrums.append(newScrum)
                            isPresentingNewScrumView = false
                        }
                    }
                }
        }
        
    }
}

struct NewScrumSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewScrumSheet(isPresentingNewScrumView: .constant(true), scrums: .constant(DailyScrum.sampleData))
    }
}
