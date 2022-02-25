//
//  UpdateAlarmObserver.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 25/02/22.
//

import Foundation

protocol AlarmObserver {
    func updateAlarmObserver(_ selector: Selector)
}

extension AlarmObserver {
    
    func updateAlarmObserver(_ selector: Selector) {
        NotificationCenter.default.addObserver(self, selector: selector, name: NSNotification.Name("UPDATE_ALARM"), object: nil)
    }
}
