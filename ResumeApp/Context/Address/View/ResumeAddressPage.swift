//
//  ResumeAddressPage.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 2.05.2022.
//

import UIKit

final class ResumeAddressPage: ResumePageView {
    
    var didTappedSaveButton: ((_ model: UserModel.AddressModel)->())?
    
    var viewModel: ResumeAddressVM? {
        didSet {
            updateUI()
        }
    }
    
    private let labelName: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.semiBold(16)
        label.textAlignment = .left
        label.textColor = AppColor.dusk
        label.text = "Address Name:"
        return label
    }()
    
    private lazy var textFieldName: ResumeTextField = {
        let textfield = ResumeTextField()
        textfield.placeholderText = "Name"
        return textfield
    }()
    
    private let labelDesc: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.semiBold(16)
        label.textAlignment = .left
        label.textColor = AppColor.dusk
        label.text = "Address Description"
        return label
    }()
    
    private let textViewDescription: UITextView = {
        let tv = UITextView(frame: .zero)
        tv.layer.borderColor = AppColor.coral.cgColor
        tv.layer.borderWidth = 1
        tv.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tv.textColor = AppColor.dusk
        tv.font =  UIFont.semiBold(13)
        tv.backgroundColor = AppColor.white
        tv.layer.cornerRadius = 4
        return tv
    }()
    
    private let buttonSave: ResumeButton = {
        let button = ResumeButton(style: .light)
        button.title = "Save Address"
        button.addTarget(self, action: #selector(onTappedButtonSave), for: .touchUpInside)
        return button
    }()
    
    override func configureUI() {
        super.configureUI()
        configureScrollView()
        prepareSubview()
        prepareUIAnchor()
    }
    
    override func updateUI() {
        super.updateUI()
        textFieldName.text = viewModel?.name
        textViewDescription.text = viewModel?.desc
    }
    
    //MARK: - Private Functions
    private func prepareSubview(){

        stackView.addArrangedSubview(labelName)
        stackView.addArrangedSubview(textFieldName)
        stackView.addArrangedSubview(UIView())
        
        stackView.addArrangedSubview(labelDesc)
        stackView.addArrangedSubview(textViewDescription)
        stackView.addArrangedSubview(UIView())
        stackView.addArrangedSubview(buttonSave)
    }
    
    private func prepareUIAnchor(){
    
        textViewDescription.snp.makeConstraints { (maker) in
            maker.height.equalTo(120)
        }
        buttonSave.snp.makeConstraints { (maker) in
            maker.height.equalTo(54)
        }
    }
    
    @objc private func onTappedButtonSave() {
        guard let name = self.textFieldName.text , !name.isEmpty else {
            AlertHelper.shared.showAlert(title: "Error", description: "Please fill name area", closeButtonTitle: "Close")
            return  }
        
        guard let desc = self.textViewDescription.text , !desc.isEmpty else {
            AlertHelper.shared.showAlert(title: "Error", description: "Please fill textViewDescription area", closeButtonTitle: "Close")
            return  }

        let model = UserModel.AddressModel(id: UUID().uuidString, name: name, addrDesc: desc)
        self.didTappedSaveButton?(model)
    }
}
