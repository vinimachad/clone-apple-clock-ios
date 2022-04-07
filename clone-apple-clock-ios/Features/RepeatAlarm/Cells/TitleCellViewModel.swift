//
//  TitleCellViewModel.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 03/03/22.
//

import Foundation

class TitleCellViewModel: TitleCellViewModelProtocol {
    
    var title: String
    var isSelected: Bool = false
    var onSelectCell: ((Bool, Int) -> Void)?
    var onUpdateCellState: ((Bool) -> Void)?
    
    init(title: String, onSelectCell: ((Bool, Int) -> Void)?) {
        self.title = title
        self.onSelectCell = onSelectCell
    }
    
    func didSelectCell(at: Int) {
        self.isSelected = !isSelected
        onSelectCell?(isSelected, at)
        onUpdateCellState?(isSelected)
    }
}
