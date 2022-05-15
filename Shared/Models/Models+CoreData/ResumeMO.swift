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
    
    convenience init(insertInto context: NSManagedObjectContext, resume: Resume) {
        self.init(entity: ResumeMO.entity(), insertInto: context)
        title = resume.title
        personalInfo = PersonalInfoMO(insertInto: context, personalInfo: resume.personalInfo)
        skills = SkillsMO(insertInto: context, skills: resume.skills)
    }
}

extension ResumeMO {
    var toPresentationModel: Resume {
        Resume(
            title: title,
            personalInfo: personalInfo.toPresentationModel,
            skills: skills.toPresentationModel
        )
    }
}
