//
//  RepeatAlarmViewModel.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 03/03/22.
//

import Foundation

protocol RepeatAlarmProtocol: RepeatAlarmViewModelProtocol {
    
}

class RepeatAlarmViewModel {
    
    // MARK: - Public properties
    
    lazy var sections: [TableSectionProtocol] = {
       [generateRepeatCellsInSection()]
    }()
    
    // MARK: - Private properties
    
    private var `repeat`: [Repeat] {
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
        let viewModels = `repeat`.map { TitleCellViewModel(title: "\($0.rawValue)_label".localize(.repeat))  }
        return TableSection<TitleCell>(viewModels: viewModels)
    }
}

// MARK: - RepeatAlarmProtocol

extension RepeatAlarmViewModel: RepeatAlarmProtocol {
    
}
