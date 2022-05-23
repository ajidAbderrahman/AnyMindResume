//
//  ResumesView.swift
//  Shared
//
//  Created by Abderrahman Ajid on 11/5/2022.
//

import SwiftUI
import Resolver

// MARK: Resumes View
struct ResumesView: View {
    
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
    
    private func addResume() -> NavigationLink<Text, ResumeView> {
        // TODO: add request for user to set resume title
        return NavigationLink {
            ResumeView(
                viewModel: ResumeView.ViewModel(
                    resume: Resume(title: "New Resume")
                )
            )
        } label: {
            Text("Add")
        }
    }
}

// MARK: ViewModel
extension ResumesView {
    class ViewModel: ObservableObject {
        
        @Injected var persistanceManager: DataRepo
        @Published var resumes: [Resume] = []
        
        func loadResumes() {
            resumes = persistanceManager.fetchResumeList()
        }
    }
    
}

//MARK: Resumes View Preview
struct ResumesView_Previews: PreviewProvider {
    static var previews: some View {
        ResumesView(
            viewModel: ResumesView.ViewModel()
        )
    }
}

// MARK: Resume Row
struct ResumeRow: View {
    
    let resume: Resume
    
    var body: some View {
        NavigationLink {
            ResumeView(viewModel: ResumeView.ViewModel(resume: resume))
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
