//
//  AlarmCellViewModel.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 26/02/22.
//

import Foundation

struct AlarmCellViewModel: AlarmCellViewModelProtocol {
    
    var time: String?
    var label: String?
    var onChangeAlarmState: (() -> Void)?
    
    func didChangeAlarmState() {
        onChangeAlarmState?()
    }
}
