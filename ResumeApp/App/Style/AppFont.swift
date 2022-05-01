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

import UIKit

extension AppColor {
    
    enum ColorName: String {
        case red
        case white
        case dusk
        case greenyBlue
        case coral
        case blueyGrey
        case marigold
        case greyishPurple
        case lightPeriwinkle
        case orangeyRed
        case darkBlueGrey
        case brownishGrey
        case silver
        case veryLightPink
        case lightishGreen
    }
    
    static func findColor(name: ColorName) -> UIColor {
        guard let color = UIColor(named: name.rawValue) else {
            return .clear
        }
        return color
    }
}

enum AppColor {
    static let dusk = findColor(name: ColorName.dusk)
    static let greenyBlue = findColor(name: ColorName.greenyBlue)
    static let white = findColor(name: ColorName.white)
    static let coral = findColor(name: ColorName.coral)
    static let blueyGrey = findColor(name: ColorName.blueyGrey)
    static let marigold = findColor(name: ColorName.marigold)
    static let greyishPurple = findColor(name: ColorName.greyishPurple)
    static let lightPeriwinkle = findColor(name: ColorName.lightPeriwinkle)
    static let orangeyRed = findColor(name: ColorName.orangeyRed)
    static let darkBlueGrey = findColor(name: ColorName.darkBlueGrey)
    static let brownishGrey = findColor(name: ColorName.brownishGrey)
    static let silver = findColor(name: ColorName.silver)
    static let veryLightPink = findColor(name: ColorName.veryLightPink)
    static let lightishGreen = findColor(name: ColorName.lightishGreen)
}
