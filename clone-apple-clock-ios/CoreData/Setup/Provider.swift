//
//  Provider.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 19/02/22.
//

import Foundation
import CoreData

protocol ProviderProtocol {
    func getEntityProperties<T: NSManagedObject>(name: String, completion: ((Result<[T], Error>) -> Void)?)
    func saveEntity(completion: ((Result<Void, Error>) -> Void)?)
}

class Provider: ProviderProtocol {
    
    // MARK: - Get
    
    func getEntityProperties<T: NSManagedObject>(name: String, completion: ((Result<[T], Error>) -> Void)?) {
        do {
            let result = try PersistContainer.shared.context.fetch(NSFetchRequest<T>(entityName: name) )
            completion?(.success(result))
        } catch let error {
            completion?(.failure(error))
        }
    }
    
    // MARK: - Create
    
    func saveEntity(completion: ((Result<Void, Error>) -> Void)?) {
        do {
            try PersistContainer.shared.context.save()
            completion?(.success(()))
        } catch let error {
            completion?(.failure(error))
        }
    }
    
}
