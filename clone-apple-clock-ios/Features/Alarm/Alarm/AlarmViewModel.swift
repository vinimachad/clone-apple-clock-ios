//
//  AlarmViewModel.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 13/02/22.
//

import Foundation
import CoreData

protocol AlarmProtocol: AlarmViewModelProtocol {
    var onSuccessToDeleteAlarm: (() -> Void)? { get set }
    var onFailureToDeleteAlarm: ((String) -> Void)? { get set }
    var onFailureGetAlarms: ((String) -> Void)? { get set }
    func getAlarms()
}

class AlarmViewModel {
    
    // MARK: - Public properties
    
    var onUpdateViewModels: (([AlarmCellViewModelProtocol]) -> Void)?
    var onFailureGetAlarms: ((String) -> Void)?
    var onFailureToDeleteAlarm: ((String) -> Void)?
    var onSuccessToDeleteAlarm: (() -> Void)?
    
    // MARK: - Private properties
    
    private var getAlarmsUseCase: GetAlarmsUseCaseProtocol
    private var deleteAlarmUseCase: DeleteAlarmUseCaseProtocol
    private var alarms: [AlarmCoreData] = []
    
    // MARK: - Init
    
    init(getAlarmsUseCase: GetAlarmsUseCaseProtocol, deleteAlarmUseCase: DeleteAlarmUseCaseProtocol) {
        self.getAlarmsUseCase = getAlarmsUseCase
        self.deleteAlarmUseCase = deleteAlarmUseCase
    }
    
    // MARK: - Sections
    
    private func generateViewModelsOfSection(alarms: [AlarmCoreData]) {
        let alarmViewModels = alarms.map {
            AlarmCellViewModel(time: $0.time?.toString(format: Date.defaultTimeFormat), label: $0.label)
        }
        onUpdateViewModels?(alarmViewModels)
    }
}

// MARK: - AlarmProtocol

extension AlarmViewModel: AlarmProtocol {
    
    func didEditingCell(at: Int) {
        let alarm = alarms[at]
        deleteAlarmUseCase.execute(
            objc: alarm,
            success: { [weak self] in
                self?.onSuccessToDeleteAlarm?()
            },
            failure: { [weak self] error in
                self?.onFailureToDeleteAlarm?(error)
            }
        )
    }
    
    func getAlarms() {
        
        getAlarmsUseCase.execute(
            success: { [weak self] alarms in
                self?.alarms = alarms
                self?.generateViewModelsOfSection(alarms: alarms)
            },
            failure: { [weak self] error in
                self?.onFailureGetAlarms?(error)
            }
        )
    }
}
