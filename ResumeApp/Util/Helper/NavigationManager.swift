//
//  NavigationManager.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 29.04.2022.
//

import UIKit

typealias CompletionBlock = () -> Void

final class NavigationManager {

    static let shared = NavigationManager()

    func topViewController() -> UIViewController? {
        guard let rootController = (UIApplication.shared.windows.first?.rootViewController) else { return nil }
        return topViewController(rootController)
    }

    private func topViewController(_ rootViewController: UIViewController) -> UIViewController {
        if rootViewController is UITabBarController {
            let tabBarController = (rootViewController as? UITabBarController)!
            return self.topViewController(tabBarController.selectedViewController!)
        } else if rootViewController is UINavigationController {
            let navigationController = (rootViewController as? UINavigationController)!
            if let viewController = navigationController.visibleViewController {
                return self.topViewController(viewController)
            } else {
                return rootViewController
            }
        } else if rootViewController is UIPageViewController {
            let pageViewController = (rootViewController as? UIPageViewController)!
            return self.topViewController((pageViewController.viewControllers?.last!)!)
        } else if rootViewController.presentedViewController != nil {
            return self.topViewController(rootViewController.presentedViewController!)
        } else {
            return rootViewController
        }
    }

    func popToMain(completion: (() -> Void)? = nil) {
        if let topVC = topViewController() {
            closeTopVC(topVC, completion: completion)
        } else {
            completion?()
        }
    }

    func dismissTopController () {
        let topVC = NavigationManager.shared.topViewController()
        topVC?.dismiss(animated: true, completion: nil)
    }

    func popViewController () {
        let topVC = NavigationManager.shared.topViewController()
        topVC?.navigationController?.popViewController(animated: true)
    }
    
    func popToRootNavigationVC() {
        let topVC = NavigationManager.shared.topViewController()
        topVC?.navigationController?.popToRootViewController(animated: true)
    }

    private func closeTopVC(_ viewController: UIViewController, completion: (() -> Void)? = nil) {
        if viewController.presentingViewController != nil {
            viewController.dismiss(animated: true) {
                if let topVC = self.topViewController() {
                    self.closeTopVC(topVC, completion: completion)
                }
            }
            return
        } else if viewController.navigationController != nil && viewController.navigationController?.viewControllers.count ?? 0 > 1 {
            CATransaction.begin()
            CATransaction.setCompletionBlock {
                if let topVC = self.topViewController() {
                    self.closeTopVC(topVC, completion: completion)
                }
            }
            viewController.navigationController?.popToRootViewController(animated: true)
            CATransaction.commit()
            return
        }
        completion?()
    }
}

