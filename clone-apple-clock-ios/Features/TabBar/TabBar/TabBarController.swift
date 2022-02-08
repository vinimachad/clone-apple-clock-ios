//
//  TabBarController.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 06/02/22.
//

import Foundation
import UIKit

class TabBarController<ViewModel: TabBarProtocol>: UIViewController {
    
    // MARK: - Private properties
    
    private let contentView: TabBarView
    private var viewModel: ViewModel
    
    // MARK: - Init
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
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
}

// MARK: - Bind

extension TabBarController {
    
    private func bind() {
        contentView.bindIn(viewModel: viewModel)
    }
}
