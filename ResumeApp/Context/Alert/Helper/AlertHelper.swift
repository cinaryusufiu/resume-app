//
//  AlertHelper.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 1.05.2022.
//

import UIKit

final class AlertHelper: NSObject {
    
    static let shared = AlertHelper()
    
    func showAlert(title:String,
                   description: String,
                   closeButtonTitle:String,
                   closeButtonAction: AlertVM.ButtonCompletionBlock? = nil) {
        showAlert(title: title,
                  description: description,
                  closeButtonTitle: closeButtonTitle,
                  closeButtonAction:closeButtonAction,
                  doneButtonTitle: nil,
                  doneButtonAction: nil)
    }
    
    func showAlert(title:String,
                   description: String,
                   closeButtonTitle:String,
                   closeButtonAction: AlertVM.ButtonCompletionBlock? = nil,
                   doneButtonTitle:String?,
                   doneButtonAction: AlertVM.ButtonCompletionBlock? = nil) {
        showAlert(type: .error,
                  title: title,
                  description: description,
                  closeButtonTitle: closeButtonTitle,
                  closeButtonAction: closeButtonAction,
                  doneButtonTitle: doneButtonTitle,
                  doneCompletionBlock: doneButtonAction)
    }
    
    func showAlert(type: PopUpType?,
                   title:String,
                   description: String,
                   closeButtonTitle:String,
                   closeButtonAction:AlertVM.ButtonCompletionBlock? = nil,
                   doneButtonTitle:String? = nil,
                   doneCompletionBlock:AlertVM.ButtonCompletionBlock? = nil) {
        
        let alertVM = createAlertVM(title: title,
                                    description: description,
                                    popUpType: type ?? .none,
                                    buttonCloseTitle: closeButtonTitle,
                                    buttonCloseUrl: nil,
                                    buttonCloseAction: closeButtonAction,
                                    buttonDoneTitle: doneButtonTitle,
                                    buttonDoneUrl: nil,
                                    buttonDoneAction: doneCompletionBlock)
        let alertVC = AlertVC(alertVM: alertVM)
        guard let topController = NavigationManager.shared.topViewController() else { return }
        if topController.isKind(of:AlertVC.self){
            return
        }
        topController.present(alertVC, animated: true, completion: nil)
    }
    
    func showGeneralAlert(){
        showAlert(title: "accountManager/error.common.title",
                  description: "accountManager/error.common.description",
                  closeButtonTitle: "accountManager/error.common.button.label")
    }
    
    func showGeneralAlert(popUpModel: PopUpModel){
        showAlert(title: popUpModel.title ?? "",
                  description: popUpModel.message ?? "",
                  closeButtonTitle: "Kapat")
    }
    
    private func createAlertVM(title: String = "",
                               description: String = "",
                               popUpType: PopUpType = .error,
                               buttonCloseTitle: String?,
                               buttonCloseUrl: String?,
                               buttonCloseAction: AlertVM.ButtonCompletionBlock? = nil,
                               buttonDoneTitle: String?,
                               buttonDoneUrl: String?,
                               buttonDoneAction: AlertVM.ButtonCompletionBlock? = nil) -> AlertVM {
        return AlertVM(descriptionText: description,
                       title: title,
                       popUpType: popUpType,
                       closeButtonTitle: buttonCloseTitle,
                       closeButtonUrl: buttonCloseUrl,
                       closeButtonAction: buttonCloseAction,
                       doneButtonTitle: buttonDoneTitle,
                       doneButtonUrl: buttonDoneUrl,
                       doneButtonAction: buttonDoneAction)
    }
}

