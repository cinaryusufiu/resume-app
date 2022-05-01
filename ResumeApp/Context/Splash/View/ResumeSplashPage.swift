//
//  ResumeSplashPage.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 29.04.2022.
//

import Lottie

final class ResumeSplashPage: ResumePageView {
    
    //MARK: - UI Properties
    private let animationView: AnimationView = {
        let view = AnimationView()
        view.animation = Animation.named("Splash-Animation")
        view.contentMode = .scaleAspectFill
        view.loopMode = .loop
        view.play()
        return view
    }()
  
    //MARK: - Override Functions
    override func configureUI(){
        super.configureUI()
        prepareSubview()
        prepareUIAnchor()
    }
    
    private func prepareSubview(){
        self.addSubview(animationView)
    }
    
    private func prepareUIAnchor(){
        animationView.snp.makeConstraints { (maker) in
            maker.centerX.centerY.equalToSuperview()
            maker.width.height.equalTo(120)
        }
    }
    
    func stopAnimation(){
        animationView.stop()
    }
}
