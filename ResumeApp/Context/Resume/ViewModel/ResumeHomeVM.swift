//
//  ResumeHomeVM.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 1.05.2022.
//

import Foundation

final class ResumeHomeVM: ResumeBaseVM {
    
    private var model: ResumeModel?
    
    override var constant: ResumeBaseVMConstant {
       
        return ResumeBaseVMConstant(screenName: "Resume Home Page" , analyticsName: "homeResume")
    }
    
    func getUserInfoVM() -> ResumeUserVM? {
        guard let userModel = UserDefaults.standard.getUserModel() else { return nil }
        return ResumeUserVM(model: userModel)
    }
}
