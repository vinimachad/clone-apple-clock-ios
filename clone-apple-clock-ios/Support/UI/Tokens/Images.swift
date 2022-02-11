//
//  Images.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 08/02/22.
//

import Foundation
import UIKit

extension UIImage {
    
    enum Icons {
        static var alarm: UIImage = UIImage(systemName: "alarm.fill") ?? UIImage()
        static var worldClock: UIImage = UIImage(systemName: "network") ?? UIImage()
        static var timer: UIImage = UIImage(systemName: "timer") ?? UIImage()
        static var stopWatch: UIImage = UIImage(systemName: "stopwatch.fill") ?? UIImage()
    }
}

