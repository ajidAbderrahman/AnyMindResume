//
//  ContentView.swift
//  Shared
//
//  Created by Abderrahman Ajid on 11/5/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            HStack {
                NavigationLink {
                    ResumeView(
                        viewModel: ResumeViewModel(),
                        resume: Resume()
                    )
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                }
                Spacer(minLength: 40)
                NavigationLink {
                    ResumeView(
                        viewModel: ResumeViewModel(),
                        resume: Resume()
                    )
                } label: {
                    Image(systemName: "pencil.circle.fill")
                        .resizable()
                }
            }
            .frame(width: 240, height: 100, alignment: .center)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
