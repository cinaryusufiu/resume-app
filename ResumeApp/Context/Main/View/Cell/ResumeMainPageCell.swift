//
//  ResumeMainPageCell.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 30.04.2022.
//

import UIKit

final class ResumeMainPageCell: ResumeBaseCVCell {
    
    var viewModel: ResumeMainItemVM?{
        didSet{
            updateUI()
        }
    }
    
    private let labelTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldThin(22)
        label.textAlignment = .left
        label.textColor = AppColor.dusk
        label.numberOfLines = 0
        label.text = "My first Resume Title"
        return label
    }()
    
    private let labelName: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.semiBold(16)
        label.textAlignment = .left
        label.textColor = AppColor.dusk
        label.numberOfLines = 0
        label.text = "Yusuf Çınar"
        return label
    }()
    
    private let labelEmail: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.semiBold(16)
        label.textAlignment = .left
        label.textColor = AppColor.dusk
        label.numberOfLines = 0
        label.text = "cinaryusufiu@gmail.com"
        return label
    }()
    
    private let labelDesc: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.semiBold(12)
        label.textAlignment = .left
        label.textColor = AppColor.dusk
        label.numberOfLines = 0
        label.text = "Here’s a sample resume with a career objective. We created it in our builder."
        return label
    }()
    
    override func configureUI() {
        super.configureUI()
        self.layer.cornerRadius = 12
        self.backgroundColor = .clear
        addSubview(labelTitle)
        addSubview(labelName)
        addSubview(labelEmail)
        addSubview(labelDesc)
        
        labelTitle.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.snp.top).inset(12)
            maker.leading.trailing.equalToSuperview().inset(10)
        }
        
        labelName.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.labelTitle.snp.bottom).offset(12)
            maker.leading.trailing.equalToSuperview().inset(10)
        }
        
        labelEmail.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.labelName.snp.bottom).offset(12)
            maker.leading.trailing.equalToSuperview().inset(10)
        }
        
        labelDesc.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.labelEmail.snp.bottom).offset(12)
            maker.leading.trailing.equalToSuperview().inset(10)
        }
    }
    
    private func updateUI(){
       
        guard let viewModel = viewModel else { return }
        labelTitle.text = viewModel.resumeTitle
        labelName.text = viewModel.name
        labelEmail.text = viewModel.email
        labelDesc.text = viewModel.resumeDesc
    }
}
