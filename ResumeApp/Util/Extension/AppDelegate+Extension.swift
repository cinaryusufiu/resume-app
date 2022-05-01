//
//  AppDelegate+Extension.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 29.04.2022.
//

import UIKit
import IQKeyboardManagerSwift

extension AppDelegate {
    
    func configureRootVC(){
        let navController = UINavigationController()
        coordinator = AppCoordinator(navigationController: navController)
        coordinator?.start()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
    }
    
    //MARK:- Tools
    func configureTools() {
        configureIQKeyboardManager()
    }
    
    private func configureIQKeyboardManager(){
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldToolbarUsesTextFieldTintColor = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 10.0
    }
}
