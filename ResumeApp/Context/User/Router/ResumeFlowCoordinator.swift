//
//  ResumeCoordinator.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 1.05.2022.
//

import Foundation

import UIKit

final class ResumeFlowCoordinator: Coordinator {
    
    weak var parentCoordinator: Coordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.modalPresentationStyle = .fullScreen
    }
    
    func start() {
        guard UserDefaults.standard.getUserModel() == nil else {
            startFromResumeHomePage()
            return  }
        startFromUserPage()
    }
    
    func startFromResumeHomePage(){
        let resumeHomeVC = ResumeHomeVC()
        resumeHomeVC.coordinator = self
        navigationController.pushViewController(resumeHomeVC, animated: true)
        parentCoordinator?.navigationController.present(navigationController, animated: true, completion: nil)
    }
    
    func startFromUserPage(){
        let resumeUserVC = ResumeUserVC()
        resumeUserVC.coordinator = self
        navigationController.pushViewController(resumeUserVC, animated: true)
        parentCoordinator?.navigationController.present(navigationController, animated: true, completion: nil)
    }
    
    func startAddressPage(){
        let resumeAddressVC = ResumeAddressVC()
        navigationController.pushViewController(resumeAddressVC, animated: true)
    }
    
    func goToResumeHome(){
        let resumeUserVC = ResumeUserVC()
        resumeUserVC.coordinator = self
        navigationController.pushViewController(resumeUserVC, animated: true)
    }
}
