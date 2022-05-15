//
//  DataManager+Protocol.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 14/5/2022.
//

import Foundation

protocol DataManager {
    func fetchResumeList() -> [Resume]
    func addResume(_ value: Resume)
    func addWork(_ value: Work, resume: String)
}
