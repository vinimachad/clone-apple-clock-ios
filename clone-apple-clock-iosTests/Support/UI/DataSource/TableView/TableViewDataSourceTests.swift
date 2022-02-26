//
//  TableViewDataSourceTests.swift
//  clone-apple-clock-iosTests
//
//  Created by Vinicius Galhardo Machado on 25/02/22.
//

import Foundation
import XCTest
@testable import clone_apple_clock_ios

class TableViewDataSourceTests: XCTestCase {
    
    var sut: TableViewDataSource!
    
    override func setUp() {
        sut = TableViewDataSource()
        sut.tableView = UITableView()
    }
    
    func test_numberOfRowsInSection_whenSectionIsEmpty_expectReturnZeroAsNumberOfRowsInSection() {
        sut.sections = []
        
        let result = sut.tableView(sut.tableView!, numberOfRowsInSection: 1)
        XCTAssertEqual(result, 0)
    }
    
    func test_numberOfRowsInSection_whenSectionIsNotEmpty_expectReturnOneAsNumberOfRowsInSection() {
        sut.sections = [
            TableSection<RightDetailCell>(
                viewModels: [RightDetailCellViewModelMock()]
            )
        ]
        
        let result = sut.tableView(sut.tableView!, numberOfRowsInSection: 0)
        XCTAssertEqual(result, 1)
    }
    
    func test_cellForRowAt_whenIdentifyCell_expectCellHasTheCorrectType() {
        sut.sections = [
            TableSection<RightDetailCell>(
                viewModels: [RightDetailCellViewModelMock()]
            ),
            TableSection<RightDetailCell>(
                viewModels: [RightDetailCellViewModelMock()]
            )
        ]
        
        let cell = sut.tableView(sut.tableView!, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell.self is RightDetailCell)
    }
}
