//
//  OtpPresenterImpl.swift
//  Otp
//
//  Created by MacBook on 27/05/21.
//

import Foundation

class OtpPresenterImpl: OtpPresenter {
    
    var view: OtpView
    var interactor: OtpInteractor
    var route: OtpRouter
    
    init(view: OtpView, interactor: OtpInteractor, route: OtpRouter) {
        self.view = view
        self.interactor = interactor
        self.route = route
    }
    
    func otp(email: String, code: String) {
        self.interactor.postOtpData(email: email, code: code)
    }
    
    func getEmail() -> String {
        return self.interactor.getEmailShared()
    }
    
    func showLogin() {
        self.route.navigateToLogin()
    }
    
    func showPin() {
        self.route.navigateToPin()
    }
    
}

extension OtpPresenterImpl: OtpInteractorOutput {
    func authenticate(isSuccess: Bool, message: String?) {
        if isSuccess {
            if let message = message {
                self.view.showSuccess(message: message)
            }
        } else {
            self.view.showError()
        }
    }
}
