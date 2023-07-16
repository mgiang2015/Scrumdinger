//
//  ErrorView.swift
//  Scrumdinger
//  For presenting error and provide guidance for users
//  Created by Le Minh Giang on 6/7/23.
//

import SwiftUI

struct ErrorView: View {
    let errorWrapper: ErrorWrapper
    
    // dismiss is a structure. Can be called if structure has callAsFunction method
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("An error has occured")
                    .font(.title)
                    .padding(.bottom) // space from error description
                Text(errorWrapper.error.localizedDescription)
                    .font(.body)
                    .padding(.bottom)
                Text(errorWrapper.guidance)
                    .font(.caption)
                Spacer()
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(16)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Dismiss") {
                        dismiss()
                    }
                }
            }
        }
        
    }
}

struct ErrorView_Previews: PreviewProvider {
    enum SampleError: Error {
        case errorRequired
    }
    
    static var previews: some View {
        ErrorView(errorWrapper: ErrorWrapper(error: SampleError.errorRequired, guidance: "Turn ur phone off and on again hehe ez"))
    }
}
