//
//  PersonalInfoMO.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 14/5/2022.
//

import CoreData

@objc(PersonalInfoMO)
final class PersonalInfoMO: NSManagedObject {
    
    @NSManaged var firstName: String
    @NSManaged var lastName: String
    
    convenience init(insertInto context: NSManagedObjectContext, personalInfo: PersonalInfo) {
        self.init(entity: PersonalInfoMO.entity(), insertInto: context)
        firstName = personalInfo.firstName
        lastName = personalInfo.lastName
    }
}

extension PersonalInfoMO {
    func convertToPersonalInfo() -> PersonalInfo {
        PersonalInfo(firstName: firstName, lastName: lastName)
    }
}
