//
//  HowPropertyWrappersBecomeStructs.swift
//  Instafilter
//
//  Created by Chiraphat Techasiri on 7/4/25.
//

import SwiftUI

struct HowPropertyWrappersBecomeStructs: View {
    @State private var blurAmount = 0.0 {
        /// this doesn't work because the struct of blur amount isn't changed directly so the didSet won't trigger
        /// the didSet only tiggers when the struct is changed
        didSet {
            print("New value is \(blurAmount)")
        }
    }
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .blur(radius: blurAmount)
            
            Slider(value: $blurAmount, in: 0...20)
            
            Button("Blur Button") {
                blurAmount = Double.random(in: 0...20)
            }
        }
    }
}

#Preview {
    HowPropertyWrappersBecomeStructs()
}
