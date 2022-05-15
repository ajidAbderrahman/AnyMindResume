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
    
    private func getResumeMO(for resume: String) -> ResumeMO? {
        let predicate = NSPredicate(
            format: "title = %@",
            resume as CVarArg)
        let result = dbHelper.fetchFirst(ResumeMO.self, predicate: predicate)
        switch result {
        case .success(let resumeMO):
            return resumeMO
        case .failure(_):
            return nil
        }
    }
    
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
    
    func updateResume(_ value: Resume) {
        guard let resumeMO = getResumeMO(for: value.title) else { return }
        
    }
    
    func addWork(_ value: Work, resume: String) {
        guard let resumeMO = getResumeMO(for: resume) else { return }
        resumeMO.addToWorks(WorkMO(insertInto: dbHelper.context, work: value))
        dbHelper.update(resumeMO)
    }
}
