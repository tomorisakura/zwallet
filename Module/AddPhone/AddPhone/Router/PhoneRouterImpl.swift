//
//  PhoneRouterImpl.swift
//  AddPhone
//
//  Created by MacBook on 31/05/21.
//

import Foundation
import UIKit
import Core

public class PhoneRouterImpl {
    public static func navigateToModule(viewController: UIViewController, profile: UserProfileEntity) {
        let bundle = Bundle(identifier: "com.grevi.msx.AddPhone")
        let vc = AddPhoneViewController(nibName: "AddPhoneViewController", bundle: bundle)
        
        let networkManager = BalanceNetworkManagerImpl()
        
        let router = PhoneRouterImpl()
        let interactor = PhoneInteractorImpl(user: profile, networkManager: networkManager)
        let presenter = PhonePresenterImpl(view: vc, interactor: interactor, route: router)
        
        interactor.interactorOutput = presenter
        
        vc.presenter = presenter
        
        viewController.navigationController?.pushViewController(vc, animated: true)
        viewController.navigationController?.setToolbarHidden(true, animated: true)
    }
}

extension PhoneRouterImpl: PhoneRouter {
    func navigateToProfileSaved(viewController: UIViewController) {
        AppRouter.shared.navigateToProfile(viewController)
    }
    
    func navigateToProfile(viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
}
