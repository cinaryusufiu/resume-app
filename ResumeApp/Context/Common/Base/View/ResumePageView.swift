//
//  ResumePageView.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 29.04.2022.
//

import UIKit
import SnapKit

class ResumePageView: UIView {

    //MARK: - UI Properties
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()

    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.spacing = 20
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.layoutMargins = UIEdgeInsets(top: 20, left: 12, bottom: 20, right: 12)
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    init() {
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Override Functions
    func configureScrollView() {
        if subviews.contains(scrollView) {
            scrollView.removeFromSuperview()
        }
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        scrollView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { (maker) in
            maker.top.bottom.equalToSuperview()
            maker.leading.equalToSuperview()
            maker.trailing.equalToSuperview()
            maker.width.equalTo(scrollView.snp.width)
        }
        setupStackView()
    }
    
    func setupStackView() {
        stackView.arrangedSubviews.forEach({$0.removeFromSuperview()})
    }
    
    func configureUI() { }
    func updateUI() { }
}
