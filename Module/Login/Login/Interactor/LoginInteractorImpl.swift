//
//  LoginInteractorImpl.swift
//  Login
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import Core

class LoginInteractorImpl: LoginInteractor {
    var interactorOutput: LoginIntercatorOutput?
    var authNetworkManager: AuthNetworkManager
    
    init(networkManager: AuthNetworkManager) {
        self.authNetworkManager = networkManager
    }
    
    func postLoginData(email: String, password: String) {
        self.authNetworkManager.login(email: email, password: password) { (response, error) in
            if let logindata = response {
                if !logindata.data.hasPin {
                    //create pin fisrt
                    UserDefaultHelper.shared.set(key: .userToken, value: logindata.data.token)
                    self.interactorOutput?.authenticationResult(isSuccess: true, status: 1)
                } else {
                    //tell presenter if processed success
                    let tokenExpiredDate: Date = Calendar.current.date(byAdding: .second, value: logindata.data.expiredIn / 1000, to: Date()) ?? Date()
                    
                    UserDefaultHelper.shared.set(key: .userToken, value: logindata.data.token)
                    UserDefaultHelper.shared.set(key: .refreshToken, value: logindata.data.refreshToken)
                    UserDefaultHelper.shared.set(key: .userTokenExpired, value: tokenExpiredDate)
                    UserDefaultHelper.shared.set(key: .email, value: logindata.data.email)
                    self.interactorOutput?.authenticationResult(isSuccess: true, status: 2)
                }
            }else {
                //tell presenter if processed failure
                self.interactorOutput?.authenticationResult(isSuccess: false, status: 0)
            }
        }
    }
}
