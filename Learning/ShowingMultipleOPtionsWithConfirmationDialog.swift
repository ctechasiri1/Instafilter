//
//  ShowingMultipleOPtionsWithConfirmationDialog.swift
//  Instafilter
//
//  Created by Chiraphat Techasiri on 7/4/25.
//

import SwiftUI

struct ShowingMultipleOPtionsWithConfirmationDialog: View {
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white
    
    var body: some View {
        Button("Hello, World!") {
            showingConfirmation = true
        }
        .frame(width: 300, height: 300)
        .background(backgroundColor)
        .confirmationDialog("Change background", isPresented: $showingConfirmation) {
            Button("Red") {backgroundColor = .red}
            Button("Green") {backgroundColor = .green}
            Button("Blue") {backgroundColor = .blue}
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Select a new color")
        }
    }
}

#Preview {
    ShowingMultipleOPtionsWithConfirmationDialog()
}
