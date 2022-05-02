//
//  AppDelegate.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 29.04.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        
        let resume1 =  ResumeModel(id: "1", title: "My First Resume",
                                   desc: "2022 my resume",
                                   totalExperience: 12,
                                   workSummaryList: [
                                    ResumeModel.WorkSummaryModel(companyName: "Facebook", duration: 3),
                                    ResumeModel.WorkSummaryModel(companyName: "Apple", duration: 3),
                                    ResumeModel.WorkSummaryModel(companyName: "Twitter", duration: 3)])
        
        let resume2 =  ResumeModel(id: "2", title: "Second Resume", desc: "2021 my resume", totalExperience: 9,
                                   workSummaryList: [
                                    ResumeModel.WorkSummaryModel(companyName: "Turkcell", duration: 3),
                                    ResumeModel.WorkSummaryModel(companyName: "Huawei", duration: 3),
                                    ResumeModel.WorkSummaryModel(companyName: "Microsoft", duration: 3)])
         
        let address = UserModel.AddressModel(id: "1", name: "Home adress", addrDesc: "70 & 75 Harley St, London W1G 9QA, Turkey")
        let user = UserModel(name: "Yusuf",
                             lastName: "Çınar",
                             phoneNumber: "+905532905463",
                             email: "cinaryusufiu@gmail.com",
                             resumeList: [resume1 , resume2],
                             address: address)
        
        UserDefaults.standard.saveUserModel(userModel: user)
        configureRootVC()
        configureTools()
        return true
    }
}
