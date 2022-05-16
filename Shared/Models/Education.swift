//
//  Education.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 16/5/2022.
//

import Foundation

struct Education {
    
    var degree: String
    var passingYear: String
    var gradeAverage: String
}

extension Education {
    
    init() {
        self.init(degree: "", passingYear: "", gradeAverage: "")
    }
}
