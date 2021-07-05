//
//  SceneDelegate.swift
//  App
//
//  Created by MacBook on 31/05/21.
//

import UIKit
import Core
import Pin
import Login
import Register
import AddPhone
import Confirmation
import EditProfile
import History
import Home
import Otp
import PinConfirmation
import Profile
import Receiver
import SuccessTransfer
import TopUp
import TopupCentre
import Transfer

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        self.setupAppRouter()
        
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = scene
        
        self.reloadRootView()

        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadRootView), name: Notification.Name("reloadRootView"), object: nil)
    }
    
    @objc func reloadRootView() {
        let token : String? = UserDefaultHelper.shared.get(key: .userToken)
        if token != nil {
            AppRouter.shared.navigateToHome()
        } else {

            AppRouter.shared.navigateToLogin()
        }
    }


    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

}

@available(iOS 13.0, *)
extension SceneDelegate {
    func setupAppRouter() {
        AppRouter.shared.loginScene = {
            LoginRouterImpl.navigateToModule()
        }

        AppRouter.shared.registerScene = {

            RegisterRouterImpl.navigateToModule()
        }

        AppRouter.shared.otpScene = {
            OtpRouterImpl.navigateToModule()
        }

        AppRouter.shared.pinScene = {
            PinRouterImpl.navigateToModule()
        }

        AppRouter.shared.addPhoneScene = { (viewController, profile) in
            PhoneRouterImpl.navigateToModule(viewController: viewController, profile: profile)
        }

        AppRouter.shared.homeScene = {
            HomeRouterImpl.navigateToModule()
        }
        
        AppRouter.shared.profileScene = { (viewController) in
            ProfileRouterImpl.navigateToModule(viewController: viewController)
        }

        AppRouter.shared.historyScene = {(viewController) in
            HistoryRouterImpl.navigateToModule(viewController: viewController)
        }

        AppRouter.shared.receiverScene = { (viewController) in
            ReceiverRouteImpl.navigateToModule(viewController: viewController)
        }

        AppRouter.shared.transferScene = { (contact, viewController) in
            TransferRouterImpl.navigateToModule(contact: contact, viewController: viewController)
        }
        
        AppRouter.shared.detailTransferScene = { (amount, notes, userBalance, contact, viewController) in
            ConfirmationRouterImpl.navigateToModule(amount: amount, notes: notes, userBalance: userBalance, contact: contact, viewController: viewController)
        }

        AppRouter.shared.pinConfirmationScene = { (amount, notes, userBalance, contact, viewController) in
            PinConfirmationRouterImpl.navigateToModule(amount: amount, notes: notes, userBalance: userBalance, contact: contact, viewController: viewController)
        }
        
        AppRouter.shared.successTransferScene = { (amount, notes, userBalance, contact, viewController) in
            SuccessTransferRouterImpl.navigateToModule(amount: amount, notes: notes, balance: userBalance, contact: contact, viewController: viewController)
        }

        AppRouter.shared.transferScene = { (contact, viewController) in
            TransferRouterImpl.navigateToModule(contact: contact, viewController: viewController)
        }
        
        AppRouter.shared.topupScene = { (viewController) in
            TopupRouterImpl.navigateToModule(viewController: viewController)
        }
    }
}

