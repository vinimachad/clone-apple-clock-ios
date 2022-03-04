//
//  TableSection.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 13/02/22.
//

import Foundation
import UIKit
import Reusable

protocol TableSectionProtocol {
    var itemsCount: Int { get }
    var cellType: UITableViewCell.Type { get }
    var editingCellIsEnable: Bool { get }
    func bindCell(cell: UITableViewCell, at row: Int)
    func didSelect(at: Int)
    func didEditing(at: Int)
}

extension TableSectionProtocol {
    func didSelect(at: Int) { }
    func didEditing(at: Int) { }
}

protocol CellProtocol {
    associatedtype ViewModel = CellViewModelProtocol
    func bindIn(viewModel: ViewModel)
}

protocol CellViewModelProtocol { }

extension UITableViewCell: Reusable { }
