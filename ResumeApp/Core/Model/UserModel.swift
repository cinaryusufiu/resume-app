//
//  UserModel.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 30.04.2022.
//

import Foundation

struct UserModel: Codable {
   
    struct AddressModel: Codable {
        let id: String?
        let name: String?
        let addrDesc: String?
    }
    
    struct CareerTargetModel: Codable {
        let id: String?
        let desc: String?
    }
    
    var name: String?
    var lastName: String?
    var phoneNumber: String?
    var email: String?
    var resumeList: [ResumeModel]?
    
    var address: AddressModel?
    var projectList: [ProjectModel]?
}
