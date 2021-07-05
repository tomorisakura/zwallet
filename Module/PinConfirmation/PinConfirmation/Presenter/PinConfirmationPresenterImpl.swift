//
//  PinConfirmationPresenterImpl.swift
//  PinConfirmation
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import UIKit
import Core

class PinConfirmationPresenterImpl: PinConfirmationPresenter {
    
    let interactor: PinConfirmationInteractor?
    let router: PinConfirmationRouter
    let view: PinConfirmationView
    
    var viewController: UIViewController?
    
    init(interactor: PinConfirmationInteractor, router: PinConfirmationRouter, view: PinConfirmationView) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
    func checkUserPin(pin: String) {
        self.interactor?.checkPin(pin: pin)
    }
    
    func backToDetailConfirmation(viewController: UIViewController) {
        self.router.navigateToDetailConfirmation(viewController: viewController)
    }
    
}

extension PinConfirmationPresenterImpl: PinConfirmationInteractorOutput {
    
    func authenticate(isSuccess: Bool, message: String, transfer: TransferEntity?, contact: ContactEntity?) {
        if isSuccess {
            //navigateToTransferSuccess
            if let transfer = transfer, let contact = contact, let viewController = self.viewController {
                
                self.router.navigateToSuccessDetail(amount: transfer.amount, notes: transfer.notes, userBalance: transfer.balance, contact: contact, viewController: viewController)
            }
        } else {
            self.view.showError(message: message)
        }
    }
}
