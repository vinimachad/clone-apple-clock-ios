//
//  AlarmViewModelTests.swift
//  clone-apple-clock-iosTests
//
//  Created by Vinicius Galhardo Machado on 25/02/22.
//

import Foundation
import XCTest
@testable import clone_apple_clock_ios

class AlarmViewModelTests: XCTestCase {
    
    var sut: AlarmViewModel!
    var getAlarmsUseCaseMock: GetAlarmsUseCaseMock!
    
    override func setUp() {
        getAlarmsUseCaseMock = GetAlarmsUseCaseMock()
        sut = AlarmViewModel(getAlarmsUseCase: getAlarmsUseCaseMock)
    }
    
    func test_getAlarms_whenCalled_expectInvokeExecute() {
        sut.getAlarms()
        
        XCTAssertEqual(getAlarmsUseCaseMock.$invokedExecute.count, 1)
    }
    
    func test_getAlarms_whenHasSuccess_expectInvokedOnSuccessGetAlarms() {
        sut.getAlarms()
        // IMPLEMENTAR
    }
    
    func test_getAlarms_whenHasFailure_expectInvokedOnSuccessGetAlarms() {
        sut.getAlarms()
        // IMPLEMENTAR
    }
}
