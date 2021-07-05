//
//  ConfirmationPresenterImpl.swift
//  Confirmation
//
//  Created by MacBook on 29/05/21.
//

import Foundation
import Core
import UIKit

class ConfirmationPresenterImpl: ConfirmationPresenter {
    
    var view: ConfirmationView
    var interactor: ConfirmationDetailInteractor?
    var router: ConfirmationRouter
    var contact: ContactEntity
    
    init(view: ConfirmationView, interactor: ConfirmationDetailInteractor, router: ConfirmationRouter, contact: ContactEntity) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.contact = contact
    }
    
    func getObject() {
        self.interactor?.getContactFromTransfer(contact: contact)
    }
    
    func backToTransfer(viewController: UIViewController) {
        self.router.navigateToTransfer(viewController: viewController)
    }
    
    func continueListener(amount: Int, notes: String, userBalance: Int, contact: ContactEntity, viewController: UIViewController) {
        self.router.navigateToPinConfirmation(amount: amount, notes: notes, userBalance: userBalance, contact: contact, viewController: viewController)
    }
}

extension ConfirmationPresenterImpl: ConfirmationDetailInteractorOutput {
    func fetchContactObject(contact: ContactEntity) {
        self.view.showContactData(contact: contact)
    }
}
