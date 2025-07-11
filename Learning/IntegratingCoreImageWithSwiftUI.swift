//
//  IntegratingCoreImageWithSwiftUI.swift
//  Instafilter
//
//  Created by Chiraphat Techasiri on 7/8/25.
//
import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct IntegratingCoreImageWithSwiftUI: View {
    @State private var image: Image?
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }
    
    func loadImage() {
        /// convert the image into a CIImage a filter can be applied to it from the UIImage
        let inputImage = UIImage(resource: .example)
        let beginImage = CIImage(image: inputImage)
        let context = CIContext()
        
        /// sepia filter
        let sepiaFilter = CIFilter.sepiaTone()
                
        /// setting the filter itself
        sepiaFilter.inputImage = beginImage
        sepiaFilter.intensity = 1
        
        /// pixelation filter
        let pixelFilter = CIFilter.pixellate()
        pixelFilter.inputImage = beginImage
        pixelFilter.scale = 20
        
        /// twirl distortion fitler
        let twirlFilter = CIFilter.twirlDistortion()
        twirlFilter.inputImage = beginImage
        
        let amount = 5.0
        
        let inputKeys = twirlFilter.inputKeys
        
        /// let you customize the fitler for twirl distortion
        if inputKeys.contains(kCIInputIntensityKey) {
            twirlFilter.setValue(amount, forKey: kCIInputIntensityKey)
        }
        if inputKeys.contains(kCIInputRadiusKey) { twirlFilter.setValue(amount * 200, forKey: kCIInputRadiusKey)}
        if inputKeys.contains(kCIInputScaleKey) { twirlFilter.setValue(amount * 10, forKey: kCIInputScaleKey)}
        
        /// get a CIImage from our filter or exit if that fails
        guard let outputImage = twirlFilter.outputImage else { return }
        
        /// attmept to get a CGImage from our CIImage
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        
        /// convert that to a UIImage
        let uiImage = UIImage(cgImage: cgImage)
        
        /// and convert that to a SwiftUI image
        image = Image(uiImage: uiImage)
    }
}

#Preview {
    IntegratingCoreImageWithSwiftUI()
}
