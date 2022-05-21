//
//  AnyMindResumeApp.swift
//  Shared
//
//  Created by Abderrahman Ajid on 11/5/2022.
//

import SwiftUI

@main
struct AnyMindResumeApp: App {
    let managedObjectContext = CoreDBHelper.shared.context
    var resumeList: [Resume] {
        LocalDataManager.shared.fetchResumeList()
    }
    
    var body: some Scene {
        WindowGroup {
            ResumesView(viewModel: ResumesView.ViewModel(resumes: resumeList))
                .environment(\.managedObjectContext, managedObjectContext)
        }
    }
}
