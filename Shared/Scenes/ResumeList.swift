//
//  ResumeList.swift
//  Shared
//
//  Created by Abderrahman Ajid on 11/5/2022.
//

import SwiftUI
import Resolver

// MARK: Resumes View
struct ResumeList: View {
    
    @ObservedObject private(set) var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .trailing) {
                List(viewModel.resumes, id: \.title) { resume in
                    ResumeRow(resume: resume)
                }
                addResume()
                    .padding()
            }
            .onAppear {
                viewModel.loadResumes()
            }
            .navigationTitle("Resumes")
        }
    }
    
    private func addResume() -> NavigationLink<Text, ResumeDetails> {
        // TODO: add request for user to set resume title
        return NavigationLink {
            ResumeDetails(
                viewModel: ResumeDetails.ViewModel(
                    resume: Resume(title: "New Resume")
                )
            )
        } label: {
            Text("Add")
        }
    }
}

// MARK: ViewModel
extension ResumeList {
    class ViewModel: ObservableObject {
        
        @Injected var persistanceManager: DataRepo
        @Published var resumes: [Resume] = []
        
        func loadResumes() {
            resumes = persistanceManager.fetchResumeList()
        }
    }
    
}

//MARK: Resumes View Preview
struct ResumeList_Previews: PreviewProvider {
    static var previews: some View {
        ResumeList(
            viewModel: ResumeList.ViewModel()
        )
    }
}

// MARK: Resume Row
struct ResumeRow: View {
    
    let resume: Resume
    
    var body: some View {
        NavigationLink {
            ResumeDetails(viewModel: ResumeDetails.ViewModel(resume: resume))
        } label: {
            Text(resume.title)
                .padding()
        }
    }
}

//MARK: Resumes View Preview
struct ResumeRow_Previews: PreviewProvider {
    static var previews: some View {
        ResumeRow(resume: Resume(title: "Resume Example"))
            .previewLayout(.sizeThatFits)
    }
}
