//
//  CreateAlarmView.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 13/02/22.
//

import UIKit
import SnapKit

protocol CreateAlarmViewModelProtocol {}

class CreateAlarmView: UIView {
    
    // MARK: - UI Components
    
    // MARK: - Private properties
    
    private var viewModel: CreateAlarmViewModelProtocol?
    
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
    }
}

// MARK: - Setup view

extension CreateAlarmView {
    
    private func setup() {
        setupConstraints()
        backgroundColor = .systemGray6
    }
}

// MARK: - Setup constraints

extension CreateAlarmView {
    
    private func setupConstraints() {
        viewHierarchy()
    }
    
    private func viewHierarchy() {
        
    }
}

