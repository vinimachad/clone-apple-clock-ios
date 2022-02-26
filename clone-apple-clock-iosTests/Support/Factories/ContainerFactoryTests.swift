//
//  ContainerFactoryTests.swift
//  clone-apple-clock-iosTests
//
//  Created by Vinicius Galhardo Machado on 25/02/22.
//

import Foundation
import XCTest
@testable import clone_apple_clock_ios

class ContainerFactoryTests: XCTestCase {
    
    func test_container_expectedToReturnTabBarController() {
        let vc = ContainerFactory.container(delegate: nil)
        XCTAssertTrue(vc is TabBarController<TabBarViewModel>)
    }
    
    func test_alarm_expectedToReturnAlarmController() {
        let vc = ContainerFactory.alarm(delegate: nil)
        XCTAssertTrue(vc is AlarmController<AlarmViewModel>)
    }
}
