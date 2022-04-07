//
//  RepeatAlarmViewModel.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 03/03/22.
//

import Foundation

protocol RepeatAlarmProtocol: RepeatAlarmViewModelProtocol {
 func saveDaysInRepeat()
}

class RepeatAlarmViewModel {
    
    // MARK: - Public properties
    
    lazy var sections: [TableSectionProtocol] = {
       [generateRepeatCellsInSection()]
    }()
    
    // MARK: - Private properties
    
    private var titleCellViewModels: [TitleCellViewModelProtocol] = []
    private var daysInRepeat: [Repeat] = []
    private var listOfRepeat: [Repeat] {
        [
            .monday,
            .tuesday,
            .wednesday,
            .thursday,
            .friday,
            .saturday,
            .sunday
        ]
    }
    
    // MARK: - Init
    
    init() {
        
    }
    
    // MARK: - Sections
    
    private func generateRepeatCellsInSection() -> TableSectionProtocol {
        titleCellViewModels = listOfRepeat.map {
            TitleCellViewModel(
                title: "\($0.rawValue)_label".localize(.repeat),
                onSelectCell: self.didSelectedCell(_:at:)
            )
        }
        return TableSection<TitleCell>(viewModels: titleCellViewModels, delegate: self)
    }
    
    private func didSelectedCell(_ isSelected: Bool, at: Int) {
        guard isSelected else {
            daysInRepeat.removeAll(where: { $0 == listOfRepeat[at] })
            return
        }
        daysInRepeat.append(listOfRepeat[at])
    }
}

// MARK: - RepeatAlarmProtocol

extension RepeatAlarmViewModel: RepeatAlarmProtocol {
    
    func saveDaysInRepeat() {
        
    }
}

// MARK: - TableSectionDelegate

extension RepeatAlarmViewModel: TableSectionDelegate {
    
    func didSelect(at: Int) {
        titleCellViewModels[at].didSelectCell(at: at)
    }
}
