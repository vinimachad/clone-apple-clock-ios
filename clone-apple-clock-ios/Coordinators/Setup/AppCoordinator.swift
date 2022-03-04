//
//  AppCoordinator.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 06/02/22.
//

import Foundation
import UIKit
import CoreData

class AppCoordinator {
    
    // MARK: - Private properties
    
    private let window: UIWindow
    private(set) var childCoordinator: CoordinatorProtocol?
    
    // MARK: - Init
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        window.rootViewController = coordinatorDefault()
        window.makeKeyAndVisible()
    }
    
    private func coordinatorDefault() -> UIViewController {
        let coordinator = ContainerCoordinator()
        childCoordinator = coordinator
        return coordinator.start()
    }
}
