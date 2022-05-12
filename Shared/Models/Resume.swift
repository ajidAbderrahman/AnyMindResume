//
//  Resume.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 12/5/2022.
//

import Foundation

struct Resume {
    var sections: [String]
}

extension Resume {
    init() {
        self.sections = [
            "Personal Information",
            "Work Summary",
            "Skills",
            "Education Details",
            "Project Details"
        ]
    }
}
