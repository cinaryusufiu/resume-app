//
//  AlertHelperVCAnimation.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 1.05.2022.
//

import UIKit

final class AlertHelperVCAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    private let isPresenting: Bool
    
    init(isPresenting: Bool) {
        self.isPresenting = isPresenting
    }
    
    func transitionDuration(
        using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        if isPresenting {
            return 0.3
        } else {
            return 0.2
        }
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if  isPresenting {
            self.presentAnimateTransition(transitionContext)
        } else {
            self.dismissAnimateTransition(transitionContext)
        }
    }
    
    func presentAnimateTransition(_ transitionContext: UIViewControllerContextTransitioning) {
        let alertVC: AlertVC! =
            transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
                as? AlertVC
        if let alertVC = alertVC {
             let containerView = transitionContext.containerView
             alertVC.pageAlert.alpha = 0.0
             alertVC.pageAlert.center = alertVC.view.center
            alertVC.pageAlert.contentAlertView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
             containerView.addSubview(alertVC.view)
             UIView.animate(withDuration: self.transitionDuration(using: transitionContext), delay: 0, usingSpringWithDamping: 0.6,
             initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
             alertVC.pageAlert.alpha = 1.0
                alertVC.pageAlert.contentAlertView.transform =
             CGAffineTransform.identity
             },
             completion: { finished in
                guard finished else { return }
                transitionContext.completeTransition(true)
             })
        }
    }
    
    func dismissAnimateTransition(_ transitionContext: UIViewControllerContextTransitioning) {
        let alertHelperVC = transitionContext.viewController(
            forKey: UITransitionContextViewControllerKey.from) as? AlertVC
        guard let alertController = alertHelperVC else {
            return
        }
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), delay: 0, usingSpringWithDamping: 0.5,
         initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            alertController.pageAlert.contentAlertView.transform =
         CGAffineTransform(scaleX: 0, y: 0)
            alertController.pageAlert.backgroundColor = .clear
            alertController.pageAlert.contentAlertView.alpha = 0.0
         },
         completion: { finished in
          guard finished else { return }
          transitionContext.completeTransition(true)
         })
    }
}
