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
    var deleteAlarmUseCaseMock: DeleteAlarmUseCaseMock!
    
    override func setUp() {
        getAlarmsUseCaseMock = GetAlarmsUseCaseMock()
        deleteAlarmUseCaseMock = DeleteAlarmUseCaseMock()
        sut = AlarmViewModel(getAlarmsUseCase: getAlarmsUseCaseMock, deleteAlarmUseCase: deleteAlarmUseCaseMock)
    }
    
    // MARK: - GetAlarms Method
    
    func test_getAlarms_whenCalled_expectInvokeExecute() {
        sut.getAlarms()
        
        XCTAssertEqual(getAlarmsUseCaseMock.$invokedExecute.count, 1)
    }
    
    func test_getAlarms_whenHasSuccess_expectInvokedOnUpdateViewModelsAndGenerateOneViewModel() {
        var invokeOnUpdateViewModels = (count: 0, viewModels: [])
        let alarm = AlarmCoreData(context: PersistContainer.shared.context)
        alarm.time = "10:00".toDate()
        getAlarmsUseCaseMock.alarms = [alarm]
        
        sut.onUpdateViewModels = { viewModels in
            invokeOnUpdateViewModels.count += 1
            invokeOnUpdateViewModels.viewModels = viewModels
        }

        sut.getAlarms()
        XCTAssertEqual(invokeOnUpdateViewModels.count, 1)
        XCTAssertEqual(invokeOnUpdateViewModels.viewModels.count, 1)
    }
    
    func test_getAlarms_whenHasFailure_expectInvokedOnFailureGetAlarmsWithCorrectErrorMessage() {
        var invokeOnFailureGetAlarms = (count: 0, error: "")
        getAlarmsUseCaseMock.error = NSError(domain: "ERROR", code: 1, userInfo: nil)
        
        sut.onFailureGetAlarms = { error in
            invokeOnFailureGetAlarms.count += 1
            invokeOnFailureGetAlarms.error = error
        }
        
        sut.getAlarms()
        XCTAssertEqual(invokeOnFailureGetAlarms.error, "The operation couldn’t be completed. (ERROR error 1.)")
        XCTAssertEqual(invokeOnFailureGetAlarms.count, 1)
    }
    
    // MARK: - DidEditingCell Method
    
    func test_didEditingCell_whenStartToDeleteCell_expectInvokedExecute() {
        let alarm = AlarmCoreData(context: PersistContainer.shared.context)
        alarm.time = "10:00".toDate()
        getAlarmsUseCaseMock.alarms = [alarm]
        
        sut.getAlarms()
        sut.didEditingCell(at: 0)
        
        XCTAssertEqual(deleteAlarmUseCaseMock.$invokedExecute.count, 1)
    }
    
    func test_didEditingCell_whenCellIsDeletedWithSuccess_expectInvokedOnSuccessToDeleteAlarm() {
        var invokedOnSuccessToDeleteAlarmCount = 0
        let alarm = AlarmCoreData(context: PersistContainer.shared.context)
        alarm.time = "10:00".toDate()
        getAlarmsUseCaseMock.alarms = [alarm]
        
        sut.getAlarms()
        
        sut.onSuccessToDeleteAlarm = {
            invokedOnSuccessToDeleteAlarmCount += 1
        }
        
        sut.didEditingCell(at: 0)
        
        XCTAssertEqual(invokedOnSuccessToDeleteAlarmCount, 1)
    }
    
    func test_didEditingCell_whenCellIsDeletedWithFailure_expectInvokedOnFailureToDeleteAlarm() {
        var invokedOnFailureToDeleteAlarmCount = 0
        let alarm = AlarmCoreData(context: PersistContainer.shared.context)
        alarm.time = "10:00".toDate()
        getAlarmsUseCaseMock.alarms = [alarm]
        deleteAlarmUseCaseMock.error = NSError(domain: "error", code: 1, userInfo: nil)
        
        sut.getAlarms()
        
        sut.onFailureToDeleteAlarm = { _ in
            invokedOnFailureToDeleteAlarmCount += 1
        }
        
        sut.didEditingCell(at: 0)
        
        XCTAssertEqual(invokedOnFailureToDeleteAlarmCount, 1)
    }
    
}
