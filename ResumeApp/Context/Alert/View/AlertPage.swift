//
//  AlertPage.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 1.05.2022.
//

import UIKit

protocol AlertPageDelegate: NSObjectProtocol {
    func closeButtonTapped()
    func doneButtonTapped()
}

enum PopUpType: String, Codable {
    case success
    case error
    case info
    case warning
    case none
}

struct PopUpModel: Decodable {
    
    var title: String?
    var message: String?
    var type: PopUpType?
}

final class AlertPage: UIView {
    
    private var alertVM: AlertVM
    weak var delegate: AlertPageDelegate?
    
    let contentAlertView : UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = AppColor.white
        return view
    }()
    
    private let textViewDescription: UITextView = {
        let textView = UITextView(frame: .zero)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 5
        let attributes = [NSAttributedString.Key.paragraphStyle : style]
        textView.typingAttributes = attributes
        textView.font = .semiBold(20)
        textView.textColor = AppColor.dusk
        textView.isEditable = false
        textView.isScrollEnabled = true
        textView.isSelectable = false
        textView.textAlignment = .center
        textView.backgroundColor = .clear
        return textView
    }()
    
    private lazy var buttonDone: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(AppColor.greenyBlue, for: .normal)
        button.titleLabel?.font = .semiBold(20)
        button.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonClose : UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(AppColor.blueyGrey, for: .normal)
        button.titleLabel?.font = .semiBold(20)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let viewBottomUpBorder: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.silver
        return view
    }()
    
    private let viewBottomCenterBorder: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.silver
        return view
    }()
    
    private let stackViewButton : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    
    init(alertVM : AlertVM){
        self.alertVM = alertVM
        super.init(frame: UIScreen.main.bounds)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Action List
    @objc func closeButtonTapped() {
        if let action = alertVM.closeButtonAction {
            action()
        }
        delegate?.closeButtonTapped()
    }
    
    @objc func doneButtonTapped() {
        if let action = alertVM.doneButtonAction {
            action()
        }
        delegate?.doneButtonTapped()
    }
    
    func configureUI() {
        configureAlertHelperView()
        addSubview(contentAlertView)
        contentAlertView.addSubview(textViewDescription)
        contentAlertView.addSubview(stackViewButton)
        contentAlertView.addSubview(viewBottomUpBorder)
        contentAlertView.addSubview(viewBottomCenterBorder)
        
        let alertType = self.alertVM.popUpType
        var heightInfoText: CGFloat = textViewDescription.attributedText?.height(containerWidth: 350 - 50) ?? 0
        let maxHeightField: CGFloat = 120
        let width: CGFloat = UIView.width - (UIView.width * 0.2)
        
        if UIDevice.IS_IPHONE_5 || UIDevice.IS_IPHONE_4 {
            heightInfoText = textViewDescription.attributedText?.height(containerWidth: 350 - 50) ?? 0
        }
        
        if heightInfoText > maxHeightField {
            heightInfoText = maxHeightField
        }
        
        if textViewDescription.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            heightInfoText = -34
        }
        
        contentAlertView.snp.makeConstraints { (maker) in
            maker.centerX.centerY.equalToSuperview()
            maker.width.equalTo(width)
        }
        
        textViewDescription.snp.makeConstraints { (maker) in
            maker.top.equalTo(contentAlertView.snp.top).offset(40)
            maker.leading.trailing.equalToSuperview().inset(25)
            maker.height.equalTo(heightInfoText + 35)
        }
        
        stackViewButton.snp.makeConstraints { (maker) in
            maker.top.equalTo(textViewDescription.snp.bottom).offset(30)
            maker.bottom.equalToSuperview()
            maker.height.equalTo(60)
            maker.leading.trailing.equalToSuperview()
        }
        
        viewBottomUpBorder.snp.makeConstraints { (maker) in
            maker.bottom.equalTo(stackViewButton.snp.top).offset(1)
            maker.height.equalTo(1)
            maker.leading.trailing.equalToSuperview()
        }
        
        viewBottomCenterBorder.snp.makeConstraints { (maker) in
            maker.top.equalTo(viewBottomUpBorder.snp.bottom)
            maker.width.equalTo(1)
            maker.centerX.bottom.equalToSuperview()
        }
        
        switch alertType {
        case .success, .info, .warning:
            stackViewButton.addArrangedSubview(buttonClose)
            if alertVM.doneButtonAction != nil {
                stackViewButton.addArrangedSubview(buttonDone)
                viewBottomCenterBorder.isHidden = false
            }
        case .error:
            stackViewButton.addArrangedSubview(buttonClose)
            viewBottomCenterBorder.isHidden = true
        case .none:
            print("none")
        }
    }
    
    func setupStyleView() {
        self.backgroundColor = AppColor.dusk.withAlphaComponent(0.3)
        contentAlertView.roundCorners(corners: .allCorners, radius: 30)
        contentAlertView.layer.drawShadow(color: AppColor.blueyGrey, alpha: 0.8, x: 0, y: 4, blur: 14, spread: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupStyleView()
    }
    
    func configureAlertHelperView() {
        textViewDescription.text = alertVM.descriptionText
        buttonDone.setTitle(alertVM.doneButtonTitle, for: .normal)
        buttonClose.setTitle(alertVM.closeButtonTitle, for: .normal)
    }
}


extension NSAttributedString {
    
    func height(containerWidth: CGFloat) -> CGFloat {
        let rect = self.boundingRect(with: CGSize.init(width: containerWidth, height: CGFloat.greatestFiniteMagnitude), options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
        return ceil(rect.size.height)
    }
    
    func width(containerHeight: CGFloat) -> CGFloat {
        let rect = self.boundingRect(with: CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: containerHeight), options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
        return ceil(rect.size.width)
    }
}


import UIKit

extension CALayer {
    
    func drawShadow( color: UIColor = .black, alpha: Float = 0.5, x: CGFloat = 0,  y: CGFloat = 2,blur:CGFloat = 4, spread: CGFloat = 0){
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
            return
        }
        let dx = -spread
        let rect = bounds.insetBy(dx: dx, dy: dx)
        shadowPath = UIBezierPath(rect: rect).cgPath
    }
}



import UIKit

extension UIDevice {
    
    // MARK: Device detection
    static let IS_IPAD = UIDevice.current.userInterfaceIdiom == .pad
    static let IS_IPHONE = UIDevice.current.userInterfaceIdiom == .phone
    static let IS_RETINA = UIScreen.main.scale >= 2.0

    static let SCREEN_WIDTH: CGFloat = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT: CGFloat = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH = Int( max(SCREEN_WIDTH, SCREEN_HEIGHT) )
    static let SCREEN_MIN_LENGTH = Int( min(SCREEN_WIDTH, SCREEN_HEIGHT) )

    static let IS_IPHONE_4 = IS_IPHONE && SCREEN_MAX_LENGTH <= 480 // 2, 3, 3GS, 4, 4S
    static let IS_IPHONE_5 = IS_IPHONE && SCREEN_MAX_LENGTH == 568 // 5, 5S, 5C, SE
    static let IS_IPHONE_6 = IS_IPHONE && SCREEN_MAX_LENGTH == 667 // 6, 6S, 7, 8
    static let IS_IPHONE_6P = IS_IPHONE && SCREEN_MAX_LENGTH == 736 // 6+, 6S+, 7+, 8+
    static let IS_IPHONE_XS = IS_IPHONE && SCREEN_MAX_LENGTH == 812 // X, XS, 11 Pro
    static let IS_IPHONE_XS_MAX = IS_IPHONE && SCREEN_MAX_LENGTH == 896 // XR, XS Max, 11, 11 Pro Max
}
