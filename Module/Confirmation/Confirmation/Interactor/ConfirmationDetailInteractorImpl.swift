//
//  ConfirmationDetailInteractorImpl.swift
//  Confirmation
//
//  Created by MacBook on 29/05/21.
//

import Foundation
import Core

class ConfirmationDetailInteractorImpl: ConfirmationDetailInteractor {
    
    var interactorOutput: ConfirmationDetailInteractorOutput?
    
    init() {}
    
    func getContactFromTransfer(contact: ContactEntity) {
        self.interactorOutput?.fetchContactObject(contact: contact)
    }
}
