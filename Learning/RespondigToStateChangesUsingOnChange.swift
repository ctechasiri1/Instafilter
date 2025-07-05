//
//  RespondigToStateChangesUsingOnChange.swift
//  Instafilter
//
//  Created by Chiraphat Techasiri on 7/4/25.
//

import SwiftUI

/// the fix to this didSet problem is using the onChange modifer instead
struct RespondigToStateChangesUsingOnChange: View {
    @State private var blurAmount = 0.0
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .blur(radius: blurAmount)
            
            Slider(value: $blurAmount, in: 0...20)
                .onChange(of: blurAmount) { oldValue, newValue in
                    print("New value is \(newValue)")
                }
        }
    }
}

#Preview {
    RespondigToStateChangesUsingOnChange()
}
