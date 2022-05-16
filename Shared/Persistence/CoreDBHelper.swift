//
//  DBHelper+CoreData.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 14/5/2022.
//

import CoreData

class CoreDBHelper {
    static let shared = CoreDBHelper()
    
    var context: NSManagedObjectContext { persistentContainer.viewContext }
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "db_model_v1")
        container.viewContext.mergePolicy = NSMergePolicy(merge: .mergeByPropertyObjectTrumpMergePolicyType)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
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
    
    func fetchFirst<T: NSManagedObject>(_ objectType: T.Type, predicate: NSPredicate?) -> Result<T?, Error> {
        let request = objectType.fetchRequest()
        request.predicate = predicate
        request.fetchLimit = 1
        do {
            let result = try context.fetch(request) as? [T]
            return .success(result?.first)
        } catch {
            return .failure(error)
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
