//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Le Minh Giang on 28/6/23.
//

import Foundation

struct DailyScrum: Identifiable, Codable {
    let id: UUID // unique ID
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var lengthInMinutesAsDouble: Double { // Double {} means a computed property.
        get { // I supplied a getter function which returns a double here
            Double(lengthInMinutes)
        }
        
        set { // What happens when slider changes value of this property
            lengthInMinutes = Int(newValue)
        }
    }
    var theme: Theme
    var history: [History] = []
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map{ (name) -> Attendee in return Attendee(name: name) }
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

extension DailyScrum {
    // add struct
    struct Attendee: Identifiable, Codable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
}

extension DailyScrum { // provide some template mock data
    // computed instance
    static let sampleData: [DailyScrum] = [
        DailyScrum(
            title: "Design",
            attendees: ["Le", "Dung", "Jia Yeong", "Wyi Wying", "Ern ern"],
            lengthInMinutes: 69,
            theme: .yellow
        ), DailyScrum(
            title: "App Dev",
            attendees: ["Le",  "Ern ern"],
            lengthInMinutes: 10,
            theme: .orange
        ), DailyScrum(
            title: "Home Owner Association",
            attendees: ["Jia Yeong", "Wyi Wying", "Ern ern"],
            lengthInMinutes: 30,
            theme: .poppy
        ),
    ]
    
    // Default value for a new scrumß
    static var emptyScrum: DailyScrum {
        DailyScrum(title: "", attendees: [], lengthInMinutes: 0, theme: .sky)
    }
}
