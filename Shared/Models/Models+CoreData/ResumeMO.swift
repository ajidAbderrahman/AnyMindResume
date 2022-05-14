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
}

extension ResumeMO {
    func convertToResume() -> Resume {
        Resume(
            title: title,
            personalInfo: personalInfo.convertToPersonalInfo()
        )
    }
}
