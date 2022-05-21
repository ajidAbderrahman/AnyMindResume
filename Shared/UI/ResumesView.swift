//
//  ResumesView.swift
//  Shared
//
//  Created by Abderrahman Ajid on 11/5/2022.
//

import SwiftUI

struct ResumesView: View {
    @ObservedObject private(set) var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .trailing) {
                List(viewModel.resumes, id: \.title) { resume in
                    resumesRow(resume)
                }
                addResume()
                .padding()
            }
            .onAppear {
                viewModel.reloadResumes()
            }
            .navigationTitle("Resumes")
        }
    }
    
    private func resumesRow(_ resume: Resume) -> NavigationLink<Text, ResumeView> {
        return NavigationLink {
            ResumeView(viewModel: ResumeView.ViewModel(), resume: resume)
        } label: {
            Text(resume.title)
        }
    }
    
    private func addResume() -> NavigationLink<Text, ResumeView> {
        return NavigationLink {
            ResumeView(viewModel: ResumeView.ViewModel(), resume: Resume(title: "Title"))
        } label: {
            Text("Add")
        }
    }
}

//MARK: ViewModel
extension ResumesView {
    
    class ViewModel: ObservableObject {
        private let dataManager: DataManager
        @Published var resumes: [Resume]
        
        init(resumes: [Resume]) {
            self.resumes = resumes
            self.dataManager = LocalDataManager.shared
        }
        
        func reloadResumes() {
            resumes = dataManager.fetchResumeList()
        }
    }
    
}

//MARK: Preview
struct ResumesView_Previews: PreviewProvider {
    static var previews: some View {
        ResumesView(viewModel: ResumesView.ViewModel(resumes: [
            Resume(title: "Resume Title")
        ]))
    }
}
