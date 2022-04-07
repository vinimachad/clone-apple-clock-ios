//
//  SaveRepeatDaysUseCase.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 19/03/22.
//

import Foundation

protocol SaveRepeatDaysUseCaseProtocol {
    typealias Success = (() -> Void)?
    typealias Failure = ((String) -> Void)?
    func execute(failure: Failure, success: Success)
}

class SaveRepeatDaysUseCase: SaveRepeatDaysUseCaseProtocol {
    
    // MARK: - Private properties
    
    private var api: RepeatDaysRoutesProtocol
    
    // MARK: - Init
    
    init(api: RepeatDaysRoutesProtocol) {
        self.api = api
    }
    
    func execute(failure: Failure, success: Success) {
        api.
    }
}
