//
//  AlarmViewModelMock.swift
//  clone-apple-clock-iosTests
//
//  Created by Vinicius Galhardo Machado on 25/02/22.
//

import Foundation
@testable import clone_apple_clock_ios

class AlarmViewModelMock: AlarmProtocol {
    
    @Spy var invokedGetAlarms: Void?
    @Spy var invokedDidEditingCell: Void?
    
    var onSuccessToDeleteAlarm: (() -> Void)?
    var onFailureToDeleteAlarm: ((String) -> Void)?
    var onFailureGetAlarms: ((String) -> Void)?
    var onUpdateViewModels: (([AlarmCellViewModelProtocol]) -> Void)?
    
    func didEditingCell(at: Int) {
        invokedDidEditingCell = ()
    }
    
    func getAlarms() {
        invokedGetAlarms = ()
    }
}
