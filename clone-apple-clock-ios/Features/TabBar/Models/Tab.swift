//
//  Tabs.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 08/02/22.
//

import Foundation
import UIKit

enum Tab: CaseIterable {
    case worldClock
    case alarm
    case stopWatch
    case timer
    
    var title: String {
        switch self {
        case .worldClock: return "word_clock_label".localize(.tabBar)
        case .alarm: return "alarm_label".localize(.tabBar)
        case .stopWatch: return "stopWatch_label".localize(.tabBar)
        case .timer: return "timer_label".localize(.tabBar)
        }
    }
    
    var image: UIImage {
        switch self {
        case .worldClock: return UIImage.Icons.worldClock
        case .alarm: return UIImage.Icons.alarm
        case .stopWatch: return UIImage.Icons.stopWatch
        case .timer: return UIImage.Icons.timer
        }
    }
}
