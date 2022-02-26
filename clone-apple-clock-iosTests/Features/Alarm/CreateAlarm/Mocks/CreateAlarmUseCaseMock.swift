//
//  CreateAlarmUseCaseMock.swift
//  clone-apple-clock-iosTests
//
//  Created by Vinicius Galhardo Machado on 25/02/22.
//

import Foundation
@testable import clone_apple_clock_ios

class CreateAlarmUseCaseMock: CreateAlarmUseCaseProtocol {
    
    @Spy var invokedExecute: Void?
    
    var error: Error?
    
    func execute(success: Success?, failure: Failure?) {
        invokedExecute = ()
                
        if let error = error {
            failure?(error.localizedDescription)
            return
        }

        success?()
    }
}
