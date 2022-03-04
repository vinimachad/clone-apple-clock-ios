//
//  CreateAlarmController.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 13/02/22.
//

import Foundation
import UIKit

protocol CreateAlarmControllerDelegate: AnyObject {
    func returnNavigation()
    func pushRepeatAlarm()
}

class CreateAlarmController<ViewModel: CreateAlarmProtocol>: UIViewController, PostAlarm {
    
    // MARK: - Private properties
    
    private weak var delegate: CreateAlarmControllerDelegate?
    private let contentView: CreateAlarmView
    private var viewModel: ViewModel
    
    // MARK: - Init
    
    init(viewModel: ViewModel, delegate: CreateAlarmControllerDelegate?) {
        self.viewModel = viewModel
        self.delegate = delegate
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
        setSystemButton(.left, selector: #selector(didCancelToCreateAlarm), style: .cancel)
    }
    
    // MARK: - Actions
    
    @objc private func didSaveAlarm() {
        viewModel.didSaveAlarm()
    }
    
    @objc private func didCancelToCreateAlarm() {
        delegate?.returnNavigation()
        postUpdateAlarm()
    }
}

// MARK: - Bind

extension CreateAlarmController {
    
    private func bind() {
        contentView.bindIn(viewModel: viewModel)
        
        viewModel.onSuccessToSaveAlarm = { [weak self] in
            self?.delegate?.returnNavigation()
            self?.postUpdateAlarm()
        }
        
        viewModel.onSelectCell = { [weak self] kind in
            switch kind {
            case .repeat: self?.delegate?.pushRepeatAlarm()
            case .label: ""//delegate?.
            case .sound: ""//delegate?.
            }
        }
    }
}
