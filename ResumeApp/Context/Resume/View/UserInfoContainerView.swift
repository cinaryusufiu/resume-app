//
//  UserInfoContainerView.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 1.05.2022.
//

import UIKit

final class UserInfoContainerView: ResumeBaseCVCell {
    
    var viewModel: ResumeUserVM? {
        didSet{
            updateUI()
        }
    }
    
    private let imageViewResume: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = AppColor.orangeyRed
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    private let labelTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldThin(22)
        label.textAlignment = .left
        label.textColor = AppColor.dusk
        label.text = "My first Resume Title"
        return label
    }()
    
    private let labelName: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.semiBold(16)
        label.textAlignment = .left
        label.textColor = AppColor.dusk
        label.text = "Yusuf Çınar"
        return label
    }()
    
    private let labelEmail: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.semiBold(16)
        label.textAlignment = .left
        label.textColor = AppColor.dusk
        label.text = "cinaryusufiu@gmail.com"
        return label
    }()
    
    private let labelDesc: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.semiBold(12)
        label.textAlignment = .left
        label.textColor = AppColor.dusk
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Here’s a sample resume with a career objective. We created it in our builder. We created it in our builder"
        return label
    }()
    
    private let buttonEditUserInfo: ResumeButton = {
        let button = ResumeButton(style: .light)
        button.title = "Edit User info"
        button.addTarget(self, action: #selector(onTappedEditButton), for: .touchUpInside)
        return button
    }()
    
    override func configureUI() {
        super.configureUI()
        self.backgroundColor = AppColor.white
        
        prepareSubview()
        prepareUIAnchor()
    }
    
    //MARK: - Private Functions
    private func prepareSubview(){
        addSubview(imageViewResume)
        addSubview(labelTitle)
        addSubview(labelName)
        addSubview(labelEmail)
        addSubview(labelDesc)
        addSubview(buttonEditUserInfo)
    }
    
    private func prepareUIAnchor(){
        
        imageViewResume.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(20)
            maker.centerX.equalToSuperview()
            maker.height.equalTo(140)
            maker.width.equalTo(140)
        }
        
        labelTitle.snp.makeConstraints { maker in
            maker.leading.trailing.equalToSuperview().inset(12)
            maker.top.equalTo(imageViewResume.snp.bottom).offset(12)
        }
        
        labelName.snp.makeConstraints { maker in
            maker.leading.trailing.equalToSuperview().inset(12)
            maker.top.equalTo(labelTitle.snp.bottom).offset(8)
        }
        
        labelEmail.snp.makeConstraints { maker in
            maker.leading.trailing.equalToSuperview().inset(12)
            maker.top.equalTo(labelName.snp.bottom).offset(8)
        }
        
        labelDesc.snp.makeConstraints { maker in
            maker.leading.trailing.equalToSuperview().inset(12)
            maker.top.equalTo(labelEmail.snp.bottom).offset(12)
        }
        
        buttonEditUserInfo.snp.makeConstraints { maker in
            maker.leading.trailing.bottom.equalToSuperview().inset(12)
            maker.height.equalTo(48)
        }
        
        self.snp.makeConstraints { maker in
            maker.height.equalTo(380)
        }
       
    }
    
    private func updateUI() {
        
    }
    
    @objc private func onTappedEditButton() {
    
      
    }
}
