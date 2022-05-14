//
//  ResumeView.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 12/5/2022.
//

import SwiftUI

protocol ResumeViewModel {
    func addNewResume(_ value: Resume)
}

struct ResumeView: View {
    @ObservedObject private(set) var viewModel: ViewModel
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
            } label: {
                Text("Save")
            }
            
        })
    }
}

//MARK: ViewModel
extension ResumeView {
    
    class ViewModel: ObservableObject, ResumeViewModel {
        
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
