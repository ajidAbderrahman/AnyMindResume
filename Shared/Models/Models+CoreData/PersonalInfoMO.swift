//
//  PersonalInfoMO.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 14/5/2022.
//

import CoreData
import UIKit

@objc(PersonalInfoMO)
final class PersonalInfoMO: NSManagedObject {
    
    @NSManaged var firstName: String
    @NSManaged var lastName: String
    @NSManaged var mobile: String
    @NSManaged var email: String
    @NSManaged var address: String
    @NSManaged var yearsOfExperience: Double
    @NSManaged var objectives: String
    @NSManaged var imageData: Data?
    @NSManaged var resume: ResumeMO?
    
    convenience init(insertInto context: NSManagedObjectContext, personalInfo: PersonalInfo) {
        self.init(entity: PersonalInfoMO.entity(), insertInto: context)
        firstName = personalInfo.firstName
        lastName = personalInfo.lastName
        mobile = personalInfo.mobile
        email = personalInfo.email
        address = personalInfo.address
        yearsOfExperience = Double(personalInfo.yearsOfExperience) ?? 0
        objectives = personalInfo.objectives
        imageData = personalInfo.image?.jpegData(compressionQuality: 0.0)
    }
}

extension PersonalInfoMO {
    
    var toPresentationModel: PersonalInfo {
        let image: UIImage? = imageData != nil ? UIImage(data: imageData!) : nil
        
        return PersonalInfo(
            image: image,
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
