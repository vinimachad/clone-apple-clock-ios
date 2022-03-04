//
//  RightDetailViewModel.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 15/02/22.
//

import Foundation

class RightDetailCellViewModel {
    
    // MARK: - Public properties
    
    var title: String?
    var result: String?
    var selectionKind: CreateAlarmViewModel.Selections
    var onSelectCell: ((CreateAlarmViewModel.Selections) -> Void)?
    
    // MARK: - Init
    
    init(
        selectionsKind: CreateAlarmViewModel.Selections,
        title: String?, result: String?,
        onSelectCell: ((CreateAlarmViewModel.Selections) -> Void)?
    ) {
        self.selectionKind = selectionsKind
        self.title = title
        self.result = result
        self.onSelectCell = onSelectCell
    }
}

extension RightDetailCellViewModel: RightDetailCellViewModelProtocol {
    
    func didSelectedCell() {
        onSelectCell?(selectionKind)
    }
}
