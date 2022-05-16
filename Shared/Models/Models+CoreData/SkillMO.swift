//
//  SkillMO.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 14/5/2022.
//

import CoreData

@objc(SkillMO)
final class SkillMO: NSManagedObject {
    
    @NSManaged var name: String
    @NSManaged var resumes: NSSet?
    
    convenience init(insertInto context: NSManagedObjectContext, skill: Skill) {
        self.init(entity: SkillMO.entity(), insertInto: context)
        name = skill.name
    }
}

extension SkillMO {
    var toPresentationModel: Skill {
        Skill(name: name)
    }
}
