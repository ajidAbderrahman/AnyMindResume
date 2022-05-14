//
//  DBHelper+Protocol.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 14/5/2022.
//

import Foundation

protocol DBHelper {
    associatedtype ObjectType
    
    func create(_ object: ObjectType)
    func fetch(_ objectType: ObjectType.Type) -> Result<[ObjectType], Error>
    func update(_ object: ObjectType)
    func delete(_ object: ObjectType)
}
