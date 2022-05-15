//
//  WorksView.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 15/5/2022.
//

import SwiftUI

struct WorksView: View {
    @ObservedObject private(set) var viewModel: ViewModel
    @Binding var works: [Work]
    var body: some View {
        VStack {
            List(works, id: \.name) { work in
                Text(work.name)
            }
            Button {
                let work = Work(name: UUID().uuidString)
                works.append(work)
                viewModel.addNewWork(work)
            } label: {
                Text("Add Works")
            }
        }
    }
}

//MARK: ViewModel
extension WorksView {
    
    class ViewModel: ObservableObject {
        
        private let dataManager: DataManager
        private let resumeTitle: String
        init(dataManager: DataManager = LocalDataManager.shared, resumeTitle: String) {
            self.dataManager = dataManager
            self.resumeTitle = resumeTitle
        }
        
        func addNewWork(_ value: Work) {
            dataManager.addWork(value, resume: resumeTitle)
        }
        
    }

}

struct WorksView_Previews: PreviewProvider {
    static var previews: some View {
        WorksView(viewModel: WorksView.ViewModel(resumeTitle: ""), works: Binding<[Work]>.constant([]))
    }
}
