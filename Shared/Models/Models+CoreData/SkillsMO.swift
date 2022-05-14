//
//  SkillsMO.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 14/5/2022.
//

import CoreData

@objc(SkillsMO)
final class SkillsMO: NSManagedObject {
    
    @NSManaged var elements: [NSString]
    
    convenience init(insertInto context: NSManagedObjectContext, skills: Skills) {
        self.init(entity: SkillsMO.entity(), insertInto: context)
        elements = skills.elements.map { NSString(string: $0) }
    }
}

extension SkillsMO {
    func convertToSkills() -> Skills {
        Skills(elements: elements.map { String($0) })
    }
}
