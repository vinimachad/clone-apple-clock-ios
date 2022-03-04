//
//  GetAlarmsUseCaseMock.swift
//  clone-apple-clock-iosTests
//
//  Created by Vinicius Galhardo Machado on 25/02/22.
//

import Foundation
@testable import clone_apple_clock_ios

class GetAlarmsUseCaseMock: GetAlarmsUseCaseProtocol {
    
    @Spy var invokedExecute: Void?
    
    var alarms: [AlarmCoreData]?
    var error: Error?
    
    func execute(success: Success?, failure: Failure?) {
        invokedExecute = ()
        
        if let alarms = alarms {
            success?(alarms)
        }
        
        if let error = error {
            failure?(error.localizedDescription)
        }
    }
}
