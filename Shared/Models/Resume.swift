//
//  Resume.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 12/5/2022.
//

import Foundation

struct Resume {
    var sections: [ResumeSection]
}

extension Resume {
    init() {
        self.sections = [
            PersonalInfo()
        ]
    }
}

protocol ResumeSection {
    var title: String {get}
}

struct PersonalInfo: ResumeSection {
    var title: String {
        "Personal Info"
    }
    var firstName: String
    var lastName: String
    var mobileNumber: String
    var emailAddress: String
    var address: String
    
}

extension PersonalInfo {
    init() {
        self.init(
            firstName: "",
            lastName: "",
            mobileNumber: "",
            emailAddress: "",
            address: ""
        )
    }
}
