//
//  RepeatAlarmView.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 03/03/22.
//

import Foundation

import UIKit
import SnapKit

protocol RepeatAlarmViewModelProtocol {
    var sections: [TableSectionProtocol] { get }
}

class RepeatAlarmView: UIView {
    
    // MARK: - UI Components
    
    private var tableView = UITableView(frame: CGRect(), style: .insetGrouped)
    
    // MARK: - Private properties
    
    private var viewModel: RepeatAlarmViewModelProtocol?
    private var tableViewDataSource = TableViewDataSource()
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Bind
    
    func bindIn(viewModel: RepeatAlarmViewModelProtocol) {
        self.viewModel = viewModel
        tableViewDataSource.sections = viewModel.sections
    }
}

// MARK: - Setup view

extension RepeatAlarmView {
    
    private func setup() {
        setupConstraints()
        setupTableView()
    }
    
    private func setupTableView() {
        tableViewDataSource.tableView = tableView
    }
}

// MARK: - Setup constraints

extension RepeatAlarmView {
    
    private func setupConstraints() {
        viewHierarchy()
        
        tableView.snp.makeConstraints {
            $0.edges.equalTo(snp.edges)
        }
    }
    
    private func viewHierarchy() {
        addSubview(tableView)
    }
}

