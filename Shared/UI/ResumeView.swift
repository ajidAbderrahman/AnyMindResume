//
//  ResumeView.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 12/5/2022.
//

import SwiftUI

struct ResumeView: View {
    private let resume = Resume()
    var body: some View {
        List(resume.sections, id: \.title) { section in
            NavigationLink {
                PersonalInfoView()
            } label: {
                Text(section.title)
                    .padding()
            }
        }
        .navigationTitle("Resume")
    }
}

struct ResumeView_Previews: PreviewProvider {
    static var previews: some View {
        ResumeView()
    }
}
