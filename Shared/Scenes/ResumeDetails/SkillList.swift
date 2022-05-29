//
//  SkillList.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 14/5/2022.
//

import SwiftUI

struct SkillList: View {
    @Binding var skills: Skills
    @State private var skillName = ""
    var body: some View {
        VStack {
            HStack {
                TextField("Skill", text: $skillName)
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
                ForEach(skills, id: \.name) { skill in
                    Text(skill.name)
                }
                .onDelete {
                    skills.remove(atOffsets: $0)
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
        skills.move(fromOffsets: source, toOffset: destination)
        }
    
    private func addSkill() {
        guard !skillName.isEmpty else { return }
        skills.append(Skill(name: skillName))
        skillName = ""
    }
}

struct SkillList_Previews: PreviewProvider {
    static var previews: some View {
        SkillList(skills: Binding<Skills>.constant([]))
    }
}
