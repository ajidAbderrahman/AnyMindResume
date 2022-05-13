//
//  PersonalInfo.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 13/5/2022.
//

import Foundation

class PersonalInfo: ResumeSection, ObservableObject {
    var title: String {
        "Personal Info"
    }
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var mobileNumber: String = ""
    @Published var emailAddress: String = ""
    @Published var address: String = ""
    
}

extension PersonalInfo: CustomStringConvertible {
    var description: String {
        """
            First Name: \(firstName)\n
            Last Name: \(lastName)\n
            Mobile: \(mobileNumber)\n
            Email: \(emailAddress)\n
            Address: \(address)
        """
    }
}
