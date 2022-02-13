//
//  TableSection.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 13/02/22.
//

import Foundation
import UIKit

class TableSection<T: UITableViewCell & CellProtocol>: TableSectionProtocol {    
    
    // MARK: - Private properties
    
    private var viewModels: [T.ViewModel]
    
    // MARK: - Init
    
    init(viewModels: [T.ViewModel]) {
        self.viewModels = viewModels
    }
    
    var itemsCount: Int {
        viewModels.count
    }
    
    var cellType: UITableViewCell.Type {
        T.self
    }
    
    func bindCell(cell: UITableViewCell, at row: Int) {
        if let cell = cell as? T, row < itemsCount {
            cell.bindIn(viewModel: viewModels[row])
        }
    }
}
