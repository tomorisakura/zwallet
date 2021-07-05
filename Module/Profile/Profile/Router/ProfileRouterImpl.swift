//
//  ProfileRouterImpl.swift
//  Profile
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import UIKit
import Core

public class ProfileRouterImpl {
    public static func navigateToModule(viewController: UIViewController) {
        let bundle = Bundle(identifier: "com.grevi.msx.Profile")
        let vc = ProfileViewController(nibName: "ProfileViewController", bundle: bundle)
        
        let balanceNetworkManager = BalanceNetworkManagerImpl()
        
        let router = ProfileRouterImpl()
        let interactor = ProfileInteractorImpl(networkManager: balanceNetworkManager)
        let presenter = ProfilePresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        
        vc.presenter = presenter
        
        viewController.navigationController?.pushViewController(vc, animated: true)
        viewController.navigationController?.setToolbarHidden(true, animated: true)
    }
}

extension ProfileRouterImpl: ProfileRouter {
    func navigateToEditProfile(viewController: UIViewController, profile: UserProfileEntity) {
        AppRouter.shared.navigateToAddPhone(viewController, profile)
    }
    
    func navigateToHome(viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
    
    
}
