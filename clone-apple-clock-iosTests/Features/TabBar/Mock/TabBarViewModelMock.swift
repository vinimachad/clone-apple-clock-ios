//
//  TabBarViewModelMock.swift
//  clone-apple-clock-iosTests
//
//  Created by Vinicius Galhardo Machado on 10/02/22.
//

import Foundation
@testable import clone_apple_clock_ios
import UIKit

class TabBarViewModelMock: TabBarProtocol {
    
    @Spy var invokedDidSelectTabItem: Void?
    
    var tabs: [UITabBarItem] = []
    var firstSelectedItem: UITabBarItem = UITabBarItem()
    var onSelectedTabItem: ((Tab) -> Void)?
    
    func didSelectTabItem(_ tag: Int) {
        invokedDidSelectTabItem = ()
    }
}
