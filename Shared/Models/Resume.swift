//
//  Resume.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 12/5/2022.
//

import UIKit

enum ResumeSection: String, CaseIterable {
    case personalInfo = "Personal Info"
    case skills = "Skills"
    case works = "Works"
    case educations = "Educations"
    case projects = "Projects"
}

struct Resume {

    var title: String
    var personalInfo: PersonalInfo
    var skills: Skills
    var works: Works
    var educations: Educations
    var projects: Projects

    // MARK: Personal Info
    struct PersonalInfo {
        var image: UIImage?
        var firstName, lastName, mobile, email,
            address, yearsOfExperience, objectives: String

        var fullName: String {
            "\(firstName) \(lastName)"
        }
    }

    // MARK: Skill
    struct Skill {
        var name: String
    }

    // MARK: Work
    struct Work {
        var name: String
        var startDate, endDate: Date
    }

    // MARK: Education
    struct Education {
        var degree, passingYear, gradeAverage: String
    }

    // MARK: Project
    struct Project {
        var name, teamSize, summary, usedTech, role: String
    }
}

// MARK: TYPES ALIASES
typealias PersonalInfo = Resume.PersonalInfo
typealias Skill = Resume.Skill
typealias Skills = [Skill]
typealias Work = Resume.Work
typealias Works = [Work]
typealias Education = Resume.Education
typealias Educations = [Education]
typealias Project = Resume.Project
typealias Projects = [Project]

// MARK: Convenience initializers
extension Resume {

    init(title: String) {
        self.init(title: title, personalInfo: PersonalInfo(),
                  skills: [], works: [], educations: [], projects: [])
    }

    var sections: [ResumeSection] {
        ResumeSection.allCases
    }
}

extension PersonalInfo {
    init() {
        self.init(firstName: "", lastName: "", mobile: "",
                  email: "", address: "", yearsOfExperience: "",
                  objectives: "")
    }
}

extension Work {
    init() {
        self.init(name: "", startDate: Date(), endDate: Date())
    }
}

extension Education {
    init() {
        self.init(degree: "", passingYear: "", gradeAverage: "")
    }
}

extension Project {
    init() {
        self.init(name: "", teamSize: "",
                  summary: "", usedTech: "", role: "")
    }
}
