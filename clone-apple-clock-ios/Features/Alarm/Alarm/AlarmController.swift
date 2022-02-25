//
//  AlarmController.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 13/02/22.
//

import Foundation
import UIKit

protocol AlarmControllerDelegate: AnyObject {
    func pushCreateAlarm()
}

class AlarmController<ViewModel: AlarmProtocol>: UIViewController {
    
    // MARK: - Private properties
    
    private let contentView: AlarmView
    private weak var delegate: AlarmControllerDelegate?
    private var viewModel: ViewModel
    
    // MARK: - Init
    
    init(viewModel: ViewModel, delegate: AlarmControllerDelegate?) {
        self.viewModel = viewModel
        self.delegate = delegate
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
        setSystemButton(.right, selector: #selector(didTapAddAlarm), style: .add)
    }
    
    // MARK: - Actions
    
    @objc private func didTapAddAlarm() {
        delegate?.pushCreateAlarm()
    }
}

// MARK: - Bind

extension AlarmController {
    
    private func bind() {
        contentView.bindIn(viewModel: viewModel)
    }
}
