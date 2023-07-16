//
//  CardView.swift
//  Scrumdinger
//
//  Created by Le Minh Giang on 28/6/23.
//

import SwiftUI

struct CardView: View {
    var scrum: DailyScrum // declare member variable for the view here! Whatever data you want to show on the view
    // CardView has to be initialised with it and the rest if we declare
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader) // read content of title followed by "heading". In this case, output "Design Heading" voiceover.
            Spacer()
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityLabel("\(scrum.attendees.count) attendees")
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    //.padding(.trailing, 20) // padding after 69 mins
                    .labelStyle(.trailingIcon)
                    .accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")
            }.font(.caption) // make font smaller compared to title
        }.padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var scrum: DailyScrum = DailyScrum.sampleData[0]
    static var previews: some View {
        CardView(scrum: scrum)
            .background(scrum.theme.mainColor)    // Did not work until I imported project assets for these colors
            .previewLayout(.fixed(width: 400, height: 60))
            .foregroundColor(scrum.theme.accentColor)
    }
}
