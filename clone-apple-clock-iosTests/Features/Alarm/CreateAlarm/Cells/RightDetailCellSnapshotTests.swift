//
//  RightDetailCellSnapshotTests.swift
//  clone-apple-clock-iosTests
//
//  Created by Vinicius Galhardo Machado on 25/02/22.
//

import Foundation

@testable import clone_apple_clock_ios
import FBSnapshotTestCase

class RightDetailCellSnapshotTests: FBSnapshotTestCase {
    
    var sut: RightDetailCell!
    var viewModelMock: RightDetailCellViewModelMock!
    
    override func setUp() {
        super.setUp()
        sut = RightDetailCell()
        viewModelMock = RightDetailCellViewModelMock()
        sut.frame = CGRect(x: 0, y: 0, width: 382, height: 40)
        sut.backgroundColor = .systemGray6
    }
    
    func test_init_expectValidSnapshot() {
        FBSnapshotVerifyView(sut)
    }
    
    func test_bind_whenAllValuesIsFilled_expectValidSnapshot() {
        viewModelMock.title = "Teste"
        viewModelMock.result = "Teste"
        sut.bindIn(viewModel: viewModelMock)
        FBSnapshotVerifyView(sut)
    }
}
