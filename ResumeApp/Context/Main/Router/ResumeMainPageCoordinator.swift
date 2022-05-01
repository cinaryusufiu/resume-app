//
//  ResumeMainCoordinator.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 30.04.2022.
//

import UIKit

final class ResumeMainPageCoordinator: Coordinator {
    
    weak var parentCoordinator: Coordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let resumeMainVC = ResumeMainVC()
        resumeMainVC.coordinator = self
        parentCoordinator?.navigationController.pushViewController(resumeMainVC, animated: false)
    }
    
    func startCreateResume(){
        let navController = UINavigationController()
        let resumeFlowcoordinator = ResumeFlowCoordinator(navigationController: navController)
        resumeFlowcoordinator.parentCoordinator = self
        resumeFlowcoordinator.start()
    }
    
    func startEditResume(){
        let navigationController = UINavigationController(rootViewController: ResumeHomeVC())
        let resumeMainCoordinator = ResumeFlowCoordinator.init(navigationController: navigationController)
        resumeMainCoordinator.parentCoordinator = self
        childCoordinators.append(resumeMainCoordinator)
        resumeMainCoordinator.start()
    }
}
