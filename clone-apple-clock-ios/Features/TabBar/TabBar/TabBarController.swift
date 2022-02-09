//
//  TabBarController.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 06/02/22.
//

import Foundation
import UIKit

protocol TabBarControllerDelegate: AnyObject {
    func getControllerByTab(_ tab: Tab) -> UIViewController
}

class TabBarController<ViewModel: TabBarProtocol>: UIViewController {
    
    // MARK: - Private properties
    
    private let contentView: TabBarView
    private var viewModel: ViewModel
    private weak var delegate: TabBarControllerDelegate?
    
    private(set) var childViewController: UIViewController? {
        didSet {
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    // MARK: - Init
    
    init(viewModel: ViewModel, delegate: TabBarControllerDelegate?) {
        self.viewModel = viewModel
        self.delegate = delegate
        contentView = TabBarView()
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func loadView() {
        super.loadView()
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    // MARK: - Setup
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
}

extension TabBarController {
    
    // MARK: - Bind
    
    private func bind() {
        contentView.bindIn(viewModel: viewModel)
        
        viewModel.onSelectedTabItem = { [weak self] tabItem in
            if let vc = self?.delegate?.getControllerByTab(tabItem) {
                self?.addViewController(vc)
            }
        }
    }
    
    private func addViewController(_ viewController: UIViewController) {
        if let oldViewController = childViewController {
            oldViewController.willMove(toParent: nil)
            oldViewController.view.removeFromSuperview()
            oldViewController.removeFromParent()
        }
        
        addChild(viewController)
        contentView.setViewAboveTabBar(viewController.view)
        viewController.didMove(toParent: self)
        childViewController = viewController
    }
}
