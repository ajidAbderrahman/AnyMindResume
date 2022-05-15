//
//  PersonalInfo.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 13/5/2022.
//

import Foundation
import UIKit

struct PersonalInfo {
    
    var image: UIImage?
    var firstName: String
    var lastName: String
    var mobile: String
    var email: String
    var address: String
    var yearsOfExperience: String
    var objectives: String
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    
}

extension PersonalInfo {
    
    init() {
        
        self.init(
            image: nil,
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
