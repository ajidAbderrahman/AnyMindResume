//
//  EducationList.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 16/5/2022.
//

import SwiftUI

struct EducationList: View {
    @Binding var educations: Educations
    var body: some View {
        VStack {
            List {
                ForEach(educations.indices, id: \.self) { index in
                    VStack {
                        TextField("Class (X, XII, Graduation)", text: $educations[index].degree)
                            .textFieldStyle(.roundedBorder)
                        TextField("Percentage/CGPA", text: $educations[index].gradeAverage)
                            .textFieldStyle(.roundedBorder)
                        TextField("Passing year", text: $educations[index].passingYear)
                            .textFieldStyle(.roundedBorder)
                    }
                    .padding()
                }
                .onDelete {
                    educations.remove(atOffsets: $0)
                }
            }
        }
        .navigationTitle("Works")
        .toolbar(
            content: {
                HStack {
                    Button {
                        educations.append(Education())
                    } label: {
                        Text("Add")
                    }
                    EditButton()
                }
            }
        )
    }
}

struct EducationList_Previews: PreviewProvider {
    static var previews: some View {
        EducationList(educations: Binding<Educations>.constant([]))
    }
}
