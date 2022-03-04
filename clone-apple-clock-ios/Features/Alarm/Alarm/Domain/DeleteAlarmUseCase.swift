//
//  DeleteAlarmUseCase.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 27/02/22.
//

import Foundation

protocol DeleteAlarmUseCaseProtocol {
    typealias Success = (() -> Void)
    typealias Failure = ((String) -> Void)
    func execute(objc: AlarmCoreData, success: Success?, failure: Failure?)
}

class DeleteAlarmUseCase: DeleteAlarmUseCaseProtocol {
    
    // MARK: - Private properties
    
    private var api: AlarmRoutesProtocol
    
    // MARK: - Init
    
    init(api: AlarmRoutesProtocol) {
        self.api = api
    }
    
    func execute(objc: AlarmCoreData, success: Success?, failure: Failure?) {
        api.deleteAlarm(objc: objc, completion: { result in
            switch result {
            case .success(_): success?()
            case .failure(let error): failure?(error.localizedDescription)
            }
        })
    }
}
