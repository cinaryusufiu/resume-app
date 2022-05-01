//
//  AlertVC.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 1.05.2022.
//

import UIKit

@objc protocol AlertVCDelegate: NSObjectProtocol {
    
    @objc optional func closeButtonTapped()
    @objc optional func doneButtonTapped()
    
    @objc optional func alertHelperVCWillAppear( _ alertHelperVC :AlertVC)
    @objc optional func alertHelperVCDidAppear( _ alertHelperVC :AlertVC)
    @objc optional func alertHelperVCWillDisappear( _ alertHelperVC :AlertVC)
    @objc optional func alertHelperVCDidDisappear( _ alertHelperVC :AlertVC)
}

final class AlertVC: UIViewController {
    
    private var alertVM: AlertVM
    
    weak var delegate: AlertVCDelegate?
    
    lazy var pageAlert: AlertPage = {
        let view = AlertPage(alertVM: alertVM)
        view.delegate = self
        return view
    }()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    init(alertVM : AlertVM) {
        self.alertVM = alertVM
        super.init(nibName: nil, bundle: nil)
        configureInit()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        delegate?.alertHelperVCWillAppear?(self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        delegate?.alertHelperVCDidAppear?(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.alertHelperVCWillDisappear?(self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        delegate?.alertHelperVCDidDisappear?(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - SetupFunctions
    private func configureInit() {
        self.transitioningDelegate = self
        self.modalPresentationStyle = .custom
        self.providesPresentationContextTransitionStyle = true
        self.definesPresentationContext = true
        self.view.isOpaque = true
        self.view.backgroundColor = .clear
    }
    
    private func configureUI() {
        view.addSubview(pageAlert)
        pageAlert.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
    }
}

extension AlertVC: UIViewControllerTransitioningDelegate {
    
    //MARK: - UIViewControllerTransitioningDelegate
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AlertHelperVCAnimation(isPresenting : true)
    }
    
    func animationController(forDismissed dismissed: UIViewController)
    -> UIViewControllerAnimatedTransitioning? {
        return AlertHelperVCAnimation(isPresenting : false)
    }
}

extension AlertVC: AlertPageDelegate {
    
    //MARK: - AlertViewDelegate
    func dismissButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func doneButtonTapped() {
        self.dismiss(animated: true, completion: nil)
        if self.alertVM.doneButtonAction == nil {
            
        }
    }
    
    func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
        if self.alertVM.closeButtonAction == nil {
           
        }
    }
}
