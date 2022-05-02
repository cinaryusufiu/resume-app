//
//  ResumeProjectPage.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 2.05.2022.
//

import UIKit

final class ResumeProjectPage: ResumePageView {
    
    var didTappedCreateButton: ((_ model: ProjectModel?)->())?
    
    var viewModel: ResumeProjectVM? {
        didSet {
            updateUI()
        }
    }
    
    //MARK: - UI Properties
    private lazy var textFieldName: ResumeTextField = {
        let textfield = ResumeTextField()
        textfield.placeholderText = "Name"
        return textfield
    }()
    
    private lazy var textFieldSize: ResumeTextField = {
        let textfield = ResumeTextField()
        textfield.placeholderText = "Size"
        textfield.keyboardType = .numberPad
        return textfield
    }()
    
    private let labelDesc: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.semiBold(16)
        label.textAlignment = .left
        label.textColor = AppColor.dusk
        label.text = "Project Description"
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
    
    private lazy var textFieldUseTech: ResumeTextField = {
        let textfield = ResumeTextField()
        textfield.placeholderText = "Use tech"
        return textfield
    }()
    
    private lazy var textFieldRole: ResumeTextField = {
        let textfield = ResumeTextField()
        textfield.placeholderText = "Role"
        return textfield
    }()
    

    private let buttonSave: ResumeButton = {
        let button = ResumeButton(style: .light)
        button.title = "Sve Project"
        button.addTarget(self, action: #selector(onTappedRegisterButton), for: .touchUpInside)
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
       
    }
    
    //MARK: - Private Functions
    private func prepareSubview(){

        stackView.addArrangedSubview(textFieldName)
        stackView.addArrangedSubview(textFieldSize)
        stackView.addArrangedSubview(UIView())
        stackView.addArrangedSubview(labelDesc)
        stackView.addArrangedSubview(textViewDescription)
        stackView.addArrangedSubview(textFieldUseTech)
        stackView.addArrangedSubview(textFieldRole)
        stackView.addArrangedSubview(UIView())
        stackView.addArrangedSubview(buttonSave)
    }
    
    private func prepareUIAnchor(){
        
        
        buttonSave.snp.makeConstraints { (maker) in
            maker.height.equalTo(54)
        }
        
        textViewDescription.snp.makeConstraints { (maker) in
            maker.height.equalTo(120)
        }
    }
    
    
    @objc private func onTappedRegisterButton() {
      
        
        // TODO: Create usermodel
      //  self.didTappedCreateButton?(ProjectModel(id: UUID., name: <#T##String?#>, size: <#T##String?#>, projectDesc: <#T##String?#>, useTech: <#T##String?#>, role: <#T##String?#>))
    }
}
