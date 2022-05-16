//
//  Resume.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 12/5/2022.
//

import Foundation

enum ResumeSection: String, CaseIterable {
    case personalInfo = "Personal Info"
    case skills = "Skills"
    case works = "Works"
    case educations = "Educations"
}

struct Resume {
    var title: String
    var personalInfo: PersonalInfo
    var skills: [Skill]
    var works: [Work]
    var educations: [Education]
    
    var sections: [ResumeSection] {
        ResumeSection.allCases
    }
}

extension Resume {
    
    init() {
        self.init(
            title: UUID().uuidString,
            personalInfo: PersonalInfo(),
            skills: [],
            works: [],
            educations: []
        )
    }
}
