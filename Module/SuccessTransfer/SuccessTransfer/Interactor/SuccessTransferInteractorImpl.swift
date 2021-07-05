//
//  SuccessTransferInteractorImpl.swift
//  SuccessTransfer
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import Core

class SuccessTransferInteractorImpl: SuccessTransferInteractor {
    
    var interactorOutput: SuccessTransferInteractorOutput?
    
    init() {
        
    }
    
    func showTransferData(transfer: DetailTransferEntity, contact: ContactEntity) {
        self.interactorOutput?.fetchTransferObject(transfer: transfer, contact: contact)
    }
}
