//
//  SkillsView.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 14/5/2022.
//

import SwiftUI

struct SkillsView: View {
    @Binding var skills: Skills
    @State private var skill = ""
    var body: some View {
        VStack {
            HStack {
                TextField("Skill", text: $skill)
                    .onSubmit {
                        addSkill()
                    }
                    .textFieldStyle(.roundedBorder)
                Button {
                    addSkill()
                } label: {
                    Image(systemName: "plus.app.fill")
                        .resizable()
                }
                .frame(width: 35, height: 35, alignment: .center)
            }
            .padding()
            List {
                ForEach(skills.elements,id: \.self) { skill in
                    Text(skill)
                }
                .onDelete {
                    skills.elements.remove(atOffsets: $0)
                }
                .onMove(perform: move)
            }
            .toolbar {
                EditButton()
            }
        }
        .navigationTitle("Skills")
    }
    
    private func move(from source: IndexSet, to destination: Int) {
        skills.elements.move(fromOffsets: source, toOffset: destination)
        }
    
    private func addSkill() {
        guard !skill.isEmpty else { return }
        skills.elements.append(skill)
        skill = ""
    }
}

struct SkillsView_Previews: PreviewProvider {
    static var previews: some View {
        SkillsView(skills: Binding<Skills>.constant(Skills()))
    }
}
