//
//  RepeatAlarmController.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 03/03/22.
//

import Foundation

import Foundation
import UIKit

class RepeatAlarmController<ViewModel: RepeatAlarmProtocol>: UIViewController {
    
    // MARK: - Private properties
    
    private let contentView: RepeatAlarmView
    private var viewModel: ViewModel
    
    // MARK: - Init
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        contentView = RepeatAlarmView()
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
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.saveDaysInRepeat()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        setupNavigation()
    }
    
    private func setupNavigation() {
        defaultNavigationBar("Repetir")
        navigationController?.navigationBar.backgroundColor = .systemGray6
    }
}

// MARK: - Bind

extension RepeatAlarmController {
    
    private func bind() {
        contentView.bindIn(viewModel: viewModel)
    }
}
