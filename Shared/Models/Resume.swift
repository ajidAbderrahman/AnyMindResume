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
    case projects = "Projects"
}

struct Resume {
    var title: String
    var personalInfo: PersonalInfo = PersonalInfo()
    var skills: [Skill] = []
    var works: [Work] = []
    var educations: [Education] = []
    var projects: [Project] = []
    
    var sections: [ResumeSection] {
        ResumeSection.allCases
    }
}
