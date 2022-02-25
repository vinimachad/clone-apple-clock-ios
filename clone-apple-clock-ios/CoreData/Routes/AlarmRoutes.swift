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
}

class AlarmRoutes: AlarmRoutesProtocol {
    
    // MARK: - Private properties
    
    private var provider = Provider()
    
    // MARK: - AlarmRoutesProtocol
    
    func createAlarm(completion: ((Result<Void, Error>) -> Void)?) {
        provider.saveEntity(completion: completion)
    }
}
