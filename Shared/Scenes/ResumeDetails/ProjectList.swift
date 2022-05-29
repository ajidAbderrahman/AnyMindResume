//
//  ProjectList.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 16/5/2022.
//

import SwiftUI

struct ProjectList: View {
    @Binding var projects: Projects
    var body: some View {
        List {
            ForEach(projects.indices, id: \.self) { index in
                VStack(alignment: .leading) {
                    HStack {
                        TextField("Project Name", text: $projects[index].name)
                            .textFieldStyle(.roundedBorder)
                        TextField("Team Size", text: $projects[index].teamSize)
                            .textFieldStyle(.roundedBorder)
                    }
                    TextField("Role", text: $projects[index].teamSize)
                        .textFieldStyle(.roundedBorder)
                    TextField("Technology used", text: $projects[index].usedTech)
                        .textFieldStyle(.roundedBorder)
                    Section("Project Summary") {
                        TextEditor(text: $projects[index].summary)
                            .frame(height: 150, alignment: .center)
                            .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.secondary).opacity(0.2))
                    }
                }
                .padding()
            }
            .onDelete {
                projects.remove(atOffsets: $0)
            }
        }
        .navigationTitle("Projects")
        .toolbar(
            content: {
                HStack {
                    Button {
                        projects.append(Project())
                    } label: {
                        Text("Add")
                    }
                    EditButton()
                }
            }
        )
    }
}

struct ProjectList_Previews: PreviewProvider {
    static var previews: some View {
        ProjectList(projects: Binding<Projects>.constant([]))
    }
}
