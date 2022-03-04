//
//  ContainerCoordinator.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 06/02/22.
//

import Foundation
import UIKit
import CoreData

class ContainerCoordinator: CoordinatorProtocol {
    
    // MARK: - Public properties
    
    var childDelegate: ChildCoordinatorDelegate?
    var childCoordinator: CoordinatorProtocol?
    
    var containerViewController: UIViewController {
        navigationController
    }
    
    // MARK: - Private properties
    
    private var navigationController = UINavigationController()

    // MARK: - Lazy coordinators
    
    private lazy var alarmCoordinator: AlarmCoordinator = AlarmCoordinator()

    // MARK: - Start
    
    func start() -> UIViewController {
        let vc = ContainerFactory.container(delegate: self)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.setViewControllers([vc], animated: true)
        return navigationController
    }
}

extension ContainerCoordinator: TabBarControllerDelegate {
    
    func getControllerByTab(_ tab: Tab) -> UIViewController {
        switch tab {
        case .worldClock:
            let cv = UIViewController()
            cv.view.backgroundColor = .green
            return cv
        case .alarm:
            childCoordinator = alarmCoordinator
            return alarmCoordinator.start()
        case .stopWatch:
            let cv = UIViewController()
            cv.view.backgroundColor = .blue
            return cv
        case .timer:
            let cv = UIViewController()
            cv.view.backgroundColor = .purple
            return cv
        }
    }
}
