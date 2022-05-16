//
//  WorkMO.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 15/5/2022.
//

import CoreData

@objc(WorkMO)
final class WorkMO: NSManagedObject {
    
    @NSManaged var name: String
    @NSManaged var startDate: Date
    @NSManaged var endDate: Date
    @NSManaged var resumes: NSSet?
    
    convenience init(insertInto context: NSManagedObjectContext, work: Work) {
        self.init(entity: WorkMO.entity(), insertInto: context)
        name = work.name
        startDate = work.startDate
        endDate = work.endDate
    }
}

extension WorkMO {
    var toPresentationModel: Work {
        Work(
            name:  name,
            startDate: startDate,
            endDate: endDate
        )
    }
}
