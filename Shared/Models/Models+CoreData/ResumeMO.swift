//
//  ResumeMO.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 14/5/2022.
//

import CoreData

@objc(ResumeMO)
final class ResumeMO: NSManagedObject {
    
    @NSManaged var title: String
    @NSManaged var personalInfo: PersonalInfoMO
    @NSManaged var skills: SkillsMO
    @NSManaged var works: NSSet?
    
    convenience init(insertInto context: NSManagedObjectContext, resume: Resume) {
        self.init(entity: ResumeMO.entity(), insertInto: context)
        title = resume.title
        personalInfo = PersonalInfoMO(insertInto: context, personalInfo: resume.personalInfo)
        skills = SkillsMO(insertInto: context, skills: resume.skills)
        works = NSSet(array: resume.works.map { WorkMO(insertInto: context, work: $0) })
    }
}

// MARK: Generated accessors for works
extension ResumeMO {

    @objc(addWorksObject:)
    @NSManaged public func addToWorks(_ value: WorkMO)

    @objc(removeWorksObject:)
    @NSManaged public func removeFromWorks(_ value: WorkMO)

    @objc(addWorks:)
    @NSManaged public func addToWorks(_ values: NSSet)

    @objc(removeWorks:)
    @NSManaged public func removeFromWorks(_ values: NSSet)

}

extension ResumeMO {
    var toPresentationModel: Resume {
        Resume(
            title: title,
            personalInfo: personalInfo.toPresentationModel,
            skills: skills.toPresentationModel,
            works: (works as? Set<WorkMO>)?.map { $0.toPresentationModel } ?? []
        )
    }
}
