//
//  CreateAlarmUseCases.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 19/02/22.
//

import Foundation

protocol CreateAlarmUseCaseProtocol {
    typealias Success = (() -> Void)
    typealias Failure = ((String) -> Void)
    func execute(success: Success?, failure: Failure?)
}

class CreateAlarmUseCase: CreateAlarmUseCaseProtocol {
    
    // MARK: - Private properties
    
    private var api: AlarmRoutesProtocol
    
    // MARK: - Init
    
    init(api: AlarmRoutesProtocol) {
        self.api = api
    }
    
    func execute(success: Success?, failure: Failure?) {
        api.createAlarm { result in
            switch result {
            case .success(): success?()
            case .failure(let error): failure?(error.localizedDescription)
            }
        }
    }
}
