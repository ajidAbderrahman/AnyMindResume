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
    @NSManaged var resumes: NSSet?
    
    convenience init(insertInto context: NSManagedObjectContext, work: Work) {
        self.init(entity: WorkMO.entity(), insertInto: context)
        name = work.name
    }
}

// MARK: Generated accessors for work
extension WorkMO {

    @objc(addWorkObject:)
    @NSManaged public func addToWork(_ value: ResumeMO)

    @objc(removeWorkObject:)
    @NSManaged public func removeFromWork(_ value: ResumeMO)

    @objc(addWork:)
    @NSManaged public func addToWork(_ values: NSSet)

    @objc(removeWork:)
    @NSManaged public func removeFromWork(_ values: NSSet)

}


extension WorkMO {
    var toPresentationModel: Work {
        Work(
            name:  name
        )
    }
}
