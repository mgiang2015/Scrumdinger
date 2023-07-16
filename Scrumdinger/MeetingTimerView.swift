//
//  MeetingTimerView.swift
//  Scrumdinger
//
//  Created by Le Minh Giang on 6/7/23.
//

import SwiftUI

struct MeetingTimerView: View {
    // to display their names in the middle of circle
    let speakers: [ScrumTimer.Speaker]
    let theme: Theme
    
    private var currentSpeaker: String {
        // interesting syntax. Use ? to unwrap and ?? if content is empty
        speakers.first(where: { !$0.isCompleted })?.name ?? "Someone"
    }
    
    var body: some View {
        Circle()
            .strokeBorder(lineWidth: 24)
            .overlay {
                VStack {
                    Text(currentSpeaker)
                        .font(.title)
                    Text("is speaking")
                }
                .accessibilityElement(children: .combine)
                .foregroundStyle(theme.accentColor)
            }
            .overlay {
                ForEach(speakers) { speaker in
                    if speaker.isCompleted, let index = speakers.firstIndex(where: { $0.id == speaker.id }) {
                        // find the index for the current speaker who has completed
                        SpeakerArc(speakerIndex: index, totalSpeakers: speakers.count)
                            .rotation(Angle(degrees: -90.0))
                            .stroke(theme.mainColor, lineWidth: 12)
                    }
                }
            }
    }
}

struct MeetingTimerView_Previews: PreviewProvider {
    // calculated
    static var speakers: [ScrumTimer.Speaker] {
        [ScrumTimer.Speaker(name: "Le", isCompleted: true), ScrumTimer.Speaker(name: "Zel", isCompleted: false)]
    }
    
    static var previews: some View {
        MeetingTimerView(speakers: speakers, theme: Theme.bubblegum)
    }
}
