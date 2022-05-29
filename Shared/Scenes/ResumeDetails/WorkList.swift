//
//  WorkList.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 15/5/2022.
//

import SwiftUI

struct WorkList: View {
    @Binding var works: Works
    var body: some View {
        VStack {
            List {
                ForEach(works.indices, id: \.self) { index in
                    VStack {
                        TextField("Company Name", text: $works[index].name)
                            .textFieldStyle(.roundedBorder)
                        DatePicker("Start Date", selection: $works[index].startDate, displayedComponents: .date)
                        DatePicker("End Date", selection: $works[index].endDate, displayedComponents: .date)
                    }
                    .padding()
                }
                .onDelete {
                    works.remove(atOffsets: $0)
                }
            }
        }
        .navigationTitle("Works")
        .toolbar(
            content: {
                HStack {
                    Button {
                        works.append(Work())
                    } label: {
                        Text("Add")
                    }
                    EditButton()
                }
            }
        )
    }
}

struct WorkList_Previews: PreviewProvider {
    static var previews: some View {
        WorkList(works: Binding<Works>.constant([]))
    }
}
