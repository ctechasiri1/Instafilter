//
//  ContentView.swift
//  Instafilter
//
//  Created by Chiraphat Techasiri on 7/3/25.
//
import StoreKit
import SwiftUI

struct ContentView: View {
    @Environment(\.requestReview) var requestReview
    
    var body: some View {
        Button("Leave a review") {
            requestReview()
        }
    }
}

#Preview {
    ContentView()
}
