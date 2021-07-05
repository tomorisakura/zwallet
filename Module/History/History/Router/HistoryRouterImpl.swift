//
//  HistoryRouterImpl.swift
//  History
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import UIKit
import Core

public class HistoryRouterImpl {
    
    public static func navigateToModule(viewController: UIViewController) {
        //menampilkan halaman login
        let bundle = Bundle(identifier: "com.grevi.msx.History")
        let vc = HistoryViewController(nibName: "HistoryViewController", bundle: bundle)
        
        let historyNetworkManager = InvoiceNetworkManagerImpl()
        
        let router = HistoryRouterImpl()
        let interactor = HistoryInteractorImpl(historyNetworkManager: historyNetworkManager)
        let presenter = HistoryPresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        
        vc.presenter = presenter
        
        viewController.navigationController?.pushViewController(vc, animated: true)
        viewController.navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
}

extension HistoryRouterImpl: HistoryRouter {
    func navigateToHome(viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
}
