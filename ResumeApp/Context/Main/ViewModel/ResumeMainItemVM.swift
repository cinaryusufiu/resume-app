//
//  ResumeMainItemVM.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 30.04.2022.
//

import Foundation

class ResumeMainItemVM: ResumeBaseVM {
    
    private var model: ResumeModel
    
    init(model: ResumeModel) {
        self.model = model
    }
    
    var name: String? {
        return   UserDefaults.standard.getUserModel()?.name
    }
    
    var resumeTitle: String? {
        return model.title ?? String()
    }
    
    var resumeDesc: String? {
        return model.desc ?? ""
    }

    var email: String? {
        return UserDefaults.standard.getUserModel()?.email
    }
}
