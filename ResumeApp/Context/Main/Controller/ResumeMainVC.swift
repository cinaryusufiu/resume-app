//
//  ResumeMainVC.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 29.04.2022.
//

import UIKit

final class ResumeMainVC: ResumeBaseVC<ResumeMainPage , ResumeMainVM > {
    
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
            self.viewModel = (viewModel as! ResumeMainVM)
        }else {
            self.viewModel = ResumeMainVM(models: [ResumeModel()])
        }
        viewPage = ResumeMainPage()
        viewPage.viewModel = viewModel
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUIView()
        self.viewModel.fetchData()
        
        viewPage.didTappedCreateResume = { [weak self ] in
            self?.coordinator?.startCreateResume()
        }
        
        viewPage.didTappedCell = { [weak self ] (index) in
            self?.coordinator?.startEditResume()
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
