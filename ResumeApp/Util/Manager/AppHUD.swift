//
//  AppHUD.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 29.04.2022.
//

import UIKit
import Lottie

final class AppHUD {
    
    static let shared = AppHUD()
    private let activityView: CustomActivityView = CustomActivityView(frame: .zero)
    
    private init(){ }
    
    func show(){
        DispatchQueue.main.async {
            let windowsFirst = UIApplication.shared.windows.first { $0.isKeyWindow }
            guard let window = windowsFirst else { return }
            self.activityView.frame = window.frame
            window.addSubview(self.activityView)
        }
    }
    
    func hide(){
        UIView.animate(withDuration: 0.4, delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0.8,
                       options: .curveLinear, animations: {
                        self.activityView.removeFromSuperview()
                       })
    }
}

final class CustomActivityView: ResumePageView {
    
    private let animationView: AnimationView = {
        let view = AnimationView()
        view.animation = Animation.named("Splash-Animation")
        view.contentMode = .scaleAspectFill
        view.loopMode = .loop
        view.play()
        return view
    }()
    
    private let blankView : UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(white: 0, alpha: 0.1)
        return view
    }()
    
    func hide() {
        UIView.animate(withDuration: 0.7,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0.8,
                       options: .curveEaseInOut,
                       animations: {
                        self.animationView.alpha = 0
                        self.blankView.alpha = 0
                       }, completion: { _ in
                        self.animationView.stop()
                       })
    }
    
    func show() {
        self.animationView.play()
        UIView.animate(withDuration: 0.1,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0.8,
                       options: .curveEaseInOut,
                       animations: {
                        self.animationView.alpha = 1
                        self.blankView.alpha = 0.1
                       }, completion: nil)
    }
    
    override func configureUI() {
        super.configureUI()
        
        self.addSubview(blankView)
        self.addSubview(animationView)
        
        blankView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
        
        animationView.snp.makeConstraints { (maker) in
            maker.centerX.centerY.equalTo(blankView)
            maker.height.equalTo(80)
            maker.width.equalTo(80)
        }
    }
}
