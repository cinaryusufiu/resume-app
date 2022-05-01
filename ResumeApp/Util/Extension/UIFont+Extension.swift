//
//  UIFont+Extension.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 29.04.2022.
//

import UIKit

extension UIFont {

    static func regular(_ size: CGFloat) -> UIFont {
        return AppFont.regular.of(size: size)
    }

    static func semiBold(_ size: CGFloat) -> UIFont {
        return AppFont.semiBold.of(size: size)
    }
    
    static func italic(_ size: CGFloat) -> UIFont {
        return AppFont.italic.of(size: size)
    }
    
    static func light(_ size: CGFloat) -> UIFont {
        return AppFont.light.of(size: size)
    }
    
    static func medium(_ size: CGFloat) -> UIFont {
        return AppFont.medium.of(size: size)
    }
    
    static func mediumItalic(_ size: CGFloat) -> UIFont {
        return AppFont.mediumItalic.of(size: size)
    }
    
    static func extraLight(_ size: CGFloat) -> UIFont {
        return AppFont.extraLight.of(size: size)
    }
    
    static func boldThin(_ size: CGFloat) -> UIFont {
        return AppFont.boldThin.of(size: size)
    }
    
    static func boldItalic(_ size: CGFloat) -> UIFont {
        return AppFont.boldItalic.of(size: size)
    }
    
    static func boldThinItalic(_ size: CGFloat) -> UIFont {
        return AppFont.boldThinItalic.of(size: size)
    }
    
    static func semiBoldThin(_ size: CGFloat) -> UIFont {
        return AppFont.semiBoldThin.of(size: size)
    }
    
    static func semiboldItalic(_ size: CGFloat) -> UIFont {
        return AppFont.semiboldItalic.of(size: size)
    }
    
    static func semiBoldThinItalic(_ size: CGFloat) -> UIFont {
        return AppFont.semiBoldThinItalic.of(size: size)
    }
    
    static func thinItalic(_ size: CGFloat) -> UIFont {
        return AppFont.thinItalic.of(size: size)
    }
    
    static func extraLightItalic(_ size: CGFloat) -> UIFont {
        return AppFont.extraLightItalic.of(size: size)
    }
    
    static func thinLight(_ size: CGFloat) -> UIFont {
        return AppFont.thinLight.of(size: size)
    }
}
