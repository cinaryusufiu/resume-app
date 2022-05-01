//
//  UINavigationController+Extension.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 29.04.2022.
//

import UIKit

extension UINavigationController {
    
    static func navBarHeight() -> CGFloat {
        let nVc = UINavigationController(rootViewController: UIViewController(nibName: nil, bundle: nil))
        let navBarHeight = nVc.navigationBar.frame.size.height
        return navBarHeight
    }
}
