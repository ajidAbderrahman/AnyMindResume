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
    @NSManaged var skills: NSSet?
    @NSManaged var works: NSSet?
    @NSManaged var educations: NSSet?
    
    convenience init(insertInto context: NSManagedObjectContext, resume: Resume) {
        self.init(entity: ResumeMO.entity(), insertInto: context)
        title = resume.title
        personalInfo = PersonalInfoMO(insertInto: context, personalInfo: resume.personalInfo)
        skills = NSSet(array: resume.skills.map { SkillMO(insertInto: context, skill: $0) })
        works = NSSet(array: resume.works.map { WorkMO(insertInto: context, work: $0) })
        educations = NSSet(array: resume.educations.map { EducationMO(insertInto: context, education: $0) })
    }
}

extension ResumeMO {
    var toPresentationModel: Resume {
        Resume(
            title: title,
            personalInfo: personalInfo.toPresentationModel,
            skills: (skills as? Set<SkillMO>)?.map { $0.toPresentationModel } ?? [],
            works: (works as? Set<WorkMO>)?.map { $0.toPresentationModel } ?? [],
            educations: (educations as? Set<EducationMO>)?.map { $0.toPresentationModel } ?? []
        )
    }
}
