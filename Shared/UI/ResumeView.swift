//
//  ResumeView.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 12/5/2022.
//

import SwiftUI

protocol ResumeViewModelProtocol {
    func addNewResume(_ value: Resume)
    func fetchResumes()
}

final class ResumeViewModel: ObservableObject {
    var dataManager: DataManager
    
    init(dataManager: DataManager = LocalDataManager.shared) {
        self.dataManager = dataManager
    }
}

extension ResumeViewModel: ResumeViewModelProtocol {
    func addNewResume(_ value: Resume) {
        dataManager.addResume(value)
    }
    
    func fetchResumes() {
        print(dataManager.fetchResumeList())
        
    }
}

struct ResumeView: View {
    @ObservedObject var viewModel: ResumeViewModel
    @State var resume: Resume
    var body: some View {
        List(resume.sections, id: \.self) { section in
            NavigationLink {
                PersonalInfoView(personalInfo: $resume.personalInfo)
            } label: {
                Text(section)
                    .padding()
            }
        }
        .navigationTitle("Resume")
        .toolbar(content: {
            Button {
                viewModel.addNewResume(resume)
                viewModel.fetchResumes()
            } label: {
                Text("Save")
            }
            
        })
    }
}

struct ResumeView_Previews: PreviewProvider {
    static var previews: some View {
        ResumeView(viewModel: ResumeViewModel(), resume: Resume())
    }
}
