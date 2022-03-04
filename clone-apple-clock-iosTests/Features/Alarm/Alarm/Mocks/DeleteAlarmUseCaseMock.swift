//
//  DeleteAlarmUseCaseMock.swift
//  clone-apple-clock-iosTests
//
//  Created by Vinicius Galhardo Machado on 02/03/22.
//

import Foundation
@testable import clone_apple_clock_ios

class DeleteAlarmUseCaseMock: DeleteAlarmUseCaseProtocol {
    
    @Spy var invokedExecute: Void?
    
    var error: Error?
    
    func execute(objc: AlarmCoreData, success: Success?, failure: Failure?) {
        invokedExecute = ()
        
        if let error = error {
            failure?(error.localizedDescription)
            return
        }
        
        success?()
    }
}
