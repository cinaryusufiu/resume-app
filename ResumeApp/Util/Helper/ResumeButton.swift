//
//  ResumeButton.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 30.04.2022.
//

import UIKit
import SnapKit

final class ResumeButton: UIButton {
    
    var style: ResumeButtonStyle? { didSet { configureView() } }
    
    enum ResumeButtonStyle {
        case light
        case dark
    }
    
    var title: String? {
        didSet {
            self.setTitle(title, for: .normal)
        }
    }
    
    var bGColor: UIColor = AppColor.darkBlueGrey {
        didSet {
            self.backgroundColor = bGColor
        }
    }
    
    var radius: CGFloat = 22 {
        didSet {
            self.layer.cornerRadius = radius
        }
    }
    
    var iconName: String = "nonCheck" {
        didSet {
            self.setImage(UIImage(named: iconName)?.withRenderingMode(.alwaysTemplate), for: .normal)
        }
    }
    
    var iconNameSystem: String = "add" {
        didSet {
            self.setImage(UIImage(systemName: iconNameSystem), for: .normal)
        }
    }
    
    var titleColor: UIColor = AppColor.white {
        didSet {
            self.setTitleColor(titleColor, for: .normal)
        }
    }
    
    var fontLabel: UIFont? = UIFont.regular(20) {
        didSet {
            self.titleLabel?.font = fontLabel
        }
    }
    
    var isIcon: Bool = false {
        didSet {
            if isIcon {
                self.setImage(UIImage(systemName: iconName), for: .normal)
                self.setTitle("", for: .normal)
            } else {
                self.setTitle(title, for: .normal)
            }
        }
    }
    
    init(style: ResumeButtonStyle) {
        super.init(frame: .zero)
        self.style = style
        configureView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    private func configureView(){
        guard let style = style else { return }
        switch style {
        case .light:
            print("dark")
        case .dark:
            print("light")
        }
        isIcon = false
        self.setTitle(title, for: .normal)
        self.backgroundColor = bGColor
        self.layer.cornerRadius = radius
        self.titleLabel?.font = fontLabel
        self.setTitleColor(titleColor, for: .normal)
    }
    
    func setTitleInsetButton(edge : UIEdgeInsets){
        self.titleEdgeInsets = edge
    }
    
    func addSpacing(spacing : CGFloat) {
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: spacing)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: 0)
    }
}
