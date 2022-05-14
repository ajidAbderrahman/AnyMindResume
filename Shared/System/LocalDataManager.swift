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
            return resumeMOs.map { $0.convertToResume() }
        case .failure(let error):
            fatalError(error.localizedDescription)
        }
    }
    
    func addResume(_ value: Resume) {
        let entity = ResumeMO.entity()
        let newResume = ResumeMO(entity: entity, insertInto: dbHelper.context)
        let personalInfoEntity = PersonalInfoMO.entity()
        let newPersonalInfo = PersonalInfoMO(entity: personalInfoEntity, insertInto: dbHelper.context)
        newPersonalInfo.firstName = value.personalInfo.firstName
        newPersonalInfo.lastName = value.personalInfo.lastName
        newResume.title = UUID().uuidString
        newResume.personalInfo = newPersonalInfo
        dbHelper.create(newResume)
    }
}
