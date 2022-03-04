//
//  TitleCell.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 03/03/22.
//

import Foundation
import UIKit
import Reusable

protocol TitleCellViewModelProtocol: CellViewModelProtocol {
    var title: String { get }
}

class TitleCell: UITableViewCell, CellProtocol {
    
    // MARK: - UI Components
    
    var titleLabel = UILabel()
    
    // MARK: - Private properties
    
    private var viewModel: TitleCellViewModelProtocol?
    
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
    
    func bindIn(viewModel: TitleCellViewModelProtocol) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
    }
}

// MARK: - Setup view

extension TitleCell {
    
    private func setup() {
        setupConstraints()
    }
}

// MARK: - Setup constraints

extension TitleCell {
    
    private func setupConstraints() {
        viewHierarchy()
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(snp.leadingMargin)
            $0.trailing.equalTo(snp.trailingMargin)
            $0.top.equalTo(snp.topMargin)
            $0.bottom.equalTo(snp.bottomMargin)
        }
    }
    
    private func viewHierarchy() {
        addSubview(titleLabel)
    }
}
