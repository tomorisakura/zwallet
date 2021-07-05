//
//  OtpInteractorImpl.swift
//  Otp
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import Core

class OtpInteractorImpl: OtpInteractor {
    
    
    var interactorOutput: OtpInteractorOutput?
    var otpNetworkManager: OtpNetworkManager
    
    init(networkManager: OtpNetworkManager) {
        self.otpNetworkManager = networkManager
    }
    
    func postOtpData(email: String, code: String) {
        self.otpNetworkManager.otp(email: email, code: code) { (response, error) in
            if let otpResponse = response {
                if otpResponse.status == 200 {
                    self.interactorOutput?.authenticate(isSuccess: true, message: otpResponse.message)
                } else {
                    self.interactorOutput?.authenticate(isSuccess: false, message: nil)
                }
            }
        }
    }
    
    func getEmailShared() -> String {
        return UserDefaultHelper.shared.get(key: .email) ?? ""
    }
    
}
