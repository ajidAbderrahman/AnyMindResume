//
//  ImagePickerView.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 15/5/2022.
//

import SwiftUI

struct ImagePickerView: View {
    
    @State private var showImagePicker: Bool = false
    @Binding var image: UIImage?
    
    var body: some View {
        Button {
            showImagePicker.toggle()
        } label: {
            imageView
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipped()
        }
        .frame(width: 100, height: 100, alignment: .center)
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(sourceType: .photoLibrary) { image in
                self.image = image
            }
        }
    }
    
    private var imageView: Image {
        image != nil ?
        Image(uiImage: image!)
        :
        Image(systemName: "person.crop.circle.fill.badge.plus")
    }
}

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView(image: Binding<UIImage?>.constant(nil))
    }
}
