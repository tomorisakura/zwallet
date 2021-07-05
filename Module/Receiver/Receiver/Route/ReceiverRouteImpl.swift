//
//  ReceiverRouteImpl.swift
//  Receiver
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import UIKit
import Core

public class ReceiverRouteImpl {
    public static func navigateToModule(viewController: UIViewController) {
        let bundle = Bundle(identifier: "com.grevi.msx.Receiver")
        let view = ReceiverViewController(nibName: "ReceiverViewController", bundle: bundle)
        
        let networkManager = ContactNetworkManagerImpl()
        
        let router = ReceiverRouteImpl()
        let interactor = ReceiverInteractorImpl(networkManager: networkManager)
        let presenter = ReceiverPresenterImpl(view: view, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        
        view.presenter = presenter
    
        viewController.navigationController?.pushViewController(view, animated: true)
//        UIApplication.shared.windows.first?.rootViewController = UINavigationController(rootViewController: view)
//        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}

extension ReceiverRouteImpl: ReceiverRouter {
    func navigateToHome(viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
    
    func navigateToTransaction(contact: ContactEntity, viewController: UIViewController) {
        AppRouter.shared.navigateToTransferScene(contact, viewController)
    }

}
