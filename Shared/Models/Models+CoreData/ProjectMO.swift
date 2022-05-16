//
//  ProjectMO.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 16/5/2022.
//

import CoreData

@objc(ProjectMO)
final class ProjectMO: NSManagedObject {
    
    @NSManaged var name: String
    @NSManaged var teamSize: String
    @NSManaged var summary: String
    @NSManaged var usedTech: String
    @NSManaged var role: String
    @NSManaged var resumes: NSSet?
    
    convenience init(insertInto context: NSManagedObjectContext, project: Project) {
        self.init(entity: ProjectMO.entity(), insertInto: context)
        name = project.name
        teamSize = project.teamSize
        summary = project.summary
        usedTech = project.usedTech
        role = project.role
    }
}

extension ProjectMO {
    var toPresentationModel: Project {
        Project(
            name: name,
            teamSize: teamSize,
            summary: summary,
            usedTech: usedTech,
            role: role
        )
    }
}
