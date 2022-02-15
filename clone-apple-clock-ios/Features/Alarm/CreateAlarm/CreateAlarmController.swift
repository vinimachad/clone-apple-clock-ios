//
//  CreateAlarmController.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 13/02/22.
//

import Foundation
import UIKit

class CreateAlarmController<ViewModel: CreateAlarmProtocol>: UIViewController {
    
    // MARK: - Private properties
    
    private let contentView: CreateAlarmView
    private var viewModel: ViewModel
    
    // MARK: - Init
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        contentView = CreateAlarmView()
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
    
    // MARK: - Setup
    
    private func setupNavigation() {
        defaultNavigationBar("add_alarm_label".localize(.alarm))
        navigationController?.navigationBar.backgroundColor = .systemGray6
        setSystemButton(.right, selector: #selector(didSaveAlarm), style: .save)
        setSystemButton(.left, selector: #selector(didSaveAlarm), style: .cancel)
    }
    
    // MARK: - Actions
    
    @objc private func didSaveAlarm() {
        
    }
}

// MARK: - Bind

extension CreateAlarmController {
    
    private func bind() {
        contentView.bindIn(viewModel: viewModel)
    }
}
