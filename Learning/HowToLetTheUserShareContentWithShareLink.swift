//
//  HowToLetTheUserShareContentWithShareLink.swift
//  Instafilter
//
//  Created by Chiraphat Techasiri on 7/10/25.
//

import SwiftUI

struct HowToLetTheUserShareContentWithShareLink: View {
    let example = Image(.example)
    var body: some View {
        ShareLink(item: example, preview: SharePreview("Singapore Airport", image: example)) {
            Label("Click to share", systemImage: "airplane")
        }
//        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!, subject: Text("Learn Swift here"), message: Text("Check out the 100 Days of SwiftUI!")) {
//            Label("Spread the word about Swift", systemImage: "swift")
//        }
    }
}

#Preview {
    HowToLetTheUserShareContentWithShareLink()
}
