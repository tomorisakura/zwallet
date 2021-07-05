//
//  ReceiverPresenterImpl.swift
//  Receiver
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import Core
import UIKit

class ReceiverPresenterImpl: ReceiverPresenter {
    
    let view: ReceiverView
    let interactor: ReceiverInteractor?
    let router: ReceiverRouter
    
    init(view: ReceiverView, interactor: ReceiverInteractor, router: ReceiverRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func getContactData() {
        interactor?.getAllContact()
    }
    
    func showNavigateToHome(viewController: UIViewController) {
        self.router.navigateToHome(viewController: viewController)
    }
    
    func showNavigateToTransfer(contact: ContactEntity, viewController: UIViewController) {
        self.router.navigateToTransaction(contact: contact, viewController: viewController)
    }
}

extension ReceiverPresenterImpl: ReceiverInteractorOutput {
    func fetchContactDatas(contact: [ContactEntity]) {
        self.view.showContacts(contact: contact)
    }
    
}
