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
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() { }
}

class ResumeBaseView: UIView {
    
    init() {
        super.init(frame: .zero)
        configureUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Override Functions
    func configureUI() { }
}



