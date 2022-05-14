//
//  Resume.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 12/5/2022.
//

import Foundation

struct Resume {
    var title: String = UUID().uuidString
    var personalInfo: PersonalInfo = PersonalInfo()
    var skills: Skills = Skills()
    
    var sections: [String] {
        [personalInfo.title, skills.title]
    }
}
