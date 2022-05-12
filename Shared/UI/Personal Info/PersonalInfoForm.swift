//
//  PersonalInfoForm.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 12/5/2022.
//

import SwiftUI

struct PersonalInfoForm: View {
    @State private var firstName: String = ""
    var body: some View {
        Form {
            Section("Personal Info") {
                HStack {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $firstName)
                }
                TextField("Phone Number", text: $firstName)
                TextField("Email", text: $firstName)
                TextField("Address", text: $firstName)
            }
            TextField("Total Years of experience", text: $firstName)
            Section("Career Objective") {
                TextEditor(text: $firstName)
                    .frame(height: 200)
            }
        }
    }
}

struct PersonalInfoForm_Previews: PreviewProvider {
    static var previews: some View {
        PersonalInfoForm()
    }
}
