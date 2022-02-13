//
//  TabBarViewModelTests.swift
//  clone-apple-clock-iosTests
//
//  Created by Vinicius Galhardo Machado on 10/02/22.
//

import Foundation
import XCTest
@testable import clone_apple_clock_ios

class TabBarViewModelTests: XCTestCase {
    
    var sut: TabBarViewModel!
    
    override func setUp() {
        sut = TabBarViewModel()
    }
    
    func test_didSelectTabItem_expectInvokeOnSelectedTabItem() {
        var invokedOnSelectedTabItem = (count: 0, tab: Tab.alarm)
        
        sut.onSelectedTabItem = { tab in
            invokedOnSelectedTabItem.count += 1
            invokedOnSelectedTabItem.tab = tab
        }
        
        sut.didSelectTabItem(0)
        
        XCTAssertEqual(invokedOnSelectedTabItem.count, 1)
        XCTAssertEqual(invokedOnSelectedTabItem.tab, .worldClock)
    }
}
