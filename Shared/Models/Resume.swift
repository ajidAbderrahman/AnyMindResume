//
//  Resume.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 12/5/2022.
//

import Foundation

class Resume: ObservableObject {
    @Published var personalInfo: PersonalInfo = PersonalInfo()
    var sections: [String] {
        [personalInfo.title]
    }
}

extension Resume: CustomStringConvertible {
    var description: String {
        """
        personal Info: \(personalInfo)
        """
    }
}

protocol ResumeSection {
    var title: String {get}
}
