//
//  ResumeAddressVM.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 2.05.2022.
//

import Foundation

final class ResumeAddressVM: ResumeBaseVM {
    
    private var model: UserModel?
    
    var checkAddress: Bool = UserDefaults.standard.getUserModel()?.address != nil ? true : false
    
    override init() {
        super.init()
        self.model = UserDefaults.standard.getUserModel()
    }
    
    override var constant: ResumeBaseVMConstant {
        if checkAddress {
            return ResumeBaseVMConstant(screenName: "Edit Adress Page" , analyticsName: "editAddress")
        }
        return ResumeBaseVMConstant(screenName: "Create Address Page" , analyticsName: "createAddress")
    }
    
    var name: String? {
        return model?.address?.name
    }
    
    var desc: String? {
        return model?.address?.addrDesc
    }
    
    func saveUserModel(newAddressModel: UserModel.AddressModel) {
        self.model?.address = newAddressModel
        guard let model = self.model else {
            return
        }
        UserDefaults.standard.saveUserModel(userModel: model)
    }
}
