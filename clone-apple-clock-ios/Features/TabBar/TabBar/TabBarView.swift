//
//  TabBarView.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 06/02/22.
//

import UIKit
import SnapKit

protocol TabBarViewModelProtocol {}

class TabBarView: UIView {
    
    // MARK: - UI Components
    
    // MARK: - Private properties
    
    private var viewModel: TabBarViewModelProtocol?
    
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
    
    func bindIn(viewModel: TabBarViewModelProtocol) {
        self.viewModel = viewModel
    }
}

// MARK: - Setup view

extension TabBarView {
    
    private func setup() {
        setupConstraints()
    }
}

// MARK: - Setup constraints

extension TabBarView {
    
    private func setupConstraints() {
        viewHierarchy()
    }
    
    private func viewHierarchy() {
        
    }
}
