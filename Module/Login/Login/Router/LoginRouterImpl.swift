//
//  LoginRouterImpl.swift
//  Login
//
//  Created by MacBook on 24/05/21.
//

import Foundation

import Foundation
import UIKit
import Core

public class LoginRouterImpl {
    public static func navigateToModule() {
        //menampilkan halaman login
        let bundle = Bundle(identifier: "com.grevi.msx.Login")
        let vc = LoginViewController(nibName: "LoginViewController", bundle: bundle)
        
        let networkManager = AuthNetworkManagerImpl()
        
        let router = LoginRouterImpl()
        let interactor = LoginInteractorImpl(networkManager: networkManager)
        let presenter = LoginPresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        
        vc.presenter = presenter
        
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}

extension LoginRouterImpl: LoginRouter {
    
    public func navigateToRegister() {
        AppRouter.shared.navigateToRegister()
    }
    
    public func navigateToHome() {
        NotificationCenter.default.post(name: Notification.Name("reloadRootView"), object: nil)
    }
    
    public func navigateToPin() {
        AppRouter.shared.navigateToPin()
    }
}
