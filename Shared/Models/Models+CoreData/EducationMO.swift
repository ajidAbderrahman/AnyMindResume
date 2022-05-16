//
//  EducationMO.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 16/5/2022.
//

import CoreData

@objc(EducationMO)
final class EducationMO: NSManagedObject {
    
    @NSManaged var degree: String
    @NSManaged var gradeAverage: String
    @NSManaged var passingYear: String
    @NSManaged var resumes: NSSet?
    
    convenience init(insertInto context: NSManagedObjectContext, education: Education) {
        self.init(entity: EducationMO.entity(), insertInto: context)
        degree = education.degree
        gradeAverage = education.gradeAverage
        passingYear = education.passingYear
    }
}

extension EducationMO {
    var toPresentationModel: Education {
        Education(
            degree:  degree,
            passingYear: passingYear,
            gradeAverage: gradeAverage
        )
    }
}
