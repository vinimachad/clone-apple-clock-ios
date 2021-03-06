//
//  AlarmCoordinator.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 13/02/22.
//

import Foundation
import UIKit

class AlarmCoordinator: CoordinatorProtocol {
    
    // MARK: - Public properties
    
    var childDelegate: ChildCoordinatorDelegate?
    var childCoordinator: CoordinatorProtocol?
    
    var containerViewController: UIViewController {
        navigationController
    }
    
    // MARK: - Private properties
    
    private var navigationController = UINavigationController()
    
    // MARK: - Start
    
    func start() -> UIViewController {
        let vc = ContainerFactory.alarm(delegate: self)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.setViewControllers([vc], animated: true)
        return navigationController
    }
}

extension AlarmCoordinator: AlarmControllerDelegate {
    
    func presentCreateAlarm() {
        let coordinator = CreateAlarmCoordinator()
        coordinator.childDelegate = childDelegate
        childCoordinator = coordinator
        navigationController.present(coordinator.start(), animated: true)
    }
}
