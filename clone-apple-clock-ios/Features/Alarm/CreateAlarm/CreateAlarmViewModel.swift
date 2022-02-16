//
//  CreateAlarmViewModel.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 13/02/22.
//

import Foundation

protocol CreateAlarmProtocol: CreateAlarmViewModelProtocol {
    
}

class CreateAlarmViewModel {
    
    enum Selections: CaseIterable {
        case `repeat`
        case label
        case sound
        case snooze
    }
    
    // MARK: - Public properties
    
    lazy var sections: [TableSectionProtocol] = {
        [
            TableSection<RightDetailCell>(
                viewModels: [RightDetailCellViewModel(), RightDetailCellViewModel()]
            )
        ]
    }()
    
    // MARK: - Private properties
    
    // MARK: - Init
    
    init() {
        
    }
}

// MARK: - CreateAlarmProtocol

extension CreateAlarmViewModel: CreateAlarmProtocol {
    
}
