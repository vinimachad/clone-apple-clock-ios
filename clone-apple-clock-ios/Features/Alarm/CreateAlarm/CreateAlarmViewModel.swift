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
    }
    
    // MARK: - Public properties
    
    lazy var sections: [TableSectionProtocol] = {
        [
            generateSelectsSection()
        ]
    }()
    
    // MARK: - Private properties
    
    // MARK: - Init
    
    init() {
        
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
