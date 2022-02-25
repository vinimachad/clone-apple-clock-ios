//
//  ContainerFactory.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 07/02/22.
//

import Foundation
import UIKit
import CoreData

enum ContainerFactory {
    
    static func container(delegate: TabBarControllerDelegate?) -> UIViewController {
        let viewModel = TabBarViewModel()
        return TabBarController(viewModel: viewModel, delegate: delegate)
    }
    
    static func alarm(delegate: AlarmControllerDelegate?) -> UIViewController {
        let vm = AlarmViewModel()
        return AlarmController(viewModel: vm, delegate: delegate)
    }
}
