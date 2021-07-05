//
//  RegisterRouterImpl.swift
//  Register
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import UIKit
import Core

public class RegisterRouterImpl {
    
    public static func navigateToModule() {
        let bundle = Bundle(identifier: "com.grevi.msx.Register")
        let view = RegisterViewController(nibName: "RegisterViewController", bundle: bundle)
        
        let networkManager = RegisterNetworkManagerImpl()
        
        let router = RegisterRouterImpl()
        let interactor = RegisterInteractorImpl(networkManager: networkManager)
        let presenter = RegisterPresenterImpl(view: view, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        
        view.presenter = presenter
        
        UIApplication.shared.windows.first?.rootViewController = view
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
}

extension RegisterRouterImpl: RegisterRouter {
    func navigateToLogin() {
        AppRouter.shared.navigateToLogin()
    }
    
    func navigateToOtp() {
        AppRouter.shared.navigateToOtp()
    }
}
