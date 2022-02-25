//
//  CreateAlarmViewModel.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 13/02/22.
//

import Foundation

protocol CreateAlarmProtocol: CreateAlarmViewModelProtocol {
    var onStartToSaveAlarm: (() -> Void)? { get set }
    var onSuccessToSaveAlarm: (() -> Void)? { get set }
    var onFailureToSaveAlarm: ((String) -> Void)? { get set }
    func didSaveAlarm()
}

class CreateAlarmViewModel {
    
    enum Selections: CaseIterable {
        case `repeat`
        case label
        case sound
    }
    
    // MARK: - Public properties
    
    var onStartToSaveAlarm: (() -> Void)?
    var onSuccessToSaveAlarm: (() -> Void)?
    var onFailureToSaveAlarm: ((String) -> Void)?
    
    lazy var sections: [TableSectionProtocol] = {
        [
            generateSelectsSection()
        ]
    }()
    
    // MARK: - Private properties
    
    private var alarm: Alarm = Alarm()
    private var persist: PersistContainerProtocol
    private var createAlarmUseCase: CreateAlarmUseCaseProtocol
    
    // MARK: - Init
    
    init(persist: PersistContainerProtocol, createAlarmUseCase: CreateAlarmUseCaseProtocol) {
        self.persist = persist
        self.createAlarmUseCase = createAlarmUseCase
    }
    
    private func generateSelectsSection() -> TableSectionProtocol {
        let viewModels = Selections.allCases.map {
            RightDetailCellViewModel(title: $0.title, result: $0.result, onSelectCell: { })
        }
        
        return TableSection<RightDetailCell>(viewModels: viewModels)
    }
}

// MARK: - CreateAlarmProtocol

extension CreateAlarmViewModel: CreateAlarmProtocol {
    
    func didSaveAlarm() {
        createAlarm()
    }
    
    func didChangeAlarmValue(_ time: String) {
        alarm.time = time.toDate()
    }
    
    // MARK: - Requests
    
    func createAlarm() {
        onStartToSaveAlarm?()
        let newAlarm = AlarmCoreData(context: persist.context)
        newAlarm.time = alarm.time
        newAlarm.repeat = alarm.repeat.rawValue
        newAlarm.label = alarm.label
        newAlarm.snooze = alarm.snooze
        newAlarm.sound = alarm.sound.rawValue
        
        createAlarmUseCase.execute(
            success: { [weak self] in
                self?.onSuccessToSaveAlarm?()
            },
            failure: { [weak self] error in
                self?.onFailureToSaveAlarm?(error)
            }
        )
    }
}

// MARK: - Selections

extension CreateAlarmViewModel.Selections {
    
    var title: String? {
        switch self {
        case .repeat: return "repeat_label".localize(.alarm)
        case .label: return "title_label".localize(.alarm)
        case .sound: return "sound_label".localize(.alarm)
        }
    }
    
    var result: String? {
        switch self {
        case .repeat: return "Nunca"
        case .label: return "Alarme"
        case .sound: return "Radar"
        }
    }
}
