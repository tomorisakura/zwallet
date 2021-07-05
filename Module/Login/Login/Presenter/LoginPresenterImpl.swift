//
//  LoginPresenterImpl.swift
//  Login
//
//  Created by MacBook on 24/05/21.
//

import Foundation

public class LoginPresenterImpl: LoginPresenter {
    
    let view: LoginView
    let interactor: LoginInteractor
    let router: LoginRouter
    
    init(view: LoginView, interactor: LoginInteractor, router: LoginRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func login(email: String, password: String) {
        self.interactor.postLoginData(email: email, password: password)
    }
    
    func showRegister() {
        self.router.navigateToRegister()
    }
}

extension LoginPresenterImpl: LoginIntercatorOutput {
    func authenticationResult(isSuccess: Bool, status: Int) {
        if isSuccess == true && status == 2 {
            self.router.navigateToHome()
        } else if isSuccess == true && status == 1 {
            self.router.navigateToPin()
        } else {
            self.view.showError()
        }
    }
}

/**
 1 = pin
 2 = home
 0 = error
 */
