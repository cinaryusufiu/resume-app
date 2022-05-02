//
//  ResumeMainVM.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 30.04.2022.
//

import Foundation

final class ResumeMainVM: ResumeBaseVM {
    
    // MARK: - Private Properties
    private(set) var models: [ResumeModel] = [ResumeModel]()
    
    var checkUser: Bool {
        return UserDefaults.standard.getUserModel() != nil ? false : true
    }
    
    override var constant: ResumeBaseVMConstant {
        return ResumeBaseVMConstant(screenName: "ResumeList Page" , analyticsName: "main")
    }

    override init() {
        super.init()
        self.models = UserDefaults.standard.getUserModel()?.resumeList ?? []
    }
    
    func itemVM(index: Int) -> ResumeMainItemVM? {
        if models.indices.contains(index)  {
            return ResumeMainItemVM(model: models[index])
        }
        return nil
    }
    
    func numberOfItems() -> Int {
        return models.count
    }
    
    func fetchData() {
        AppHUD.shared.show()
        delay(1) {
            AppHUD.shared.hide()
            self.state?(.success)
        }
    }
}
