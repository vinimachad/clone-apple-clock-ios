//
//  AlarmViewModel.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 13/02/22.
//

import Foundation

protocol AlarmProtocol: AlarmViewModelProtocol {
    func getAlarms()
}

class AlarmViewModel {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private var getAlarmsUseCase: GetAlarmsUseCaseProtocol
    
    // MARK: - Init
    
    init(getAlarmsUseCase: GetAlarmsUseCaseProtocol) {
        self.getAlarmsUseCase = getAlarmsUseCase
    }
}

// MARK: - AlarmProtocol

extension AlarmViewModel: AlarmProtocol {
    
    func getAlarms() {
        getAlarmsUseCase.execute(
            success: { alarms in
                print("alarmes -> ", alarms.count)
            },
            failure: { error in
                print(error)
            }
        )
    }
}
