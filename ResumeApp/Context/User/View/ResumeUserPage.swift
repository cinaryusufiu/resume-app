//
//  ResumeUserPage.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 1.05.2022.
//

import UIKit

protocol ResumeUserPageDelegate: NSObjectProtocol {
    func openImagePickerController()
}

final class ResumeUserPage: ResumePageView {
    
    weak var delegate: ResumeUserPageDelegate?
    
    var didTappedRegisterButton: ((_ model: UserModel)->())?
    
    var viewModel: ResumeUserVM? {
        didSet {
            updateUI()
        }
    }
    
    //MARK: - UI Properties
     lazy var buttonPlus : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = AppColor.coral
        button.tintColor = .white
        button.setImage(UIImage(named: "plus")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.addTarget(self, action: #selector(handlePlusButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var textFieldName: ResumeTextField = {
        let textfield = ResumeTextField()
        textfield.placeholderText = "Name"
        textfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        return textfield
    }()
    
    private lazy var textFieldLastName: ResumeTextField = {
        let textfield = ResumeTextField()
        textfield.placeholderText = "LastName"
        textfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        return textfield
    }()
    
    private lazy var textFieldMail: ResumeTextField = {
        let textfield = ResumeTextField()
        textfield.placeholderText = "E-Posta"
        textfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        return textfield
    }()
    
    private lazy var textFieldPhone: ResumeTextField = {
        let textfield = ResumeTextField()
        textfield.placeholderText = "Phone Number"
        textfield.keyboardType = .numberPad
        textfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        return textfield
    }()
    
    private let buttonRegister: ResumeButton = {
        let button = ResumeButton(style: .light)
        button.title = "Register"
        button.addTarget(self, action: #selector(onTappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    private let viewContainerCircle: UIView = UIView()
    
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

        //textField has height in subclass You can see
        stackView.addArrangedSubview(viewContainerCircle)
        viewContainerCircle.addSubview(buttonPlus)
        stackView.addArrangedSubview(textFieldName)
        stackView.addArrangedSubview(textFieldLastName)
        stackView.addArrangedSubview(textFieldMail)
        stackView.addArrangedSubview(textFieldPhone)
        stackView.addArrangedSubview(UIView())
        stackView.addArrangedSubview(buttonRegister)
    }
    
    private func prepareUIAnchor(){
        
        viewContainerCircle.snp.makeConstraints { (maker) in
            maker.height.equalTo(UIView.width * 0.64)
        }
        
        buttonPlus.snp.makeConstraints { (maker) in
            maker.centerX.centerY.equalToSuperview()
            maker.width.height.equalTo(viewContainerCircle.snp.height).multipliedBy(0.68)
        }
    
        buttonRegister.snp.makeConstraints { (maker) in
            maker.height.equalTo(54)
        }
    }
    
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField == textFieldMail {
            textField.text = textField.text?.lowercased()
        }
        if textField != textFieldPhone {
            return
        }
        
        guard let phone = textField.text else { return }
        
        textField.text =  phone.applyPatternOnNumbers(pattern: "+# (###) ###-####", replacementCharacter: "#")
    }
    
    @objc private func onTappedRegisterButton() {
        guard let name = self.textFieldName.text , !name.isEmpty else {
            AlertHelper.shared.showAlert(title: "Error", description: "Please fill name area", closeButtonTitle: "Close")
            return  }
        
        guard let lastName = self.textFieldLastName.text , !lastName.isEmpty else {
            AlertHelper.shared.showAlert(title: "Error", description: "Please fill lastName area", closeButtonTitle: "Close")
            return  }
        
        guard let email = self.textFieldMail.text , email.isValidEmail else {
            AlertHelper.shared.showAlert(title: "Error", description: "Please fill email area", closeButtonTitle: "Close")
            return  }
        
        guard let phone = self.textFieldPhone.text , phone.isValidPhoneNumber else {
            AlertHelper.shared.showAlert(title: "Error", description: "Please fill phone area", closeButtonTitle: "Close")
            return  }
        
        
        // TODO: Create usermodel
        self.didTappedRegisterButton?(UserModel())
    }
    
    @objc func handlePlusButton(){
        delegate?.openImagePickerController()
    }
    
    func setProfilePhoto(image: UIImage) {
        self.buttonPlus.setBackgroundImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
    }
}




import UIKit

extension String {
  
    var isValidEmail: Bool {
        // http://emailregex.com/
        let regex = "^(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])$"
        return range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
    
    var isValidPhoneNumber: Bool {
        let types:NSTextCheckingResult.CheckingType = [.phoneNumber]
        guard let detector = try? NSDataDetector(types: types.rawValue) else { return false }
        if let match = detector.matches(in: self, options: [], range: NSMakeRange(0, count)).first?.phoneNumber {
            return match == self
        }else{
            return false
        }
    }
    
    func applyPatternOnNumbers(pattern: String, replacementCharacter: Character) -> String {
        var pureNumber = self.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
        for index in 0 ..< pattern.count {
            guard index < pureNumber.count else { return pureNumber }
            let stringIndex = String.Index(utf16Offset: index, in: pattern)
            let patternCharacter = pattern[stringIndex]
            guard patternCharacter != replacementCharacter else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
        }
        return pureNumber
    }
}
