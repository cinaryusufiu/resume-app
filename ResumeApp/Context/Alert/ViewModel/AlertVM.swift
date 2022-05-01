//
//  ViewModel.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 1.05.2022.
//
import Foundation

final class AlertVM: ResumeBaseVM {
    
    typealias ButtonCompletionBlock = () -> Void
    
    var title: String
    var descriptionText: String
    var popUpType: PopUpType
    var closeButtonTitle: String?
    var closeButtonUrl: String?
    var doneButtonTitle: String?
    var doneButtonUrl: String?
    var closeButtonAction: ButtonCompletionBlock?
    var doneButtonAction: ButtonCompletionBlock?
    
    init(descriptionText: String,
         title: String,
         popUpType: PopUpType = .error,
         closeButtonTitle: String?,
         closeButtonUrl: String?,
         closeButtonAction:ButtonCompletionBlock?,
         doneButtonTitle: String?,
         doneButtonUrl: String?,
         doneButtonAction:ButtonCompletionBlock?){
        self.descriptionText = descriptionText
        self.title = title
        self.popUpType = popUpType
        self.closeButtonTitle = closeButtonTitle
        self.closeButtonUrl = closeButtonUrl
        self.doneButtonTitle = doneButtonTitle
        self.doneButtonUrl = doneButtonUrl
        self.closeButtonAction = closeButtonAction
        self.doneButtonAction = doneButtonAction
    }
}
