//
//  ResumeBaseCVCell.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 30.04.2022.
//

import UIKit

class ResumeBaseCVCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() { }
}
