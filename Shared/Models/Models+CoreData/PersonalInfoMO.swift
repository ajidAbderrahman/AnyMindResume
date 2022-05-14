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
    @NSManaged var mobile: String
    @NSManaged var email: String
    @NSManaged var address: String
    @NSManaged var yearsOfExperience: Double
    @NSManaged var objectives: String
    
    convenience init(insertInto context: NSManagedObjectContext, personalInfo: PersonalInfo) {
        self.init(entity: PersonalInfoMO.entity(), insertInto: context)
        firstName = personalInfo.firstName
        lastName = personalInfo.lastName
        mobile = personalInfo.mobile
        email = personalInfo.email
        address = personalInfo.address
        yearsOfExperience = Double(personalInfo.yearsOfExperience) ?? 0
        objectives = personalInfo.objectives
    }
}

extension PersonalInfoMO {
    func convertToPersonalInfo() -> PersonalInfo {
        PersonalInfo(
            firstName: firstName,
            lastName: lastName,
            mobile: mobile,
            email: email,
            address: address,
            yearsOfExperience: String(yearsOfExperience),
            objectives: objectives
        )
    }
}
