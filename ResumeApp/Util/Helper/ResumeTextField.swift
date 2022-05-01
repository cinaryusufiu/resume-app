//
//  ResumeTextField.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 1.05.2022.
//

import UIKit
import SnapKit

final class ResumeTextField: UITextField, UITextFieldDelegate {
    
    private var showPassword: Bool = false {
        didSet {
            self.isSecureTextEntry = !showPassword
        }
    }
    
    var placeholderText: String = "" {
        didSet {
            configurePlaceHolder()
        }
    }
    
    var isPasswordTextField: Bool = false {
        didSet {
            self.isSecureTextEntry = isPasswordTextField
        }
    }
    
    var radius: CGFloat = 15 {
        didSet {
            self.layer.cornerRadius = radius
        }
    }
    
    private override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.leftViewMode = .always
        self.rightViewMode = .always
        self.textColor = AppColor.dusk
        self.layer.cornerRadius = radius
        self.layer.borderWidth = 0.5
        self.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        
        self.snp.makeConstraints { (maker) in
            maker.height.equalTo(52)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func configurePlaceHolder() {
        let myMutableStringTitle = NSMutableAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.font: UIFont.regular(20)])
        myMutableStringTitle.addAttribute(NSAttributedString.Key.foregroundColor, value: AppColor.dusk, range: NSRange(location:0,length:placeholderText.count))
        self.attributedPlaceholder = myMutableStringTitle
    }
    
    let insetLeft :CGFloat = 14
    let insetTop :CGFloat = 4
    let insetBottom :CGFloat = 4
    let insertRight: CGFloat = 0
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: insetTop, left: insetLeft, bottom: insetBottom , right: insertRight))
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: insetTop, left: insetLeft, bottom: insetBottom , right: insertRight))
    }
}

