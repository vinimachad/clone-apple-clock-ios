//
//  AlarmPublisher.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 25/02/22.
//

import Foundation

protocol PostAlarm {
    func postUpdateAlarm()
}

extension PostAlarm {
    
    func postUpdateAlarm() {
        NotificationCenter.default.post(name: NSNotification.Name("UPDATE_ALARM"), object: nil)
    }
}
