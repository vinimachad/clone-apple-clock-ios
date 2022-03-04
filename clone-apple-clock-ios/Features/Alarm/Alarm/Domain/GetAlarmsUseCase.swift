//
//  GetAlarmsUseCase.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 24/02/22.
//

import Foundation

protocol GetAlarmsUseCaseProtocol {
    typealias Success = (([AlarmCoreData]) -> Void)
    typealias Failure = ((String) -> Void)
    func execute(success: Success?, failure: Failure?)
}

class GetAlarmsUseCase: GetAlarmsUseCaseProtocol {
    
    // MARK: - Private properties
    
    private var api: AlarmRoutesProtocol
    
    // MARK: - Init
    
    init(api: AlarmRoutesProtocol) {
        self.api = api
    }
    
    func execute(success: Success?, failure: Failure?) {
        api.getAlarms(name: "AlarmCoreData", completion: { result in
            switch result {
            case .success(let res): success?(res as! [AlarmCoreData])
            case .failure(let error): failure?(error.localizedDescription)
            }
        })
    }
}

