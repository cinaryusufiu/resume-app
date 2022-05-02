//
//  ResumeMainPage.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 30.04.2022.
//

import UIKit

final class ResumeMainPage: ResumePageView {
    
    var viewModel: ResumeMainVM? {
        didSet {
            updateUI()
        }
    }
    
    var didTappedCell: ((_ index: Int) -> ())?
    var didTappedCreateResume: CompletionBlock?
    
    private struct Constant {
        static let spacing: CGFloat = 12
    }
  
    //MARK: - UI Properties
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.backgroundColor = .clear
        cv.delegate = self
        cv.dataSource = self
        cv.showsVerticalScrollIndicator = false
        cv.contentInset = UIEdgeInsets(top: 20, left: 4, bottom: 80, right: 4)
        return cv
    }()
    
    private lazy var buttonCreateResume: ResumeButton = {
        let button = ResumeButton(style: .light)
        button.iconName = "plus"
        button.tintColor = AppColor.white
        button.bGColor = AppColor.dusk
        button.addTarget(self, action: #selector(onTappedCreateResumeButton), for: .touchUpInside)
        return button
    }()
    
    override func configureUI() {
        super.configureUI()
        
        addSubview(collectionView)
        addSubview(buttonCreateResume)
        collectionView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        
        buttonCreateResume.snp.makeConstraints { maker in
            maker.trailing.bottom.equalToSuperview().inset(Constant.spacing)
            maker.width.height.equalTo(80)
        }
        
        collectionView.registerCell(cellType: ResumeMainPageCell.self)
    }
    
    override func updateUI() {
        super.updateUI()
        collectionView.reloadData()
    }
    
    @objc func onTappedCreateResumeButton() {
        self.didTappedCreateResume?()
    }
}

extension ResumeMainPage: UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: ResumeMainPageCell.self)
        cell.backgroundColor =  indexPath.row % 2 == 0 ? AppColor.silver : AppColor.coral
        cell.viewModel = viewModel?.itemVM(index: indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfItems() ?? 0
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.didTappedCell?(indexPath.row)
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width - Constant.spacing , height: 140)
    }
}
