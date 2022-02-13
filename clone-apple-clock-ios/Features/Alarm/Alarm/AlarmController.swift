//
//  AlarmController.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 13/02/22.
//

import Foundation

import Foundation
import UIKit

class AlarmController<ViewModel: AlarmProtocol>: UIViewController {
    
    // MARK: - Private properties
    
    private let contentView: AlarmView
    private var viewModel: ViewModel
    
    // MARK: - Init
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        contentView = AlarmView()
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
        setupNavigation()
        bind()
    }
    
    func setupNavigation() {
        defaultNavigationBar("alarm_label".localize(.tabBar))
        setLargeTitle()
    }
}

// MARK: - Bind

extension AlarmController {
    
    private func bind() {
        contentView.bindIn(viewModel: viewModel)
    }
}
