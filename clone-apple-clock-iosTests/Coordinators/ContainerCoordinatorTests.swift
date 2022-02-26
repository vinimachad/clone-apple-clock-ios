//
//  ContainerCoordinatorTests.swift
//  clone-apple-clock-iosTests
//
//  Created by Vinicius Galhardo Machado on 11/02/22.
//

import Foundation
import XCTest
@testable import clone_apple_clock_ios

class ContainerCoordinatorTests: XCTestCase {
    
    var sut: ContainerCoordinator!
    
    override func setUp() {
        sut = ContainerCoordinator()
    }
    
    func test_getControllerByTab_whenReceiveAlarmWithType_expectPassAlarmCoordinatorToChildCoordinator() {
        _ = sut.getControllerByTab(.alarm)
        XCTAssertTrue(sut.childCoordinator is AlarmCoordinator)
    }
}
