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
        self.view.backgroundColor = AppColor.darkBlueGrey
    }
    
    private func prepareUIView(){
        view.addSubview(viewPage)
        viewPage.snp.makeConstraints { (maker) in
            maker.bottom.leading.trailing.equalToSuperview()
        }
        viewPage.topAnchor.constraint(equalTo: headerBottomAnchor).isActive = true
    }
}

import UIKit

final class ResumeHomePage: ResumePageView {

    var viewModel: ResumeHomeVM?
     
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

    }
    
    private func prepareUIAnchor(){
        
      
    }
}


import Foundation

final class ResumeHomeVM: ResumeBaseVM {
    
    private var model: ResumeModel?
    
    override var constant: ResumeBaseVMConstant {
       
        return ResumeBaseVMConstant(screenName: "Create Resume Page" , analyticsName: "createResume")
    }
}
