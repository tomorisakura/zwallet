//
//  RegisterPresenterImpl.swift
//  Register
//
//  Created by MacBook on 26/05/21.
//

import Foundation

public class RegisterPresenterImpl: RegisterPresenter {
    
    let view: RegisterView
    let interactor: RegisterInteractor
    let router: RegisterRouter
    
    init(view: RegisterView, interactor: RegisterInteractor, router: RegisterRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func register(username: String, email: String, password: String) {
        self.interactor.postRegisterData(username: username, email: email, password: password)
    }
    
    func showLogin() {
        self.router.navigateToLogin()
    }
}

extension RegisterPresenterImpl: RegisterInteractorOutput {
    func authenticateRegister(isSuccess: Bool) {
        if isSuccess {
            self.router.navigateToOtp()
        } else {
            self.view.showError()
        }
    }
    
    
}
