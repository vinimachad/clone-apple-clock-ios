//
//  AlarmCell.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 26/02/22.
//

import Foundation

import UIKit
import Reusable

protocol AlarmCellViewModelProtocol: CellViewModelProtocol {
    var time: String? { get }
    var label: String? { get }
    var onChangeAlarmState: (() -> Void)? { get set }
    func didChangeAlarmState()
}

class AlarmCell: UITableViewCell, CellProtocol {
    
    // MARK: - UI Components
    
    private var timeLabel = UILabel()
    private var titleAlarmLabel = UILabel()
    private var alarmIsEnableSwitch = UISwitch()
    
    // MARK: - Private properties
    
    private var viewModel: AlarmCellViewModelProtocol?
    
    // MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Bind
    
    func bindIn(viewModel: AlarmCellViewModelProtocol) {
        self.viewModel = viewModel
        
        timeLabel.text = viewModel.time
        titleAlarmLabel.text = viewModel.label
        
        self.viewModel?.onChangeAlarmState = { [weak self] in
            self?.updateAlarmState()
        }
    }
}

// MARK: - Setup view

extension AlarmCell {
    
    private func setup() {
        setupConstraints()
        setupTimeLabel()
        setupTitleAlarmLabel()
        setupAlarmIsEnableSwitch()
        backgroundColor = .black
    }
    
    private func setupTimeLabel() {
        timeLabel.font = .systemFont(ofSize: 45, weight: .light)
    }
    
    private func setupTitleAlarmLabel() {
        titleAlarmLabel.font = .systemFont(ofSize: 13, weight: .regular)
    }
    
    private func setupAlarmIsEnableSwitch() {
        alarmIsEnableSwitch.preferredStyle = .sliding
        alarmIsEnableSwitch.isOn = true
        alarmIsEnableSwitch.addTarget(self, action: #selector(didTapSwitch), for: .touchUpInside)
    }
    
    private func updateAlarmState() {
        let isOn = alarmIsEnableSwitch.isOn
        timeLabel.textColor = isOn ? .white : .secondaryLabel
        titleAlarmLabel.textColor = isOn ? .white : .secondaryLabel
    }
    
    // MARK: - Actions
    
    @objc private func didTapSwitch() {
        viewModel?.didChangeAlarmState()
    }
}

// MARK: - Setup constraints

extension AlarmCell {
    
    private func setupConstraints() {
        viewHierarchy()
        
        contentView.snp.makeConstraints {
            $0.leading.equalTo(snp.leading)
            $0.trailing.equalTo(snp.trailing)
            $0.top.equalTo(snp.top)
            $0.bottom.equalTo(snp.bottom)
        }
        
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.topMargin)
            $0.leading.equalTo(contentView.snp.leadingMargin)
            $0.bottom.equalTo(titleAlarmLabel.snp.top).offset(-3)
        }
        
        titleAlarmLabel.snp.makeConstraints {
            $0.leading.equalTo(contentView.snp.leadingMargin)
            $0.bottom.equalTo(contentView.snp.bottomMargin)
            $0.trailing.equalTo(contentView.snp.trailingMargin)
        }
        
        alarmIsEnableSwitch.snp.makeConstraints {
            $0.centerY.equalTo(timeLabel.snp.centerY)
            $0.trailing.equalTo(contentView.snp.trailingMargin)
        }
    }
    
    private func viewHierarchy() {
        contentView.addSubview(timeLabel)
        contentView.addSubview(titleAlarmLabel)
        contentView.addSubview(alarmIsEnableSwitch)
    }
}
