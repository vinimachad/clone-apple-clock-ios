//
//  AlarmFactory.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 13/02/22.
//

import Foundation
import UIKit

enum AlarmFactory {
    
    static func createAlarm() -> UIViewController {
        let vm = CreateAlarmViewModel()
        return CreateAlarmController(viewModel: vm)
    }
}
