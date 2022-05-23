//
//  PersonalInfoView.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 12/5/2022.
//

import SwiftUI

// MARK: Personal Info View (Form + Image)
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

// MARK: Personal Info Preview
struct PersonalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalInfoView(personalInfo: Binding<PersonalInfo>.constant(PersonalInfo()))
    }
}

// MARK: Personal Info Form
struct PersonalInfoForm: View {
    @Binding var personalInfo: PersonalInfo
    var body: some View {
        Form {
            Section("Personal Info") {
                HStack {
                    TextField("First Name", text: $personalInfo.firstName)
                    TextField("Last Name", text: $personalInfo.lastName)
                }
                TextField("Phone Number", text: $personalInfo.mobile)
                    .keyboardType(.phonePad)
                TextField("Email", text: $personalInfo.email)
                    .keyboardType(.emailAddress)
                TextField("Address", text: $personalInfo.address)
            }
            Section("Total Years of experience") {
                TextField("ex: 1.5", text: $personalInfo.yearsOfExperience)
                    .keyboardType(.decimalPad)
            }
            Section("Career Objective") {
                TextEditor(text: $personalInfo.objectives)
                    .frame(height: 150, alignment: .center)
            }
        }
    }
}

// MARK: Form Preview
struct PersonalInfoForm_Previews: PreviewProvider {
    static var previews: some View {
        PersonalInfoForm(personalInfo: Binding<PersonalInfo>.constant(PersonalInfo()))
            .previewLayout(.sizeThatFits)
    }
}
