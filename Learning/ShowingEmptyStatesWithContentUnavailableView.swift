//
//  ShowingEmptyStatesWithContentUnavailableView.swift
//  Instafilter
//
//  Created by Chiraphat Techasiri on 7/9/25.
//

import SwiftUI

struct ShowingEmptyStatesWithContentUnavailableView: View {
    var body: some View {
        /// standard display
//        ContentUnavailableView("No snippets", systemImage: "swift", description: Text("You don't have any saved snippets yet."))
        
        /// more customized view
        ContentUnavailableView {
            Label("No snippets", systemImage: "swift")
        } description: {
            Text("You don't have any saved snippets yet.")
        } actions: {
            Button("Create Snippet") {
                /// create a snippet
            }
            .buttonStyle(.borderedProminent)
        }

    }
}

#Preview {
    ShowingEmptyStatesWithContentUnavailableView()
}
