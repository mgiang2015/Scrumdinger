//
//  History.swift
//  Scrumdinger
//
//  Created by Le Minh Giang on 6/7/23.
//

import Foundation

// each history entry should record date of scrum n attendees
struct History: Identifiable, Codable {
    let id: UUID // to be displayed using ForEach later
    let date: Date
    let attendees: [DailyScrum.Attendee]
    
    init(id: UUID = UUID(), date: Date = Date(), attendees: [DailyScrum.Attendee]) {
        self.id = id
        self.date = date
        self.attendees = attendees
    }
}
