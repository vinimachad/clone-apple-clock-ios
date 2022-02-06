//
//  ContainerCoordinator.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 06/02/22.
//

import Foundation
import UIKit

class ContainerCoordinator: CoordinatorProtocol {
    
    var childDelegate: ChildCoordinatorDelegate?
    var childCoordinator: CoordinatorProtocol?
    
    var containerViewController: UIViewController {
        navigationController
    }
    
    private var navigationController = UINavigationController()
    
    func start() -> UIViewController {
        let vc = UIViewController()
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.setViewControllers([vc], animated: true)
        return navigationController
    }
}
