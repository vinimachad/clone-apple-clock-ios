//
//  TabBarControllerDelegateMock.swift
//  clone-apple-clock-iosTests
//
//  Created by Vinicius Galhardo Machado on 10/02/22.
//

import Foundation
@testable import clone_apple_clock_ios
import UIKit

class TabBarControllerDelegateMock: TabBarControllerDelegate {
    
    @Spy var invokedGetControllerByTab: Tab?
    
    func getControllerByTab(_ tab: Tab) -> UIViewController {
        invokedGetControllerByTab = tab
        return UIViewController()
    }
}
