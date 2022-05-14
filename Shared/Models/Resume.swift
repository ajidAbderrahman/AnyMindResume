//
//  Resume.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 12/5/2022.
//

import Foundation

struct Resume {
    var title: String
    var personalInfo: PersonalInfo
    
    var sections: [String] {
        [personalInfo.title]
    }
}

extension Resume {
    init() {
        self.init(
            title: UUID().uuidString,
            personalInfo: PersonalInfo()
        )
    }
}
