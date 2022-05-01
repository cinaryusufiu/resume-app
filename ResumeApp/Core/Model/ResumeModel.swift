//
//  ResumeModel.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 30.04.2022.
//

import Foundation

struct ResumeModel: Codable {
    
    struct WorkSummaryModel: Codable {
        var companyName: String?
        var duration: Float?
    }
   
    struct SkillModel: Codable {
        let companyName: String?
        let duration: Float?
    }
    
  //  let id: String
    var title: String?
    var desc: String?
    var userSummary: UserModel?
    var totalExperience: Float = 0
    var workSummaryList: [WorkSummaryModel]?
}
