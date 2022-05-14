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
}

struct Resume {
    var title: String = UUID().uuidString
    var personalInfo: PersonalInfo = PersonalInfo()
    var skills: Skills = Skills()
    
    var sections: [ResumeSection] {
        ResumeSection.allCases
    }
}
