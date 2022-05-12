//
//  ContentView.swift
//  Shared
//
//  Created by Abderrahman Ajid on 11/5/2022.
//

import SwiftUI

struct ContentView: View {
    private let resume = Resume()
    var body: some View {
        NavigationView {
            List(resume.sections, id: \.self) { section in
                NavigationLink {
                    Text(section)
                } label: {
                    Text(section)
                        .padding()
                }
            }
            .navigationTitle("Resume")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
