//
//  TabBarViewSnapshotTests.swift
//  clone-apple-clock-iosTests
//
//  Created by Vinicius Galhardo Machado on 10/02/22.
//

@testable import clone_apple_clock_ios
import FBSnapshotTestCase

class TabBarViewSnapshotTests: FBSnapshotTestCase {
    
    var sut: TabBarView!
    var viewModelMock: TabBarViewModelMock!
    
    override func setUp() {
        super.setUp()
        sut = TabBarView()
        viewModelMock = TabBarViewModelMock()
        sut.frame = CGRect(x: 0, y: 0, width: 414, height: 800)
    }
    
    func test_init_expectValidSnapshot() {
        FBSnapshotVerifyView(sut)
    }
    
    func test_bind_whenAllValuesIsFilled_expectValidSnapshot() {
        let alarmItem = UITabBarItem(title: "Alarme", image: UIImage(systemName: "alarm.fill"), tag: 0)
        let timerItem = UITabBarItem(title: "Temporizador", image: UIImage(systemName: "timer"), tag: 1)
        viewModelMock.tabs = [alarmItem, timerItem]
        sut.bindIn(viewModel: viewModelMock)
        FBSnapshotVerifyView(sut)
    }
}
