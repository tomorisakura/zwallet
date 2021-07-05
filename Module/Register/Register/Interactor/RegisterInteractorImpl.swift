//
//  RegisterInteractorImpl.swift
//  Register
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import Core

class RegisterInteractorImpl: RegisterInteractor {
    
    var interactorOutput: RegisterInteractorOutput?
    var registerNetworkManager: RegisterNetworkManager
    
    init(networkManager: RegisterNetworkManager) {
        self.registerNetworkManager = networkManager
    }
    
    func postRegisterData(username: String, email: String, password: String) {
        self.registerNetworkManager.register(username: username, email: email, password: password) { (response, error) in
            if let registerData = response {
                if registerData.status == 200 {
                    self.interactorOutput?.authenticateRegister(isSuccess: true)
                    UserDefaultHelper.shared.set(key: .email, value: email)
                }
            }
        }
    }
}
