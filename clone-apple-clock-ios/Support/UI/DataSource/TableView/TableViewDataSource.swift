//
//  TableViewDataSource.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 13/02/22.
//

import Foundation
import UIKit
import Reusable

class TableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Public properties
    
    var tableView: UITableView? {
        didSet {
            tableView?.delegate = self
            tableView?.dataSource = self
            register()
        }
    }
    
    var sections: [TableSectionProtocol] = [] {
        didSet {
            tableView?.reloadData()
            register()
        }
    }
    
    private func register() {
        sections.forEach {
            tableView?.register(cellType: $0.cellType)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sections.isEmpty {
            return 0
        }
        return sections[section].itemsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: section.cellType)
        
        section.bindCell(cell: cell, at: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sections[indexPath.section].didSelect(at: indexPath.row)
    }
}
