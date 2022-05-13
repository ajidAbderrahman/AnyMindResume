//
//  ResumeView.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 12/5/2022.
//

import SwiftUI

struct ResumeView: View {
    @StateObject var resume: Resume
    var body: some View {
        List(resume.sections, id: \.self) { section in
            NavigationLink {
                PersonalInfoView(personalInfo: resume.personalInfo)
            } label: {
                Text(section)
                    .padding()
            }
        }
        .navigationTitle("Resume")
        .toolbar(content: {
            Button {
                print(resume)
            } label: {
                Text("Save")
            }
            
        })
    }
}

struct ResumeView_Previews: PreviewProvider {
    static var previews: some View {
        ResumeView(resume: Resume())
    }
}
