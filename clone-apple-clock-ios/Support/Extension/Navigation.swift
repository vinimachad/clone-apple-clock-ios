//
//  Navigation.swift
//  clone-apple-clock-ios
//
//  Created by Vinicius Galhardo Machado on 13/02/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    enum NavigationSide {
        case left
        case right
    }
    
    func defaultNavigationBar(_ title: String? = nil) {
        self.title = title
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .orange
        navigationController?.navigationBar.backgroundColor = .clear
        setDefaultBackButton()
    }
    
    func hiddenNavigationBar(_ isHidden: Bool = true) {
        navigationController?.isNavigationBarHidden = true
    }
    
    func setLargeTitle() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    func setSystemButton(_ side: NavigationSide, selector: Selector, style: UIBarButtonItem.SystemItem) {
        let button = UIBarButtonItem(barButtonSystemItem: style, target: self, action: selector)
        button.tintColor = .orange
        
        switch side {
        case .left: navigationController?.navigationBar.topItem?.leftBarButtonItem = button
        case .right: navigationController?.navigationBar.topItem?.rightBarButtonItem = button
        }
    }
    
    func setDefaultBackButton() {
        navigationController?.navigationBar.topItem?.backButtonTitle = "Voltar"
    }
}
