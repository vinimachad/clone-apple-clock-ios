//
//  AlarmFactoryTests.swift
//  clone-apple-clock-iosTests
//
//  Created by Vinicius Galhardo Machado on 25/02/22.
//

import Foundation
@testable import clone_apple_clock_ios
import XCTest

class AlarmFactoryTests: XCTestCase {
    
    func test_createAlarm_expectedToReturnCreateAlarmController() {
        let vc = AlarmFactory.createAlarm(delegate: nil)
        XCTAssertTrue(vc is CreateAlarmController<CreateAlarmViewModel>)
    }
}
