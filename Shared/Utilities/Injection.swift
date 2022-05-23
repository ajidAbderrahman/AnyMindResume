//
//  Injection.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 23/5/2022.
//

import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        register { PersistenceRepo(dbHelper: resolve()) }.implements(DataRepo.self).scope(.application)
        register { CoreDBHelper() }.scope(.application)
    }
}
