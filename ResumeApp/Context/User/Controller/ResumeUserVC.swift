//
//  UserVC.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 1.05.2022.
//

import UIKit
import CropViewController

final class ResumeUserVC: ResumeBaseVC<ResumeUserPage , ResumeUserVM > {
    
    weak var coordinator: ResumeFlowCoordinator?
    
    override var theme: ResumeVCTheme {
        var theme = ResumeVCTheme()
        theme.isCloseNavBar = false
        theme.isCloseBtnHidden = false
        theme.closeBtnColor = AppColor.white
        theme.backBtnColor = AppColor.white
        theme.navBarColor = AppColor.dusk
        theme.headerTitle = viewModel.constant.screenName
        return theme
    }
    
    override func loadView() {
        if let viewModel = self.vModel {
            self.viewModel = (viewModel as! ResumeUserVM)
        }else {
            self.viewModel = ResumeUserVM(model: nil)
        }
        viewPage = ResumeUserPage()
        viewPage.viewModel = viewModel
        viewPage.delegate = self
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUIView()
    }
    
    private func prepareUIView(){
        view.addSubview(viewPage)
        viewPage.snp.makeConstraints { (maker) in
            maker.bottom.leading.trailing.equalToSuperview()
        }
        viewPage.topAnchor.constraint(equalTo: headerBottomAnchor).isActive = true
    }
    
    func presentCropViewController(image : UIImage) {
        let cropViewController = CropViewController(croppingStyle: .circular, image: image)
        cropViewController.modalPresentationStyle = .fullScreen
        cropViewController.delegate = self
        present(cropViewController, animated: true, completion: nil)
    }
}

extension ResumeUserVC: ResumeUserPageDelegate {
    
    func openImagePickerController() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = false
        AppHUD.shared.show()
        self.present(imagePickerController, animated: true) {
            AppHUD.shared.hide()
        }
    }
}

extension ResumeUserVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate, CropViewControllerDelegate {
    
    //MARK:- UIImageViewControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if  let editingImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            print(editingImage)
        }
        else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            dismiss(animated: true, completion: nil)
            presentCropViewController(image: originalImage)
        }
    }
    
    //MARK:- CropViewControllerDelegate
    func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
        self.viewPage.setProfilePhoto(image: image)
      
        dismiss(animated: true, completion: nil)
    }
}
