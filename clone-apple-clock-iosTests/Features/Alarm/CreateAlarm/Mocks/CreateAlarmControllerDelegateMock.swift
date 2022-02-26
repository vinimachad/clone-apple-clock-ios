//
//  CreateAlarmControllerDelegateMock.swift
//  clone-apple-clock-iosTests
//
//  Created by Vinicius Galhardo Machado on 25/02/22.
//

import Foundation
@testable import clone_apple_clock_ios

class CreateAlarmControllerDelegateMock: CreateAlarmControllerDelegate {
    @Spy var invokeReturnNavigation: Void?
    
    func returnNavigation() {
        invokeReturnNavigation = ()
    }
}
