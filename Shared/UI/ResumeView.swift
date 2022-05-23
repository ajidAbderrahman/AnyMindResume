//
//  ResumeView.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 12/5/2022.
//

import SwiftUI
import Resolver

// MARK: Resume View
struct ResumeView: View {
    @ObservedObject private(set) var viewModel: ViewModel
    var body: some View {
        List(viewModel.sections, id: \.self) { section in
            NavigationLink {
                content(section)
            } label: {
                Text(section.rawValue)
                    .padding()
            }
        }
        .navigationTitle("Resume")
        .toolbar {
                HStack {
                    Button {
                        viewModel.addResume()
                    } label: {
                        Text("Save")
                    }
                    Button {
                        viewModel.genereatePDF()
                    } label: {
                        Text("Share")
                    }
                }
        }
        .activitySheet($viewModel.item)
    }
    
    private func content(_ section: ResumeSection) -> AnyView {
        switch section {
        case .personalInfo: return AnyView(PersonalInfoView(personalInfo: $viewModel.resume.personalInfo))
        case .skills: return AnyView(SkillsView(skills: $viewModel.resume.skills))
        case .works: return AnyView(WorksView(works: $viewModel.resume.works))
        case .educations: return AnyView(EducationsView(educations: $viewModel.resume.educations))
        case .projects: return AnyView(ProjectsView(projects: $viewModel.resume.projects))
        }
    }
}

//MARK: ViewModel
extension ResumeView {
    
    class ViewModel: ObservableObject {
        
        @LazyInjected private var persistanceManager: DataRepo
        @Published var resume: Resume
        @Published var item: ActivityItem?
        
        var sections: [ResumeSection] {
            resume.sections
        }
        
        private var pdfData: Data? { ResumePDFCreator(resume).resumePDF?.dataRepresentation() }
        
        init(resume: Resume) {
            self.resume = resume
        }
        
        func addResume() {
            persistanceManager.addResume(resume)
        }
        
        func genereatePDF() {
            guard let data = pdfData else {
                // TODO: need error handling
                fatalError("No data generated")
            }
            item = ActivityItem(items: data)
        }
        
    }
    
}

//MARK: Preview
struct ResumeView_Previews: PreviewProvider {
    static var previews: some View {
        ResumeView(
            viewModel: ResumeView.ViewModel(
                resume: Resume(title: "Resume Title")
            )
        )
    }
}
