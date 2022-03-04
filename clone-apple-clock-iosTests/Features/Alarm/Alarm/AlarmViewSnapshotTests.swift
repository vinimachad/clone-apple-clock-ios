//
//  AlarmViewSnapshotTests.swift
//  clone-apple-clock-iosTests
//
//  Created by Vinicius Galhardo Machado on 25/02/22.
//

@testable import clone_apple_clock_ios
import FBSnapshotTestCase

class AlarmViewSnapshotTests: FBSnapshotTestCase {
    
    var sut: AlarmView!
    var viewModelMock: AlarmViewModelMock!
    
    override func setUp() {
        super.setUp()
        sut = AlarmView()
        viewModelMock = AlarmViewModelMock()
        sut.frame = CGRect(x: 0, y: 0, width: 414, height: 600)
    }
    
    func test_init_expectValidSnapshot() {
        FBSnapshotVerifyView(sut)
    }
    
    func test_bind_whenAllValuesIsFilled_expectValidSnapshot() {
        let viewModel = AlarmCellViewModelMock()
        viewModel.time = "10:00"
        viewModel.label = "Trabalho"
        
        sut.bindIn(viewModel: viewModelMock)
        viewModelMock.onUpdateViewModels?([viewModel])
        FBSnapshotVerifyView(sut)
    }
}
