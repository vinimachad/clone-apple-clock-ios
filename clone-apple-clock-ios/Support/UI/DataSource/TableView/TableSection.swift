//
//  TableSection.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 13/02/22.
//

import Foundation
import UIKit

protocol TableSectionDelegate: AnyObject {
    func didEditing(at: Int)
    func didSelect(at: Int)
}

class TableSection<T: UITableViewCell & CellProtocol>: TableSectionProtocol {
    
    // MARK: - Private properties
    
    private var viewModels: [T.ViewModel]
    private var editingIsEnable: Bool
    private weak var delegate: TableSectionDelegate?
    
    // MARK: - Init
    
    init(viewModels: [T.ViewModel], editingIsEnable: Bool = false, delegate: TableSectionDelegate? = nil) {
        self.viewModels = viewModels
        self.delegate = delegate
        self.editingIsEnable = editingIsEnable
    }
    
    var itemsCount: Int {
        viewModels.count
    }
    
    var cellType: UITableViewCell.Type {
        T.self
    }
    
    var editingCellIsEnable: Bool {
        editingIsEnable
    }
    
    func bindCell(cell: UITableViewCell, at row: Int) {
        if let cell = cell as? T, row < itemsCount {
            cell.bindIn(viewModel: viewModels[row])
        }
    }
    
    func didEditing(at: Int) {
        delegate?.didEditing(at: at)
    }
    
    func didSelect(at: Int) {
        delegate?.didSelect(at: at)
    }
}

// MARK: - TableSectionDelegate

extension TableSectionDelegate {
    
    func didEditing(at: Int) { }
    func didSelect(at: Int) { }
}
