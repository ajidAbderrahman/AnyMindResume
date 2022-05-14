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
//        VStack(alignment: .center) {
//            PersonalInfoForm(personalInfo: personalInfo)
//        }
        HStack {
            TextField("First Name", text: $personalInfo.firstName)
            TextField("Last Name", text: $personalInfo.lastName)
        }
        .navigationTitle("Personal Info")
        .navigationBarTitleDisplayMode(.large)
        .padding()
    }
}

struct PersonalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalInfoView(personalInfo: Binding<PersonalInfo>.constant(PersonalInfo()))
    }
}
