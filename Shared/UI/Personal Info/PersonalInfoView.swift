//
//  PersonalInfoView.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 12/5/2022.
//

import SwiftUI

struct PersonalInfoView: View {
    
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var showingImagePicker = false
    
    var body: some View {
        VStack(alignment: .center) {
            Button {
                showingImagePicker.toggle()
            } label: {
                (image ?? Image(systemName: "person.circle.fill"))
                    .resizable()
            }
            .clipShape(Circle())
            .frame(width: 100, height: 100)
            PersonalInfoForm()
        }
        .navigationTitle("Personal Info")
        .onChange(of: inputImage, perform: { _ in
            loadImage()
        })
        .sheet(isPresented: $showingImagePicker, content: {
            PhotoPicker(image: $inputImage)
        })
        .navigationBarTitleDisplayMode(.large)
        .padding()
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

struct PersonalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalInfoView()
    }
}
