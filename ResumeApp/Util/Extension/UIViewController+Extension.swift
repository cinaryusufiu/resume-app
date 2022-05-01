//
//  UIViewController+Extension.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 30.04.2022.
//

import UIKit

private var kViewModel: Int = 1905

extension UIViewController {
    
    var vModel: Any? {
        get {
            return objc_getAssociatedObject(self, &kViewModel) as Any?
        }
        set(newValue) {
            objc_setAssociatedObject(self, &kViewModel, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
}
