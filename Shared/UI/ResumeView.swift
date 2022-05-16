//
//  ResumeView.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 12/5/2022.
//

import SwiftUI

struct ResumeView: View {
    @ObservedObject private(set) var viewModel: ViewModel
    @State var resume: Resume
    @State private var item: ActivityItem?
    var body: some View {
        List(resume.sections, id: \.self) { section in
            NavigationLink {
                content(section)
            } label: {
                Text(section.rawValue)
                    .padding()
            }
        }
        .navigationTitle("Resume")
        .toolbar(
            content: {
                HStack {
                    Button {
                        viewModel.addNewResume(resume)
                    } label: {
                        Text("Add")
                    }
                    Button {
                        item = ActivityItem(
                            items: ResumePDFCreator(resume)
                                .resumePDF?
                                .dataRepresentation()
                        )
                    } label: {
                        Text("Share")
                    }
                }
            }
        )
        .activitySheet($item)
    }
    
    private func content(_ section: ResumeSection) -> AnyView {
        switch section {
        case .personalInfo: return AnyView(PersonalInfoView(personalInfo: $resume.personalInfo))
        case .skills: return AnyView(SkillsView(skills: $resume.skills))
        case .works: return AnyView(WorksView(works: $resume.works))
        case .educations: return AnyView(EducationsView(educations: $resume.educations))
        }
    }
}

//MARK: ViewModel
extension ResumeView {
    
    class ViewModel: ObservableObject {
        
        private let dataManager: DataManager
        
        init(dataManager: DataManager = LocalDataManager.shared) {
            self.dataManager = dataManager
        }
        
        func addNewResume(_ value: Resume) {
            dataManager.addResume(value)
        }
        
    }

}

//MARK: Preview
struct ResumeView_Previews: PreviewProvider {
    static var previews: some View {
        ResumeView(viewModel: ResumeView.ViewModel(), resume: Resume())
    }
}
