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
    var onSelectCell: (() -> Void)?
    
    // MARK: - Init
    
    init(title: String?, result: String?, onSelectCell: (() -> Void)?) {
        self.title = title
        self.result = result
        self.onSelectCell = onSelectCell
    }
    
    func didSelectedCell() {
        onSelectCell?()
    }
}

extension RightDetailCellViewModel: RightDetailCellViewModelProtocol {}
