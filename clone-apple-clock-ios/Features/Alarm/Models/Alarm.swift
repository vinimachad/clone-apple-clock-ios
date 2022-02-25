//
//  Alarm.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 17/02/22.
//

import Foundation

struct Alarm {
    var time: Date?
    var `repeat`: Repeat = .never
    var label: String = ""
    var sound: Sound = .radar
    var snooze: Bool = false
}
