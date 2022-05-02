//
//  AppFont.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 29.04.2022.
//

import UIKit

enum AppFont: String {
    
    case regular = "JosefinSans-Regular"
    case semiBold = "JosefinSans-SemiBold"
    case italic = "JosefinSans-Italic"
    case thin = "JosefinSans-Thin"
    case light = "JosefinSans-Light"
    case medium = "JosefinSans-Medium"
    case mediumItalic = "JosefinSans-MediumItalic"
    case extraLight = "JosefinSans-ExtraLight"
    case boldThin = "JosefinSans-Thin_Bold"
    case boldItalic = "JosefinSans-BoldItalic"
    case boldThinItalic = "JosefinSans-ThinItalic_Bold-Italic"
    case semiBoldThin = "JosefinSans-Thin_SemiBold"
    case semiboldItalic = "JosefinSans-SemiBoldItalic"
    case semiBoldThinItalic = "JosefinSans-ThinItalic_SemiBold-Italic"
    case thinItalic = "JosefinSans-ThinItalic_Italic"
    case extraLightItalic = "JosefinSans-ExtraLightItalic"
    case thinLight = "JosefinSans-Thin_Light"
    
    func of(size: CGFloat) -> UIFont {
        return UIFont(name: self.rawValue, size: size)!
    }
}
