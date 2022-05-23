//
//  MainApp.swift
//  Shared
//
//  Created by Abderrahman Ajid on 11/5/2022.
//

import SwiftUI

@main
struct MainApp: App {
    
    var body: some Scene {
        WindowGroup {
            ResumeList(
                viewModel: ResumeList.ViewModel()
            )
        }
    }
}
