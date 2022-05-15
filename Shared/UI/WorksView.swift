//
//  WorksView.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 15/5/2022.
//

import SwiftUI

struct WorksView: View {
    @Binding var works: [Work]
    var body: some View {
        VStack {
            List(works, id: \.name) { work in
                Text(work.name)
            }
            Button {
                let work = Work(name: "Work1")
                works.append(work)
            } label: {
                Text("Add Works")
            }
        }
    }
}

struct WorksView_Previews: PreviewProvider {
    static var previews: some View {
        WorksView(works: Binding<[Work]>.constant([]))
    }
}
