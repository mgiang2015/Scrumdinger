//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by Le Minh Giang on 4/7/23.
//

import SwiftUI

struct ThemePicker: View {
    // communicate user selection back to parent view
    @Binding var selection: Theme

    var body: some View {
        Picker("Theme", selection: $selection) {
            // list all themes
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                    .tag(theme) // what is this hash for
            }
        }
        .pickerStyle(.navigationLink)
    }
}

struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
        // .constant wraps value to become a constant binding. Used to provide default value
        ThemePicker(selection: .constant(.periwinkle))
        
    }
}
