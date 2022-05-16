//
//  LocalDataManager.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 14/5/2022.
//
import CoreData

class LocalDataManager {
    
    static let shared: DataManager = LocalDataManager()
    
    var dbHelper: CoreDBHelper = CoreDBHelper.shared
    
    private init() { }
    
    private func getObjectMO<T: NSManagedObject>(for predicate: NSPredicate) -> T? {
        let result = dbHelper.fetchFirst(T.self, predicate: predicate)
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
        
        
//        guard let resumeMO: ResumeMO = getObjectMO(for: NSPredicate(format: "title = %@", value.title as CVarArg)) else {
//            let newResume = ResumeMO(insertInto: dbHelper.context, resume: value)
//            dbHelper.create(newResume)
//            return
//        }
//
//        value.works.forEach { work in
//            let workMO: WorkMO? = getObjectMO(for: NSPredicate(format: "name = %@", work.name as CVarArg))
//            if let workMO = workMO {
//                guard let resumes = workMO.resumes as? Set<ResumeMO>, !resumes.contains(resumeMO) else {
//                    return
//                }
//                workMO.addToWork(resumeMO)
//            } else {
//                resumeMO.addToWorks(WorkMO(insertInto: dbHelper.context, work: work))
//            }
//        }
//
//        //resumeMO.personalInfo = PersonalInfoMO(insertInto: dbHelper.context, personalInfo: value.personalInfo)
//        resumeMO.skills = SkillsMO(insertInto: dbHelper.context, skills: value.skills)
//        dbHelper.update(resumeMO)
    }
}
