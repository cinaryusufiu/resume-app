//
//  ProjectDetail.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 2.05.2022.
//

import Foundation

struct ProjectModel: Codable {
        
    let id: String
    var name: String?
    var size: String?
    var projectDesc: String?
    var useTech: String?
    var role: String?
}
