//
//  AlarmCoordinatorTests.swift
//  clone-apple-clock-iosTests
//
//  Created by Vinicius Galhardo Machado on 25/02/22.
//

import Foundation
import XCTest
@testable import clone_apple_clock_ios

class AlarmCoordinatorTests: XCTestCase {
    
    var sut: AlarmCoordinator!
    
    override func setUp() {
        sut = AlarmCoordinator()
    }
    
    func test_presentCreateAlarm_whenCalled_expectChildCoordinatorAsCreateAlarmCoordinator() {
        sut.presentCreateAlarm()
        
        XCTAssertTrue(sut.childCoordinator is CreateAlarmCoordinator)
    }
}
