//
//  CreateAlarmCoordinator.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 13/02/22.
//

import Foundation
import UIKit

class CreateAlarmCoordinator: CoordinatorProtocol {
    
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
        let vc = AlarmFactory.createAlarm(delegate: self)
        navigationController.modalPresentationStyle = .pageSheet
        navigationController.setViewControllers([vc], animated: true)
        return navigationController
    }
    
    // MARK: - Dismiss
    
    func returnNavigation() {
        dismiss()
    }
}

extension CreateAlarmCoordinator: CreateAlarmControllerDelegate {
    
}
