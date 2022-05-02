//
//  ResumeUserVM.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 1.05.2022.
//

import Foundation

final class ResumeUserVM: ResumeBaseVM {
    
    private var model: UserModel?
    
    init(model: UserModel?) {
        self.model = model
    }
    
    var checkUser: Bool {
        return UserDefaults.standard.getUserModel() != nil ? true : false
    }
    
    override var constant: ResumeBaseVMConstant {
        if checkUser {
            return ResumeBaseVMConstant(screenName: "Edit User Info Page" , analyticsName: "editUser")
        }
        return ResumeBaseVMConstant(screenName: "Create User Page" , analyticsName: "createUser")
    }
}
