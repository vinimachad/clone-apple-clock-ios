//
//  AlarmCellViewModelMock.swift
//  clone-apple-clock-iosTests
//
//  Created by Vinicius Galhardo Machado on 02/03/22.
//

import Foundation
@testable import clone_apple_clock_ios

class AlarmCellViewModelMock: AlarmCellViewModelProtocol {
    
    @Spy var invokedDidChangeAlarmState: Void?
    
    var time: String?
    var label: String?
    var onChangeAlarmState: (() -> Void)?
    
    func didChangeAlarmState() {
        invokedDidChangeAlarmState = ()
    }
}
