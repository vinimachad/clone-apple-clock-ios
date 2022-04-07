//
//  RepeatDaysRoutes.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 19/03/22.
//

import Foundation
import CoreData

protocol RepeatDaysRoutesProtocol {
    func saveRepeatDays(completion: ((Result<Void, Error>) -> Void)?)
    func getRepeatDays<T: NSManagedObject>(name: String, completion: ((Result<[T], Error>) -> Void)?)
}

class RepeatDaysRoutes: RepeatDaysRoutesProtocol {
    
    // MARK: - Private properties
    
    private var provider = Provider()
    
    // MARK: - AlarmRoutesProtocol
    
    func saveRepeatDays(completion: ((Result<Void, Error>) -> Void)?) {
        provider.saveEntity(completion: completion)
    }
    
    func getRepeatDays<T: NSManagedObject>(name: String, completion: ((Result<[T], Error>) -> Void)?) {
        provider.getEntityProperties(name: name, completion: completion)
    }
}
