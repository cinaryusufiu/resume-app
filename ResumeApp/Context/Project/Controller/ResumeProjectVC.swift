//
//  ResumeProjectVC.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 2.05.2022.
//

import UIKit

final class ResumeProjectVC: ResumeBaseVC<ResumeProjectPage , ResumeProjectVM > {
    
    weak var coordinator: ResumeMainPageCoordinator?
    
    override var theme: ResumeVCTheme {
        var theme = ResumeVCTheme()
        theme.isCloseNavBar = false
        theme.backBtnColor = AppColor.white
        theme.navBarColor = AppColor.dusk
        theme.headerTitle = viewModel.constant.screenName
        return theme
    }
    
    override func loadView() {
        if let viewModel = self.vModel {
            self.viewModel = (viewModel as! ResumeProjectVM)
        }else {
            self.viewModel = ResumeProjectVM(model: nil)
        }
        viewPage = ResumeProjectPage()
        viewPage.viewModel = viewModel
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUIView()
    
    }
    
    private func prepareUIView(){
        view.addSubview(viewPage)
        viewPage.snp.makeConstraints { (maker) in
            maker.bottom.leading.trailing.equalToSuperview()
        }
        viewPage.topAnchor.constraint(equalTo: headerBottomAnchor).isActive = true
    }
}
