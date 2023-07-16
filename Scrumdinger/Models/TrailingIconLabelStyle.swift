//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//  Allows consistent design throughout app. Label style is reused in multiple views
//  Created by Le Minh Giang on 28/6/23.
//

import SwiftUI

struct TrailingIconLabelStyle: LabelStyle { // LabelStyle is a type provided by SwiftUI
    func makeBody(configuration: Configuration) -> some View {
        // can omit keyword return here. Similar to Rust, last value declared is the return value
        HStack {
            // swap the order of title and icon. Standard output is icon first then title, but this is title first then icon hence trailing icon
            configuration.title
            configuration.icon
        }
    }
}

extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() }    // allow label style to be called using dot syntax. Now people can just use .trailingIcon to employ style
}
