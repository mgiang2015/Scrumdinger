//
//  Theme.swift
//  Scrumdinger
//  Allows consistent theming throughout the application
//  Created by Le Minh Giang on 28/6/23.
//

// import Foundation
import SwiftUI // Importing this SwiftUI instead of Foundation because I want to use Color properties from SwiftUI frameworks, which is seen as View which can be added directly to view hierarchy

// need Identifiable to use ForEach
enum Theme: String, CaseIterable, Identifiable, Codable {
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    
    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow: return .black
        case .indigo, .magenta, .navy, .oxblood, .purple: return .white
        }
    }
    
    var mainColor: Color {
        Color(self.rawValue)
    }
    
    var name: String {
        self.rawValue.capitalized
    }
    
    var id: String {
        name
    }
}


