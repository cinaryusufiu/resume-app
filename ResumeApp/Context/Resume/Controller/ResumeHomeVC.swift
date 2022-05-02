//
//  Resume.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 1.05.2022.
//

import UIKit

final class ResumeHomeVC: ResumeBaseVC<ResumeHomePage , ResumeHomeVM > {
    
    weak var coordinator: ResumeFlowCoordinator?
    
    override var theme: ResumeVCTheme {
        var theme = ResumeVCTheme()
        theme.isCloseNavBar = false
        theme.backBtnColor = AppColor.white
        theme.navBarColor = AppColor.dusk
        theme.isCloseBtnHidden = false
        theme.headerTitle = viewModel.constant.screenName
        return theme
    }
    
    override func loadView() {
        if let viewModel = self.vModel {
            self.viewModel = (viewModel as! ResumeHomeVM)
        }else {
            self.viewModel = ResumeHomeVM()
        }
        viewPage = ResumeHomePage()
        viewPage.viewModel = viewModel
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUIView()
        self.view.backgroundColor = AppColor.blueyGrey
        
        viewPage.didTappedEditAddressButton = {[weak self] in
            let resumeAddressVC = ResumeAddressVC()
            self?.navigationController?.pushViewController(resumeAddressVC, animated: true)
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
