//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Le Minh Giang on 30/6/23.
//

import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum
    
    @State private var isPresentingEditView = false // need this to indicate when to display edit view
    @State private var editingScrum = DailyScrum.emptyScrum
    
    var body: some View {
        List {
            Section(header: Text("Meeting info")) { // closure for content, returns a View
                NavigationLink(destination: MeetingView(scrum: $scrum)) {
                    Label("Start meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children:.combine) // .combine allows VoiceOver to read both children in 1 swipe / command.
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text("\(scrum.theme.name)")
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }
            Section(header: Text("Attendeez Nutz")) {
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
            Section(header: Text("History")) {
                if scrum.history.isEmpty {
                    Label("No meetings yet", systemImage: "calendar.badge.exclamationmark")
                }
                ForEach(scrum.history) { history in
                    HStack {
                        Image(systemName: "calendar")
                        Text(history.date, style: .date)
                    }
                }
            }
        }
        .navigationTitle(scrum.title) // add the big word on top of list
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                editingScrum = scrum
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            // when isPresentingEditView is true, EditView() is displayed in a sheet that partially covers the current view which is what we are using now.
            NavigationStack {
                EditView(scrum: $editingScrum)
                    .navigationTitle("\(scrum.title)")
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                scrum = editingScrum
                            }
                        }
                    }
            }
        }
    }
        
}

struct DetailView_Previews: PreviewProvider {
    static var scrum: DailyScrum = DailyScrum.sampleData[0]
    
    static var previews: some View {
        NavigationStack {
            DetailView(scrum: .constant(scrum))
        }
    }
}
