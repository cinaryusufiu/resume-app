//
//  AdressVC.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 1.05.2022.
//

import UIKit

final class ResumeAddressVC: ResumeBaseVC<ResumeAddressPage , ResumeAddressVM > {
    
 //   weak var coordinator: ResumeFlowCoordinator?
    
    override var theme: ResumeVCTheme {
        var theme = ResumeVCTheme()
        theme.isCloseNavBar = false
        theme.backBtnColor = AppColor.white
        theme.navBarColor = AppColor.dusk
        theme.isBackBtnHidden = false
        theme.headerTitle = viewModel.constant.screenName
        return theme
    }
    
    override func loadView() {
        self.viewModel = ResumeAddressVM()
        viewPage = ResumeAddressPage()
        viewPage.viewModel = viewModel
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUIView()
        
        viewPage.didTappedSaveButton = {[weak self] (model) in
            guard let self = self else { return }
            self.viewModel.saveUserModel(newAddressModel: model)
            if self.viewModel.checkAddress {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    private func prepareUIView(){
        view.addSubview(viewPage)
        viewPage.snp.makeConstraints { (maker) in
            maker.bottom.leading.trailing.equalToSuperview()
        }
        viewPage.topAnchor.constraint(equalTo: headerBottomAnchor).isActive = true
    }
}

