//
//  UserDefault+Extension.swift
//  ResumeApp
//
//  Created by Yusuf Çınar on 30.04.2022.
//

import UIKit

extension UserDefaults {
    
    enum UserDefaultKeys: String , CaseIterable {
        case userModel
    }
    
    //MARK:Reset UserDefault
    func resetDefaults(keys: [UserDefaultKeys] = UserDefaultKeys.allCases) {
        keys.forEach ({
            self.removeObject(forKey:$0.rawValue)
            self.synchronize()
        })
    }
    
    // MARK:- User Model
    func getUserModel() -> UserModel? {
        guard let userData = data(forKey: UserDefaultKeys.userModel.rawValue) else { return nil }
        do {
            let userModel =  try JSONDecoder().decode(UserModel.self, from: userData)
            return userModel
        } catch let decoderError {
            print("failed to decoder",decoderError)
        }
        return nil
    }
    
    func saveUserModel(userModel: UserModel){
        do {
            let data = try JSONEncoder().encode(userModel)
            set(data, forKey: UserDefaultKeys.userModel.rawValue)
            synchronize()
        } catch let encodeError {
            print("Failed to encode countModel ",encodeError)
        }
    }
}
