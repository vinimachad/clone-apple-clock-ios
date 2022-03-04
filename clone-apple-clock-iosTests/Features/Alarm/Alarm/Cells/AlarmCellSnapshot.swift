//
//  AlarmCellSnapshot.swift
//  clone-apple-clock-iosTests
//
//  Created by Vinicius Galhardo Machado on 02/03/22.
//

import Foundation

@testable import clone_apple_clock_ios
import FBSnapshotTestCase

class AlarmCellSnapshot: FBSnapshotTestCase {
    
    var sut: AlarmCell!
    var viewModelMock: AlarmCellViewModelMock!
    
    override func setUp() {
        super.setUp()
        sut = AlarmCell()
        viewModelMock = AlarmCellViewModelMock()
        sut.frame = CGRect(x: 0, y: 0, width: 414, height: 100)
    }
    
    func test_init_expectValidSnapshot() {
        FBSnapshotVerifyView(sut)
    }
    
    func test_bind_whenAllValuesIsFilled_expectValidSnapshot() {
        viewModelMock.time = "10:00"
        viewModelMock.label = "Trabalho"
        sut.bindIn(viewModel: viewModelMock)
        FBSnapshotVerifyView(sut)
    }
    
    func test_bind_whenAlarmHasYourStateAsOn_expectValidSnapshot() {
        viewModelMock.time = "10:00"
        viewModelMock.label = "Trabalho"
        sut.alarmIsEnableSwitch.isOn = true
        
        sut.bindIn(viewModel: viewModelMock)
        
        viewModelMock.onChangeAlarmState?()
        FBSnapshotVerifyView(sut)
    }
    
    func test_bind_whenAlarmHasYourStateAsOff_expectValidSnapshot() {
        viewModelMock.time = "10:00"
        viewModelMock.label = "Trabalho"
        sut.alarmIsEnableSwitch.isOn = false
        
        sut.bindIn(viewModel: viewModelMock)
        
        viewModelMock.onChangeAlarmState?()
        FBSnapshotVerifyView(sut)
    }
}
