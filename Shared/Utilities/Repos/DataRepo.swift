//
//  DataRepo.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 14/5/2022.
//

protocol DataRepo {
    func fetchResumeList() -> [Resume]
    func addResume(_ value: Resume)
}


// MARK: Persistence Repository
import CoreData

class PersistenceRepo {
    
    private let dbHelper: CoreDBHelper
    
    init(dbHelper: CoreDBHelper) {
        self.dbHelper = dbHelper
    }
    
}

extension PersistenceRepo: DataRepo {
    
    func fetchResumeList() -> [Resume] {
        let result: Result<[ResumeMO], Error> = dbHelper.fetch(ResumeMO.self)
        switch result {
        case .success(let resumeMOs):
            return resumeMOs.map { $0.toPresentationModel }
        case .failure(let error):
            fatalError(error.localizedDescription)
        }
    }
    
    func addResume(_ value: Resume) {
        
        let newResume = ResumeMO(insertInto: dbHelper.context, resume: value)
        dbHelper.create(newResume)
    }
}
