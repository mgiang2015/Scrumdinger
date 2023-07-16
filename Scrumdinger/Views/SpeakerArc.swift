//
//  SpeakerArc.swift
//  Scrumdinger
//
//  Created by Le Minh Giang on 6/7/23.
//

import SwiftUI

struct SpeakerArc: Shape {
    // divides the circle into `totalSpeakers` segments and colors `speakerIndex` segments
    let speakerIndex: Int
    let totalSpeakers: Int
    
    private var degreesPerSpeaker: Double {
        360.0 / Double(totalSpeakers)
    }
    
    private var startAngle: Angle {
        Angle(degrees: degreesPerSpeaker * Double(speakerIndex) + 1.0) // 1.0 for visual separation between arc segments
    }
    
    private var endAngle: Angle {
        Angle(degrees: degreesPerSpeaker * Double(speakerIndex + 1) - 1.0) // -1.0 for visual separation between arc segments
    }
    
    // required to conform to Shape interface
    func path(in rect: CGRect) -> Path {
        let diameter = min(rect.size.width, rect.size.height) - 24.0 // 24 is the circle thickness
        let radius = diameter / 2.0
        let center = CGPoint(x: rect.midX, y: rect.midY) // circle center
        
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}
