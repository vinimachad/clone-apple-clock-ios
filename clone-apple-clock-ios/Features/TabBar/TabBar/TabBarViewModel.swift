//
//  TabBarViewModel.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 06/02/22.
//

import Foundation
import UIKit

protocol TabBarProtocol: TabBarViewModelProtocol {
    var onSelectedTabItem: ((Tab) -> Void)? { get set }
}

class TabBarViewModel {
    
    // MARK: - Public properties
    
    var onSelectedTabItem: ((Tab) -> Void)?
    
    lazy var tabs: [UITabBarItem] = {
        Tab.allCases.enumerated()
            .map { UITabBarItem(title: $0.element.title, image: $0.element.image, tag: $0.offset) }
    }()
    
    var firstSelectedItem: UITabBarItem {
        callingFirstSelectedTabItem()
    }
    
    // MARK: - Private properties
    
    private func callingFirstSelectedTabItem() -> UITabBarItem {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.onSelectedTabItem?(Tab.allCases[1])
        }
        return tabs[1]
    }
}

// MARK: - TabBarProtocol

extension TabBarViewModel: TabBarProtocol {
    
    func didSelectTabItem(_ tag: Int) {
        onSelectedTabItem?(Tab.allCases[tag])
    }
}
