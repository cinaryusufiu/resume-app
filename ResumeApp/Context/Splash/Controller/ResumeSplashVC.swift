//
//  ResumeSplashVC.swift
//  ResumeSplashVC
//
//  Created by Yusuf Çınar on 29.04.2022.
//

import UIKit

final class ResumeSplashVC: ResumeBaseVC<ResumeSplashPage, ResumeBaseVM> {

    weak var coordinator: AppCoordinator?
    
    override func loadView() {
        viewPage = ResumeSplashPage()
        viewModel = ResumeBaseVM()
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = AppColor.white
       
        prepareUIView()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.viewPage.stopAnimation()
            self.coordinator?.goToMain()
        }
    }
    
    private func prepareUIView(){
        view.addSubview(viewPage)
        viewPage.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
    }
}
