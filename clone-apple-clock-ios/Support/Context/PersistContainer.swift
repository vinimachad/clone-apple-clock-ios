//
//  PersistContainer.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 19/02/22.
//

import Foundation
import CoreData

protocol PersistContainerProtocol {
    var context: NSManagedObjectContext { get }
}

class PersistContainer: PersistContainerProtocol {
    
    // MARK: - Shared
    
    static var shared: PersistContainerProtocol = PersistContainer()
    
    // MARK: - Public properties
    
    var context: NSManagedObjectContext
    
    // MARK: - Private properties
    
    private let container = NSPersistentContainer(name: "ClockModel")
    
    // MARK: - Init
    
    private init() {
        self.context = container.viewContext
        self.persistStores()
    }
    
    private func persistStores() {
        container.loadPersistentStores { description, error in
                if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
    }
}
