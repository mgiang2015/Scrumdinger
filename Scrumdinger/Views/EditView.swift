//
//  EditView.swift
//  Scrumdinger
//
//  Created by Le Minh Giang on 3/7/23.
//

import SwiftUI

struct EditView: View {
    // @State: property wrapper to make scrum mutable -> source of truth
    // private because we only want to expose it to certain views / children
    @Binding var scrum: DailyScrum
    
    // Each form field needs a @State to store user input
    @State private var newAttendeeName = ""
    var body: some View {
        Form {
            Section(header: Text("Meeting info")) {
                TextField("Title", text: $scrum.title)
                HStack {
                    // Slider should take a binding<double>. As we drag, Slider will change value of the binding
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 0...30, step: 1) {
                        Text("Length")
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) minutes")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(true) // ignore this part, info is already read by the slider
                }
                ThemePicker(selection: $scrum.theme)
            }
            Section(header: Text("Attendeez nuts")) {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { indices in
                    scrum.attendees.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Attendee", text: $newAttendeeName)
                    Button(action: {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            scrum.attendees.append(attendee)
                            newAttendeeName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }
                    .disabled(newAttendeeName.isEmpty)
                }
            }
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
