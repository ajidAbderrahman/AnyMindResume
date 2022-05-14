//
//  AnyMindResumeApp.swift
//  Shared
//
//  Created by Abderrahman Ajid on 11/5/2022.
//

import SwiftUI

@main
struct AnyMindResumeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentView.ViewModel())
                .environment(\.managedObjectContext, CoreDBHelper.shared.context)
        }
    }
}
