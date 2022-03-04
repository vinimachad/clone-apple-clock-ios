//
//  AlarmRoutes.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 19/02/22.
//

import Foundation
import CoreData

protocol AlarmRoutesProtocol {
    func createAlarm(completion: ((Result<Void, Error>) -> Void)?)
    func getAlarms<T: NSManagedObject>(name: String, completion: ((Result<[T], Error>) -> Void)?)
    func deleteAlarm<T: NSManagedObject>(objc: T, completion: ((Result<Void, Error>) -> Void)?)
}

class AlarmRoutes: AlarmRoutesProtocol {
    
    // MARK: - Private properties
    
    private var provider = Provider()
    
    // MARK: - AlarmRoutesProtocol
    
    func createAlarm(completion: ((Result<Void, Error>) -> Void)?) {
        provider.saveEntity(completion: completion)
    }
    
    func getAlarms<T: NSManagedObject>(name: String, completion: ((Result<[T], Error>) -> Void)?) {
        provider.getEntityProperties(name: name, completion: completion)
    }
    
    func deleteAlarm<T: NSManagedObject>(objc: T, completion: ((Result<Void, Error>) -> Void)?) {
        provider.deleteProperty(objc: objc, completion: completion)
    }
}
