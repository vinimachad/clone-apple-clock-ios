//
//  CreateAlarmViewModelTests.swift
//  clone-apple-clock-iosTests
//
//  Created by Vinicius Galhardo Machado on 25/02/22.
//

import XCTest
@testable import clone_apple_clock_ios

class CreateAlarmViewModelTests: XCTestCase {
    
    var sut: CreateAlarmViewModel!
    var createAlarmUseCaseMock: CreateAlarmUseCaseMock!
    
    override func setUp() {
        createAlarmUseCaseMock = CreateAlarmUseCaseMock()
        sut = CreateAlarmViewModel(persist: PersistContainer.shared, createAlarmUseCase: createAlarmUseCaseMock)
    }
    
    func test_didSaveAlarm_whenCalled_expectedInvokeExecute() {
        sut.didSaveAlarm()
        XCTAssertEqual(createAlarmUseCaseMock.$invokedExecute.count, 1)
    }
    
    func test_didSaveAlarm_whenCalledAndReturnSuccessToSaveAlarm_expectedInvokeOnSuccessToSaveAlarm() {
        var onSuccessToSaveAlarmCount = 0
        
        createAlarmUseCaseMock.error = nil
        
        sut.onSuccessToSaveAlarm = {
            onSuccessToSaveAlarmCount += 1
        }
        
        sut.didSaveAlarm()
        XCTAssertEqual(onSuccessToSaveAlarmCount, 1)
    }
    
    func test_didSaveAlarm_whenCalledAndReturnFailureToSaveAlarm_expectedInvokeOnFailureToSaveAlarm() {
        var onFailureToSaveAlarm = (count: 0, error: "")
        
        createAlarmUseCaseMock.error = NSError(domain: "teste", code: 1, userInfo: nil)
        
        sut.onFailureToSaveAlarm = { error in
            onFailureToSaveAlarm.count += 1
            onFailureToSaveAlarm.error = error
        }
        
        sut.didSaveAlarm()
        XCTAssertEqual(onFailureToSaveAlarm.count, 1)
        XCTAssertEqual(onFailureToSaveAlarm.error, "The operation couldn’t be completed. (teste error 1.)")
    }
}
