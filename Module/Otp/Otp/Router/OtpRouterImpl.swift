//
//  OtpRouterImpl.swift
//  Otp
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import UIKit
import Core

public class OtpRouterImpl {
    public static func navigateToModule() {
        let bundle = Bundle(identifier: "com.grevi.msx.Otp")
        let view = OtpViewController(nibName: "OtpViewController", bundle: bundle)
        
        let networkManager = OtpNetworkManagerImpl()
        
        let router = OtpRouterImpl()
        let interactor = OtpInteractorImpl(networkManager: networkManager)
        let presenter = OtpPresenterImpl(view: view, interactor: interactor, route: router)
        
        interactor.interactorOutput = presenter
        
        view.presenter = presenter
        
        UIApplication.shared.windows.first?.rootViewController = view
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}

extension OtpRouterImpl: OtpRouter {
    func navigateToPin() {
        AppRouter.shared.navigateToPin()
    }
    
    func navigateToLogin() {
        AppRouter.shared.navigateToLogin()
    }
}
