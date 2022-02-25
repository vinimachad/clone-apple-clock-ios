//
//  CreateAlarmView.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 13/02/22.
//

import UIKit
import SnapKit

protocol CreateAlarmViewModelProtocol {
    var sections: [TableSectionProtocol] { get }
    func didChangeAlarmValue(_ time: String)
}

class CreateAlarmView: UIView {
    
    // MARK: - UI Components
    
    private var dataPicker = UIDatePicker()
    private var tableView = UITableView(frame: CGRect(), style: .insetGrouped)
    
    // MARK: - Private properties
    
    private var viewModel: CreateAlarmViewModelProtocol?
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
    
    func bindIn(viewModel: CreateAlarmViewModelProtocol) {
        self.viewModel = viewModel
        tableViewDataSource.sections = viewModel.sections
        viewModel.didChangeAlarmValue(dataPicker.date.toString(format: Date.defaultTimeFormat))
    }
}

// MARK: - Setup view

extension CreateAlarmView {
    
    private func setup() {
        setupConstraints()
        backgroundColor = .systemGray6
        setupPickerView()
        setupTableView()
    }
    
    private func setupTableView() {
        tableViewDataSource.tableView = tableView
    }
    
    private func setupPickerView() {
        dataPicker.preferredDatePickerStyle = .wheels
        dataPicker.datePickerMode = .time
        dataPicker.locale = Locale.init(identifier: "en")
        dataPicker.addTarget(self, action: #selector(didChangePicker(sender:)), for: .valueChanged)
    }
    
    // MARK: - Actions
    
    @objc private func didChangePicker(sender: UIDatePicker) {
        viewModel?.didChangeAlarmValue(dataPicker.date.toString(format: Date.defaultTimeFormat))
    }
}

// MARK: - Setup constraints

extension CreateAlarmView {
    
    private func setupConstraints() {
        viewHierarchy()
        
        dataPicker.snp.makeConstraints {
            $0.leading.equalTo(snp.leadingMargin)
            $0.trailing.equalTo(snp.trailingMargin)
            $0.top.equalTo(snp.topMargin)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(dataPicker.snp.bottomMargin)
            $0.trailing.equalTo(snp.trailingMargin)
            $0.leading.equalTo(snp.leadingMargin)
            $0.bottom.equalTo(snp.bottomMargin)
        }
    }
    
    private func viewHierarchy() {
        addSubview(dataPicker)
        addSubview(tableView)
    }
}
