//
//  TabBarView.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 06/02/22.
//

import UIKit
import SnapKit

protocol TabBarViewModelProtocol {
    var tabs: [UITabBarItem] { get }
    var firstSelectedItem: UITabBarItem { get }
    func didSelectTabItem(_ tag: Int)
}

class TabBarView: UIView {
    
    // MARK: - UI Components
    
    private var tabBar = UITabBar()
    
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
        tabBar.setItems(viewModel.tabs, animated: true)
        tabBar.selectedItem = viewModel.firstSelectedItem
    }
}

// MARK: - Setup view

extension TabBarView {
    
    private func setup() {
        setupConstraints()
        setupTabBar()
        backgroundColor = .black
    }
    
    private func setupTabBar() {
        tabBar.delegate = self
        tabBar.tintColor = .systemOrange
        tabBar.barTintColor = .black
        tabBar.isTranslucent = false
    }
}

// MARK: - Setup constraints

extension TabBarView {
    
    func setViewAboveTabBar(_ view: UIView) {
        addSubview(view)
        sendSubviewToBack(view)
        
        view.snp.makeConstraints {
            $0.left.trailing.equalTo(0)
            $0.bottom.equalTo(tabBar.snp.top)
            $0.top.equalTo(snp.topMargin)
        }
    }
    
    private func setupConstraints() {
        viewHierarchy()
        
        tabBar.snp.makeConstraints {
            $0.bottom.equalTo(0)
            $0.leading.trailing.equalTo(0)
            $0.height.equalTo(100)
        }
    }
    
    private func viewHierarchy() {
        addSubview(tabBar)
    }
}

extension TabBarView: UITabBarDelegate {
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        viewModel?.didSelectTabItem(item.tag)
    }
}
