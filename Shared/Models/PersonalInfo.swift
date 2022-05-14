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
    var mobile: String
    var email: String
    var address: String
    var yearsOfExperience: String
    var objectives: String
    
}

extension PersonalInfo {
    
    init() {
        
        self.init(
            firstName: "",
            lastName: "",
            mobile: "",
            email: "",
            address: "",
            yearsOfExperience: "",
            objectives: ""
        )
    }
}
