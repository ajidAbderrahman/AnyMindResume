//
//  Project.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 16/5/2022.
//

import Foundation

struct Project {
    
    var name: String
    var teamSize: String
    var summary: String
    var usedTech: String
    var role: String
}

extension Project {
    
    init() {
        self.init(name: "", teamSize: "", summary: "", usedTech: "", role: "")
    }
}
