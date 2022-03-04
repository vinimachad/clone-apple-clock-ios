//
//  AlarmFactory.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 13/02/22.
//

import Foundation
import UIKit

enum AlarmFactory {
    
    static func createAlarm(delegate: CreateAlarmControllerDelegate?) -> UIViewController {
        let createAlarmUseCase = CreateAlarmUseCase(api: AlarmRoutes())
        let vm = CreateAlarmViewModel(persist: PersistContainer.shared, createAlarmUseCase: createAlarmUseCase)
        return CreateAlarmController(viewModel: vm, delegate: delegate)
    }
    
    static func repeatAlarm() -> UIViewController {
        let viewModel = RepeatAlarmViewModel()
        return RepeatAlarmController(viewModel: viewModel)
    }
}
