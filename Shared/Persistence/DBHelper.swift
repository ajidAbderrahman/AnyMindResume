//
//  DBHelper+Protocol.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 14/5/2022.
//

import Foundation

protocol DBHelper {
    associatedtype ObjectType
    associatedtype PredicateType
    
    func create(_ object: ObjectType)
    func fetchFirst(_ objectType: ObjectType.Type, predicate: PredicateType?) -> Result<ObjectType?, Error>
    func fetch(_ objectType: ObjectType.Type) -> Result<[ObjectType], Error>
    func delete(_ object: ObjectType)
}
