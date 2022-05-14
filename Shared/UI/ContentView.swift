//
//  ContentView.swift
//  Shared
//
//  Created by Abderrahman Ajid on 11/5/2022.
//

import SwiftUI

protocol ContentViewModel {
    func fetchResumes()
}

struct ContentView: View {
    @ObservedObject private(set) var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .trailing) {
                List(viewModel.resumes, id: \.title) { resume in
                    NavigationLink {
                        ResumeView(viewModel: ResumeView.ViewModel(), resume: resume)
                    } label: {
                        Text(resume.title)
                    }
                }
                NavigationLink {
                    ResumeView(viewModel: ResumeView.ViewModel(), resume: Resume())
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                }
                .frame(width: 40,height: 40, alignment: .trailing)
            }
            .navigationTitle("Resumes")
        }
        .padding()
        .onAppear {
            viewModel.fetchResumes()
        }
    }
}

//MARK: ViewModel
extension ContentView {
    
    class ViewModel: ObservableObject, ContentViewModel {
        
        @Published var resumes = [Resume]()
        
        private let dataManager: DataManager
        
        init(dataManager: DataManager = LocalDataManager.shared) {
            self.dataManager = dataManager
        }
        
        func fetchResumes() {
            resumes = dataManager.fetchResumeList()
        }
    }
}

//MARK: Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentView.ViewModel())
    }
}
