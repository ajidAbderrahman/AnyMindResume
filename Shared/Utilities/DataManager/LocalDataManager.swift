//
//  LocalDataManager.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 14/5/2022.
//

import Foundation

class LocalDataManager {
    
    static let shared: DataManager = LocalDataManager()
    
    var dbHelper: CoreDBHelper = CoreDBHelper.shared
    
    private init() { }
    
}

extension LocalDataManager: DataManager {
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
