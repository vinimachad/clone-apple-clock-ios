//
//  RightDetailCellViewModelMock.swift
//  clone-apple-clock-iosTests
//
//  Created by Vinicius Galhardo Machado on 25/02/22.
//

import Foundation
@testable import clone_apple_clock_ios

class RightDetailCellViewModelMock: RightDetailCellViewModelProtocol {
    
    @Spy var invokeDidSelectedCell: Void?
    
    var title: String?
    var result: String?
    var onSelectCell: (() -> Void)?
    
    func didSelectedCell() {
        invokeDidSelectedCell = ()
    }
}
