//
//  Work.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 15/5/2022.
//

import Foundation

struct Work {
    
    var name: String
    var startDate: Date
    var endDate: Date
}

extension Work {
    
    init() {
        self.init(name: "", startDate: Date(), endDate: Date())
    }
}
