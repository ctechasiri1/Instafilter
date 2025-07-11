//
//  LoadingPhotosFromTheUserPhotoLibrary.swift
//  Instafilter
//
//  Created by Chiraphat Techasiri on 7/10/25.
//
import PhotosUI
import SwiftUI

struct LoadingPhotosFromTheUserPhotoLibrary: View {
    @State private var pickerItems = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()

    var body: some View {
        VStack {
            PhotosPicker("Select images", selection: $pickerItems, maxSelectionCount: 3, matching: .images)
            
            ScrollView {
                ForEach(0..<selectedImages.count, id:\.self) { i in
                    selectedImages[i]
                        .resizable()
                        .scaledToFit()
                }
            }
        }
        .onChange(of: pickerItems) {
            Task {
                selectedImages.removeAll()
                
                for item in pickerItems {
                    if let loadedImage = try await item.loadTransferable(type: Image.self) {
                        selectedImages.append(loadedImage)
                    }
                }
            }
        }
    }
}

#Preview {
    LoadingPhotosFromTheUserPhotoLibrary()
}

/// example to load a single image onto the screen

//struct LoadingPhotosFromTheUserPhotoLibrary: View {
//    @State private var pickerItem: PhotosPickerItem?
//    @State private var selectedImage: Image?
//
//    var body: some View {
//        VStack {
//            PhotosPicker("Select a picture", selection: $pickerItem, matching: .images)
//            
//            selectedImage?
//                .resizable()
//                .scaledToFit()
//        }
//        .onChange(of: pickerItem) {
//            Task {
//                selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
//            }
//        }
//    }
//}


