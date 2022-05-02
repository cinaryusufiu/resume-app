//
//  AdresInfoContainerView.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 2.05.2022.
//

import UIKit

final class AdresInfoContainerView: ResumeBaseCVCell {
    
    var viewModel: ResumeUserVM? {
        didSet{
            updateUI()
        }
    }
    
    var didTappedEditButton: CompletionBlock?
    
    private let labelNameTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldThin(14)
        label.textAlignment = .left
        label.textColor = AppColor.dusk
        label.text = "Adress Name: "
        return label
    }()
    
    private let labelNameValue: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.semiBold(12)
        label.textAlignment = .left
        label.textColor = AppColor.dusk
        label.text = "my home adress"
        return label
    }()
    
    private let labelDescTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldThin(14)
        label.textAlignment = .left
        label.textColor = AppColor.dusk
        label.text = "Descrition: "
        return label
    }()
    
    private let labelDescValue: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.semiBold(12)
        label.textAlignment = .left
        label.textColor = AppColor.dusk
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "70 & 75 Harley St, London W1G 9QA, England"
        return label
    }()
    
    private lazy var buttonEditAddress: ResumeButton = {
        let button = ResumeButton(style: .light)
        button.title = "Edit Address info"
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
        addSubview(labelNameTitle)
        addSubview(labelNameValue)
        addSubview(labelDescTitle)
        addSubview(labelDescValue)
        addSubview(buttonEditAddress)
    }
    
    private func prepareUIAnchor(){
        
        labelNameTitle.snp.makeConstraints { maker in
            maker.leading.trailing.top.equalToSuperview().inset(12)
        }
        
        labelNameValue.snp.makeConstraints { maker in
            maker.leading.trailing.equalToSuperview().inset(12)
            maker.top.equalTo(labelNameTitle.snp.bottom).offset(8)
        }
        
        labelDescTitle.snp.makeConstraints { maker in
            maker.leading.trailing.equalToSuperview().inset(12)
            maker.top.equalTo(labelNameValue.snp.bottom).offset(8)
        }
        
        labelDescValue.snp.makeConstraints { maker in
            maker.leading.trailing.equalToSuperview().inset(12)
            maker.top.equalTo(labelDescTitle.snp.bottom).offset(12)
        }
        
        buttonEditAddress.snp.makeConstraints { maker in
            maker.bottom.equalToSuperview().inset(12)
            maker.height.equalTo(48)
            maker.width.equalTo(self.snp.width).dividedBy(2)
            maker.centerX.equalToSuperview()
        }
        
        self.snp.makeConstraints { maker in
            maker.height.equalTo(180)
        }
       
    }
    
    private func updateUI() {
        
    }
    
    @objc private func onTappedEditButton() {
        self.didTappedEditButton?()
    }
}
