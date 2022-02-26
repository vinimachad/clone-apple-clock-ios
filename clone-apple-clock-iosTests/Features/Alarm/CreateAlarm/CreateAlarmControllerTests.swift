//
//  CreateAlarmControllerTests.swift
//  clone-apple-clock-iosTests
//
//  Created by Vinicius Galhardo Machado on 25/02/22.
//

import Foundation

import XCTest
@testable import clone_apple_clock_ios

class CreateAlarmControllerTests: XCTestCase {
    
    var sut: CreateAlarmController<CreateAlarmViewModelMock>!
    var viewModelMock: CreateAlarmViewModelMock!
    var delegateMock: CreateAlarmControllerDelegateMock!
    
    override func setUp() {
        viewModelMock = CreateAlarmViewModelMock()
        delegateMock = CreateAlarmControllerDelegateMock()
        sut = CreateAlarmController(viewModel: viewModelMock, delegate: delegateMock)
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UINavigationController(rootViewController: sut)
        window.makeKeyAndVisible()
        
        _ = sut.view
    }
    
    func test_bind_whenViewModelInvokeOnSuccessToSaveAlarm_expectInvokeReturnNavigation() {
        viewModelMock.onSuccessToSaveAlarm?()
        XCTAssertEqual(delegateMock.$invokeReturnNavigation.count, 1)
    }
}

