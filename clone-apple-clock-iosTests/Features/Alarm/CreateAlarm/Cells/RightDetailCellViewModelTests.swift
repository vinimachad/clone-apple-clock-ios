//
//  RightDetailCellViewModelTests.swift
//  clone-apple-clock-iosTests
//
//  Created by Vinicius Galhardo Machado on 25/02/22.
//

import Foundation
import XCTest
@testable import clone_apple_clock_ios

class RightDetailCellViewModelTests: XCTestCase {
    
    var sut: RightDetailCellViewModel!
    
    override func setUp() {
        sut = RightDetailCellViewModel(title: "Titulo", result: "Resultado", onSelectCell: {})
    }
    
    func test_didSelectedCell_whenCalled_expectedInvokeOnSelectCell() {
        var onSelectCellCount = 0
        
        sut.onSelectCell = {
            onSelectCellCount += 1
        }
        
        sut.didSelectedCell()
        XCTAssertEqual(onSelectCellCount, 1)
    }
}
