//
//  CreateAlarmViewModelMock.swift
//  clone-apple-clock-iosTests
//
//  Created by Vinicius Galhardo Machado on 25/02/22.
//

import Foundation
@testable import clone_apple_clock_ios

class CreateAlarmViewModelMock: CreateAlarmProtocol {
    
    @Spy var invokeDidSaveAlarm: Void?
    @Spy var invokeDidChangeAlarmValue: Void?
    
    var sections: [TableSectionProtocol] = []
    var onSuccessToSaveAlarm: (() -> Void)?
    var onFailureToSaveAlarm: ((String) -> Void)?
    
    func didSaveAlarm() {
        invokeDidSaveAlarm = ()
    }
    
    func didChangeAlarmValue(_ time: String) {
        invokeDidChangeAlarmValue = ()
    }
    
    
}
