//
//  ResumeHomePage.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 1.05.2022.
//

import UIKit

final class ResumeHomePage: ResumePageView {

    private let viewUserInfo: UserInfoContainerView = UserInfoContainerView()
    private let viewAddressInfo: AdresInfoContainerView = AdresInfoContainerView()
    
    var viewModel: ResumeHomeVM?{
        didSet {
            updateUI()
        }
    }
    
    var didTappedEditAddressButton: CompletionBlock?
    
    override func configureUI() {
        super.configureUI()
        configureScrollView()
        prepareSubview()
        
        viewAddressInfo.didTappedEditButton = { [weak self] in
            self?.didTappedEditAddressButton?()
        }
    }
    
    @objc private func handleRefreshControl(){
         delay(1) {
             self.scrollView.refreshControl?.endRefreshing()
         }
     }
    
    //MARK: - Private Functions
    private func prepareSubview(){
        
        stackView.layoutMargins = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        scrollView.refreshControl = UIRefreshControl()
        scrollView.refreshControl?.addTarget(self, action:
                                           #selector(handleRefreshControl),
                                           for: .valueChanged)
    }
    
    override func updateUI() {
        super.updateUI()
        stackView.arrangedSubviews.forEach({$0.removeFromSuperview()})
        
        if let viewModel = viewModel?.getUserInfoVM() {
            viewUserInfo.viewModel = viewModel
            viewAddressInfo.viewModel = viewModel
            stackView.addArrangedSubview(viewUserInfo)
            stackView.addArrangedSubview(viewAddressInfo)
        }
    }
}
