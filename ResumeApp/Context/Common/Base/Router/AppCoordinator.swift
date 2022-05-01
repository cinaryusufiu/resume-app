//
//  AppCoordinator.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 29.04.2022.
//

import UIKit

protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set}
    func start()
}

class AppCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    var controllerSplash: ResumeSplashVC = ResumeSplashVC()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.modalPresentationStyle = .fullScreen
    }
    
    func start() {
       controllerSplash.coordinator = self
       navigationController.pushViewController(controllerSplash, animated: true)
    }
  
    func goToMain(){
        let resumeMainCoordinator = ResumeMainPageCoordinator.init(navigationController: navigationController)
        resumeMainCoordinator.parentCoordinator = self
        childCoordinators.append(resumeMainCoordinator)
        resumeMainCoordinator.start()
    }
}
