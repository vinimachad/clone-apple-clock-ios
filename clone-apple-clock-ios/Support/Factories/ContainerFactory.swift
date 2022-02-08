//
//  ContainerFactory.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 07/02/22.
//

import Foundation
import UIKit

enum ContainerFactory {
    
    static func container() -> UIViewController {
        let viewModel = TabBarViewModel()
        return TabBarController(viewModel: viewModel)
    }
}
