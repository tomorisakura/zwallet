//
//  SuccessTransferPresenterImpl.swift
//  SuccessTransfer
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import Core

class SuccessTransferPresenterImpl: SuccessTransferPresenter {

    var view: SuccessTransferView
    var interactor: SuccessTransferInteractor?
    var router: SuccessTransferRouter
    
    var transfer: DetailTransferEntity
    var contact: ContactEntity
    
    init(view: SuccessTransferView, interactor: SuccessTransferInteractor, router: SuccessTransferRouter, transfer: DetailTransferEntity, contact: ContactEntity) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.transfer = transfer
        self.contact = contact
    }
    
    func showtransferData() {
        self.interactor?.showTransferData(transfer: self.transfer, contact: self.contact)
    }
    
    func continueToHome() {
        self.router.navigateToHome()
    }
}

extension SuccessTransferPresenterImpl: SuccessTransferInteractorOutput {
    func fetchTransferObject(transfer: DetailTransferEntity, contact: ContactEntity) {
        self.view.showData(transfer: transfer, contact: contact)
    }
}
