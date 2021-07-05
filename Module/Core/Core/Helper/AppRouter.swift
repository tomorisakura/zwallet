//
//  AppRouter.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import UIKit

public class AppRouter {
    public static let shared : AppRouter = AppRouter()
    
    public var loginScene: (() -> ())? = nil
    
    public func navigateToLogin() {
        self.loginScene?()
    }
    
    public var homeScene: (() -> ())? = nil
    
    public func navigateToHome() {
        self.homeScene?()
    }
    
    public var historyScene: ((_ viewController: UIViewController) -> ())? = nil
    
    public func navigateToHistory(_ viewController: UIViewController) {
        self.historyScene?(viewController)
    }
    
    public var registerScene: (() -> ())? = nil
    
    public func navigateToRegister() {
        self.registerScene?()
    }
    
    public var pinScene: (() -> ())? = nil
    
    public func navigateToPin() {
        self.pinScene?()
    }
    
    public var otpScene: (() -> ())? = nil
    
    public func navigateToOtp() {
        self.otpScene?()
    }
    
    public var receiverScene: ((_ viewController: UIViewController) -> ())?
    
    public func navigateToReceiver(_ viewController: UIViewController) {
        self.receiverScene?(viewController)
    }
    
    public var transferScene: ((_ contact: ContactEntity, _ viewController: UIViewController) -> ())?
    
    public func navigateToTransferScene(_ contact: ContactEntity, _ viewController: UIViewController) {
        self.transferScene?(contact, viewController)
    }
    
    public var detailTransferScene: ((_ amount: Int, _ notes: String, _ userBalance: Int, _ contact: ContactEntity, _ viewController: UIViewController) -> ())?
    
    public func navigateToDetailTransfer(_ amount: Int, _ notes: String, _ userBalance: Int, _ contact: ContactEntity, _ viewController: UIViewController) {
        self.detailTransferScene?(amount, notes, userBalance, contact, viewController)
    }
    
    public var pinConfirmationScene: ((_ amount: Int, _ notes: String, _ userBalance: Int, _ contact: ContactEntity, _ viewController: UIViewController) -> ())?
    
    public func navigateToPinConfirmation(_ amount: Int, _ notes: String, _ userBalance: Int, _ contact: ContactEntity, _ viewController: UIViewController) {
        self.pinConfirmationScene?(amount, notes, userBalance, contact, viewController)
    }
    
    public var successTransferScene: ((_ amount: Int, _ notes: String, _ balanceLeft: Int, _ contact: ContactEntity, _ viewController: UIViewController) -> ())?
    
    public func navigateTosuccessTransfer(_ amount: Int, _ notes: String, _ balanceLeft: Int, _ contact: ContactEntity, _ viewController: UIViewController) {
        self.successTransferScene?(amount, notes, balanceLeft, contact, viewController)
    }
    
    public var profileScene: ((_ viewController: UIViewController) -> ())?
    
    public func navigateToProfile(_ viewController: UIViewController) {
        self.profileScene?(viewController)
    }
    
    public var addPhoneScene: ((_ viewController: UIViewController, _ profile: UserProfileEntity) -> ())?
    
    public func navigateToAddPhone(_ viewController: UIViewController, _ profile: UserProfileEntity) {
        self.addPhoneScene?(viewController, profile)
    }
}
