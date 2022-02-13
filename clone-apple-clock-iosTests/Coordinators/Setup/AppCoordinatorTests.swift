//
//  AppCoordinatorTests.swift
//  clone-apple-clock-iosTests
//
//  Created by Vinicius Galhardo Machado on 11/02/22.
//

import Foundation
import XCTest
@testable import clone_apple_clock_ios

class AppCoordinatorTests: XCTestCase {
    
    var sut: AppCoordinator!
    
    override func setUp() {
        sut = AppCoordinator(window: UIWindow())
    }
    
    func test_start_expectChildCoordinatorIsContainerCoordinator() {
        sut.start()
        XCTAssertTrue(sut.childCoordinator is ContainerCoordinator)
    }
}
