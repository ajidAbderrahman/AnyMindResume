//
//  ContentView.swift
//  Shared
//
//  Created by Abderrahman Ajid on 11/5/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private(set) var viewModel: ViewModel
    @State private var item: ActivityItem?
    var body: some View {
        NavigationView {
            VStack(alignment: .trailing) {
                List(viewModel.resumes, id: \.title) { resume in
                    NavigationLink {
                        ResumeView(viewModel: ResumeView.ViewModel(), resume: resume)
                    } label: {
                        Text(resume.title)
                    }
                    .swipeActions {
                        Button {
                            item = ActivityItem(
                                items: ResumePDFCreator(resume)
                                    .resumePDF?
                                    .dataRepresentation()
                            )
                        } label: {
                            Image(systemName: "square.and.arrow.up.fill")
                                .resizable()
                        }
                        .frame(width: 40, height: 40, alignment: .leading)
                    }
                }
                NavigationLink {
                    ResumeView(viewModel: ResumeView.ViewModel(), resume: Resume())
                } label: {
                    Image(systemName: "doc.fill.badge.plus")
                        .resizable()
                }
                .frame(width: 40,height: 40, alignment: .trailing)
                .padding()
            }
            .onAppear {
                viewModel.fetchResumes()
            }
            .activitySheet($item)
            .navigationTitle("Resumes")
        }
    }
}

//MARK: ViewModel
extension ContentView {
    
    class ViewModel: ObservableObject {
        
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
