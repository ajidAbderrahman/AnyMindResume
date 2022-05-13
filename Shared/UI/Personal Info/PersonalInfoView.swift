//
//  PersonalInfoView.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 12/5/2022.
//

import SwiftUI

struct PersonalInfoView: View {
    @ObservedObject var personalInfo: PersonalInfo
    
    var body: some View {
        VStack(alignment: .center) {
            PersonalInfoForm(personalInfo: personalInfo)
        }
        .navigationTitle("Personal Info")
        .navigationBarTitleDisplayMode(.large)
        .padding()
    }
}

struct PersonalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalInfoView(personalInfo: PersonalInfo())
    }
}
