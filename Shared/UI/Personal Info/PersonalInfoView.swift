//
//  PersonalInfoView.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 12/5/2022.
//

import SwiftUI

struct PersonalInfoView: View {
    @Binding var personalInfo: PersonalInfo
    
    var body: some View {
        VStack {
            ImagePickerView(image: $personalInfo.image)
            PersonalInfoForm(personalInfo: $personalInfo)
        }
        .navigationTitle("Personal Info")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct PersonalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalInfoView(personalInfo: Binding<PersonalInfo>.constant(PersonalInfo()))
    }
}
