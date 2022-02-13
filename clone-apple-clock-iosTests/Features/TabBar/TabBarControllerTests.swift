//
//  TabBarControllerTests.swift
//  clone-apple-clock-iosTests
//
//  Created by Vinicius Galhardo Machado on 10/02/22.
//

import Foundation
import XCTest
@testable import clone_apple_clock_ios

class TabBarControllerTests: XCTestCase {
    
    var sut: TabBarController<TabBarViewModelMock>!
    var viewModelMock: TabBarViewModelMock!
    var delegateMock: TabBarControllerDelegateMock!
    
    override func setUp() {
        viewModelMock = TabBarViewModelMock()
        delegateMock = TabBarControllerDelegateMock()
        sut = TabBarController(viewModel: viewModelMock, delegate: delegateMock)
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UINavigationController(rootViewController: sut)
        window.makeKeyAndVisible()
        
        _ = sut.view
        
    }
    
    func test_bind_whenViewModelInvokedOnSelectedTabItemWithAlarm_expectInvokeGetControllerByTabAndAddController() {
        viewModelMock.onSelectedTabItem?(.alarm)
        XCTAssertEqual(delegateMock.$invokedGetControllerByTab.count, 1)
//        XCTAssertEqual(sut.childViewController, ) TODO: - Atualizar quando houver mais controlers
    }
}
