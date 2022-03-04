//
//  RightDetailCell.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 15/02/22.
//

import Foundation
import UIKit
import SnapKit

protocol RightDetailCellViewModelProtocol: CellViewModelProtocol {
    var title: String? { get }
    var result: String? { get }
    var onSelectCell: ((CreateAlarmViewModel.Selections) -> Void)? { get set }
    func didSelectedCell()
}

class RightDetailCell: UITableViewCell, CellProtocol {
    
    // MARK: - UI Components
    
    private var titleLabel = UILabel()
    private var resultLabel = UILabel()
    
    // MARK: - Private properties
    
    private var viewModel: RightDetailCellViewModelProtocol?
    
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
    
    func bindIn(viewModel: RightDetailCellViewModelProtocol) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
        resultLabel.text = viewModel.result
    }
}

// MARK: - Setup view

extension RightDetailCell {
    
    private func setup() {
        setupConstraints()
        setupResultLabel()
        accessoryType = .disclosureIndicator
    }
    
    private func setupResultLabel() {
        resultLabel.textColor = .systemGray
    }
}

// MARK: - Setup constraints

extension RightDetailCell {
    
    private func setupConstraints() {
        viewHierarchy()
        
        contentView.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(snp.leadingMargin)
            $0.centerY.equalTo(snp.centerY)
        }
        
        resultLabel.snp.makeConstraints {
            $0.centerY.equalTo(snp.centerY)
            $0.trailing.equalTo(snp.trailingMargin).offset(-16)
        }
        
    }
    
    private func viewHierarchy() {
        addSubview(titleLabel)
        addSubview(resultLabel)
    }
}
