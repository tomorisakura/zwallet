//
//  PinRouteImpl.swift
//  Pin
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import UIKit
import Core


public class PinRouterImpl {
    public static func navigateToModule() {
        let bundle = Bundle(identifier: "com.grevi.msx.Pin")
        let view = PinViewController(nibName: "PinViewController", bundle: bundle)
        
        let networkManager = PinNetworkManagerImpl()
        
        let router = PinRouterImpl()
        let interactor = PinInteractorImpl(networkManager: networkManager)
        let presenter = PinPresenterImpl(interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        
        view.presenter = presenter
        
        UIApplication.shared.windows.first?.rootViewController = view
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}

extension PinRouterImpl: PinRouter {
    func navigateToHome() {
        AppRouter.shared.navigateToHome()
    }
}
