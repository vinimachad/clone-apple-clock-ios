//
//  Navigation.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 13/02/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func defaultNavigationBar(_ title: String? = nil) {
        self.title = title
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.backgroundColor = .clear
    }
    
    func hiddenNavigationBar(_ isHidden: Bool = true) {
        navigationController?.isNavigationBarHidden = true
    }
    
    func setLargeTitle() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
}
