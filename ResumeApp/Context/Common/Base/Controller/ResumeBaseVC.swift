//
//  ResumeBaseVC.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 29.04.2022.
//

import UIKit
import SnapKit

protocol BaseVMProtocol: NSObjectProtocol {
    associatedtype VMType: ResumeBaseVM
    var viewModel: VMType! { get set }
}

protocol BaseViewProtocol: NSObjectProtocol {
    associatedtype PageType: ResumePageView
    var viewPage: PageType! { get set }
}

class ResumeBaseVC<Y: ResumePageView , U: ResumeBaseVM >: UIViewController , BaseVMProtocol , BaseViewProtocol {
    
    // MARK: - Properties
    var viewPage: Y!
    var viewModel: U!
    let spacingButtons: CGFloat = 10
    
    // MARK: - UI Properties
    private let viewNavigation : UIView = UIView()
    private let viewContainer : UIView = UIView()
    private let viewBorder: UIView = UIView()
    
    private let labelTitle: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.semiBold(20)
        lbl.numberOfLines = 0
        return lbl
    }()

    private lazy var buttonBack: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.left")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.addTarget(self, action: #selector(buttonBackTapped), for: .touchUpInside)
        button.contentMode = .scaleAspectFill
        return button
    }()

    private lazy var buttonClose: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "xmark")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.addTarget(self, action: #selector(buttonCloseTapped), for: .touchUpInside)
        button.contentMode = .scaleAspectFill
        button.tintColor = AppColor.white
        return button
    }()

    // MARK: - Properties
    var theme: ResumeVCTheme {
        return ResumeVCTheme()
    }
    
    var headerBottomAnchor: NSLayoutYAxisAnchor {
        return viewNavigation.bottomAnchor
    }
   
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        hideKeyboardWhenTappedAround()
        if !theme.isCloseNavBar {
            configureHeader()
        }
        configureStyleView()
        configureUI()
        bindUI()
    }

    // MARK: - Private Functions
    private func bindUI() {
        viewModel.state = { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success:
                self.updateUI()
            case .failure(let popUpModel):
                self.showAlert(popUpModel: popUpModel)
            }
        }
    }
    
    private func configureStyleView(){
        self.view.backgroundColor = AppColor.white
        viewNavigation.backgroundColor = theme.navBarColor
        viewBorder.backgroundColor = theme.viewBorderColor
        labelTitle.textColor = theme.headerTitleColor
        buttonBack.tintColor = theme.backBtnColor
        buttonClose.tintColor = theme.closeBtnColor
        buttonBack.isHidden = theme.isBackBtnHidden
        buttonClose.isHidden = theme.isCloseBtnHidden
        labelTitle.text = theme.headerTitle
    }

    private func configureHeader() {
        
        let heightLayout = UIApplication.shared.windows.first{ $0.isKeyWindow }?.safeAreaInsets.top ?? 0
        let heightNavBar = UINavigationController.navBarHeight()

        view.addSubview(viewNavigation)
        viewNavigation.addSubview(viewContainer)
        viewNavigation.addSubview(viewBorder)
        viewContainer.addSubview(buttonBack)
        viewContainer.addSubview(buttonClose)
        viewContainer.addSubview(labelTitle)
        
        viewNavigation.snp.makeConstraints { (maker) in
            maker.top.leading.trailing.equalToSuperview()
            maker.height.equalTo(heightLayout + heightNavBar)
        }
        
        viewContainer.snp.makeConstraints { (maker) in
            maker.leading.equalTo(viewNavigation.safeAreaLayoutGuide).inset(spacingButtons)
            maker.trailing.equalTo(viewNavigation.safeAreaLayoutGuide).inset(spacingButtons)
            maker.bottom.equalToSuperview().inset(0.5)
            maker.height.equalTo(heightNavBar)
        }
        
        buttonBack.snp.makeConstraints { (maker) in
            maker.leading.equalTo(viewContainer.snp.leading).inset(spacingButtons)
            maker.width.height.equalTo(24)
            maker.centerY.equalTo(viewContainer.snp.centerY)
        }
        
        buttonClose.snp.makeConstraints { (maker) in
            maker.trailing.equalTo(viewContainer.snp.trailing).inset(spacingButtons)
            maker.width.height.equalTo(24)
            maker.centerY.equalTo(viewContainer.snp.centerY)
        }
        
        labelTitle.snp.makeConstraints { (maker) in
            maker.centerX.equalTo(viewContainer.snp.centerX)
            maker.centerY.equalTo(viewContainer.snp.centerY)
        }
        
        viewBorder.snp.makeConstraints { (maker) in
            maker.leading.trailing.bottom.equalToSuperview()
            maker.height.equalTo(0.5)
        }
    }

    // MARK: - Actions
    @objc func buttonCloseTapped() {
        NavigationManager.shared.dismissTopController()
    }

    @objc func buttonBackTapped() {
        NavigationManager.shared.popViewController()
    }
    
    //MARK: - Override Functions
    func configureUI() { }
    func updateUI() { }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showAlert(popUpModel: PopUpModel?){
        if let popUpMdl = popUpModel{
            AlertHelper.shared.showGeneralAlert(popUpModel: popUpMdl)
        }else{
            AlertHelper.shared.showGeneralAlert()
        }
    }
}

extension ResumeBaseVC {
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
}
