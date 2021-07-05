//
//  HomeRouterImpl.swift
//  Home
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import UIKit
import Core

public class HomeRouterImpl {
    
    public static func navigateToModule() {
        //menampilkan halaman login
        let bundle = Bundle(identifier: "com.grevi.msx.Home")
        let vc = HomeViewController(nibName: "HomeViewController", bundle: bundle)
        
        let balanceNetworkManager = BalanceNetworkManagerImpl()
        let invoiceNetworkManager = InvoiceNetworkManagerImpl()
        
        let router = HomeRouterImpl()
        let interactor = HomeInteractorImpl(balanceNetworkManager: balanceNetworkManager, invoiceNetwokManager: invoiceNetworkManager)
        let presenter = HomePresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.intercatorOutput = presenter
        
        vc.presenter = presenter
        
        UIApplication.shared.windows.first?.rootViewController = UINavigationController(rootViewController: vc)
        vc.navigationController?.setNavigationBarHidden(true, animated: true)
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}

extension HomeRouterImpl: HomeRouter {
    func navigateToTransfer(viewController: UIViewController) {
        AppRouter.shared.navigateToReceiver(viewController)
    }
    
    func navigateToHistory(viewController: UIViewController) {
        AppRouter.shared.navigateToHistory(viewController)
    }
    
    func navigateToLogin() {
        NotificationCenter.default.post(name: Notification.Name("reloadRootView"), object: nil)
    }
    
    func navigateToProfile(viewController: UIViewController) {
        AppRouter.shared.navigateToProfile(viewController)
    }
}
