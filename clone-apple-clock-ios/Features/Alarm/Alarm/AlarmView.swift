//
//  AlarmView.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 13/02/22.
//

import Foundation

import UIKit
import SnapKit


protocol AlarmViewModelProtocol {}

class AlarmView: UIView {
    
    // MARK: - UI Components
    
    private var tableView = UITableView()
    
    // MARK: - Private properties
    
    private var viewModel: AlarmViewModelProtocol?
    
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
    
    func bindIn(viewModel: AlarmViewModelProtocol) {
        self.viewModel = viewModel
    }
}

// MARK: - Setup view

extension AlarmView {
    
    private func setup() {
        setupConstraints()
    }
}

// MARK: - Setup constraints

extension AlarmView {
    
    private func setupConstraints() {
        viewHierarchy()
    }
    
    private func viewHierarchy() {
        
    }
}

