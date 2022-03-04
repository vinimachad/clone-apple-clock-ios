//
//  CreateAlarmViewModel.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 13/02/22.
//

import Foundation

protocol CreateAlarmProtocol: CreateAlarmViewModelProtocol {
    var onSuccessToSaveAlarm: (() -> Void)? { get set }
    var onFailureToSaveAlarm: ((String) -> Void)? { get set }
    var onSelectCell: ((CreateAlarmViewModel.Selections) -> Void)? { get set }
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
    var onSelectCell: ((Selections) -> Void)?
    
    lazy var sections: [TableSectionProtocol] = {
        [
            generateSelectsSection()
        ]
    }()
    
    // MARK: - Private properties
    
    private var alarm: Alarm = Alarm()
    private var persist: PersistContainerProtocol
    private var createAlarmUseCase: CreateAlarmUseCaseProtocol
    private var rightDetailCellViewModels: [RightDetailCellViewModelProtocol] = []
    
    // MARK: - Init
    
    init(persist: PersistContainerProtocol, createAlarmUseCase: CreateAlarmUseCaseProtocol) {
        self.persist = persist
        self.createAlarmUseCase = createAlarmUseCase
    }
    
    private func generateSelectsSection() -> TableSectionProtocol {
         rightDetailCellViewModels = Selections.allCases.map {
            RightDetailCellViewModel(
                selectionsKind: $0,
                title: $0.title,
                result: $0.result,
                onSelectCell: self.didSelectCell(_:)
            )
        }
        
        return TableSection<RightDetailCell>(viewModels: rightDetailCellViewModels, delegate: self)
    }
}

// MARK: - CreateAlarmProtocol

extension CreateAlarmViewModel: CreateAlarmProtocol {
    
    func didSaveAlarm() {
        createAlarm()
    }
    
    func didChangeAlarmValue(_ time: String) {
        alarm.time = time.toDate(format: Date.defaultTimeFormat)
    }
    
    func didSelectCell(_ kind: Selections) {
        onSelectCell?(kind)
    }
    
    // MARK: - Requests
    
    private func createAlarm() {
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

// MARK: - TableSectionDelegate

extension CreateAlarmViewModel: TableSectionDelegate {
    
    func didSelect(at: Int) {
        rightDetailCellViewModels[at].didSelectedCell()
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
