//
//  ResumeBaseVM.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 29.04.2022.
//

import Foundation

import Foundation

struct ResumeBaseVMConstant {
    var screenName: String = "ResumeBaseVMConstant"
    var analyticsName: String = "ResumeBaseVMConstant"
}

typealias ClosureState = ((_ state : StateType)->())

enum StateType: Equatable {
    
    case success
    case failure(PopUpModel?)
    
    static func == (lhs: StateType, rhs: StateType) -> Bool {
        switch (lhs, rhs) {
        case (.failure, .failure):
            return true
        case (.success, .success):
            return true
        default:
            return false
        }
    }
}

class ResumeBaseVM: NSObject {
    
    var state: ClosureState?
    
    var constant: ResumeBaseVMConstant {
        return ResumeBaseVMConstant()
    }
    
    override init() {
        super.init()
        configureInit()
    }
    
    private func configureInit() {
        
    }
}
