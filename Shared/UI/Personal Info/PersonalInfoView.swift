//
//  PersonalInfoView.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 12/5/2022.
//

import SwiftUI

struct PersonalInfoView: View {
    var body: some View {
        VStack(alignment: .center) {
            Button {
               // TODO: add action
            } label: {
                Image(systemName: "person.circle.fill")
                    .resizable()
            }
            .frame(width: 100, height: 100)
            PersonalInfoForm()
        }
        .navigationTitle("Personal Info")
        .navigationBarTitleDisplayMode(.large)
        .padding()
    }
}

struct PersonalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalInfoView()
    }
}
