//
//  PersonalInfoForm.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 12/5/2022.
//

import SwiftUI

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

struct PersonalInfoForm_Previews: PreviewProvider {
    static var previews: some View {
        PersonalInfoForm(personalInfo: Binding<PersonalInfo>.constant(PersonalInfo()))
    }
}
