//
//  PersonalInfo.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 13/5/2022.
//

import Foundation

struct PersonalInfo {
    var firstName: String
    var lastName: String
    
    var title: String {
        "Personal Info"
    }
}

extension PersonalInfo {
    init() {
        self.init(firstName: "", lastName: "")
    }
}
