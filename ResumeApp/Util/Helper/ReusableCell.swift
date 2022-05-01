//
//  ReusableCell.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 29.04.2022.
//

import UIKit

protocol ReusableCell: NSObjectProtocol {
    static var defaultIdentifier: String { get }
}

extension ReusableCell where Self: UICollectionReusableView {
    
    static var defaultIdentifier: String {
        return String(describing: self)
    }
}

extension ReusableCell where Self: UITableViewCell {
    
    static var defaultIdentifier: String {
        return String(describing: self)
    }
}
