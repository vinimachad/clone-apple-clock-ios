//
//  AlarmControllerTests.swift
//  clone-apple-clock-iosTests
//
//  Created by Vinicius Galhardo Machado on 25/02/22.
//

import XCTest
@testable import clone_apple_clock_ios

class AlarmControllerTests: XCTestCase {
    
    var sut: AlarmController<AlarmViewModelMock>!
    var viewModelMock: AlarmViewModelMock!
    var delegateMock: AlarmControllerDelegateMock!
    
    override func setUp() {
        viewModelMock = AlarmViewModelMock()
        delegateMock = AlarmControllerDelegateMock()
        sut = AlarmController(viewModel: viewModelMock, delegate: delegateMock)
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UINavigationController(rootViewController: sut)
        window.makeKeyAndVisible()
        
        _ = sut.view
        
    }
}
