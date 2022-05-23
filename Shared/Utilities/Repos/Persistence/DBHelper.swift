//
//  DBHelper+Protocol.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 14/5/2022.
//

protocol DBHelper {
    associatedtype ObjectType
    
    func create(_ object: ObjectType)
    func fetch(_ objectType: ObjectType.Type) -> Result<[ObjectType], Error>
    func delete(_ object: ObjectType)
}

// MARK: CoreData helper
import CoreData

class CoreDBHelper {
    
    var context: NSManagedObjectContext {
        container.viewContext
    }
    
    private let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "db_model_v1")
        container.viewContext.mergePolicy = NSMergePolicy(merge: .mergeByPropertyObjectTrumpMergePolicyType)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}

extension CoreDBHelper: DBHelper {
    
    func create(_ object: NSManagedObject) {
        do {
            try context.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func fetch<T: NSManagedObject>(_ objectType: T.Type) -> Result<[T], Error> {
        let request = objectType.fetchRequest()
        do {
            let result = try context.fetch(request)
            return .success(result as? [T] ?? [])
        } catch {
            return .failure(error)
        }
    }
    
    func delete(_ object: NSManagedObject) {
        context.delete(object)
    }
}
