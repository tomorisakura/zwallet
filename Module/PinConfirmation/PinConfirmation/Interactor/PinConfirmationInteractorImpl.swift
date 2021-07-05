//
//  PinConfirmationImpl.swift
//  PinConfirmation
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import Core

class PinConfirmationInteractorImpl: PinConfirmationInteractor {
    
    var transferNetworkManager: TransferNetworkManager
    
    var interactorOutput: PinConfirmationInteractorOutput?
    
    var transfer: TransferEntity
    var contact: ContactEntity
    
    init(traNetwokManager: TransferNetworkManager, transfer: TransferEntity, contact: ContactEntity) {
        self.transfer = transfer
        self.transferNetworkManager = traNetwokManager
        self.contact = contact
    }
    
    func checkPin(pin: String) {
        self.transferNetworkManager.transfer(receiver: contact.id, amount: transfer.amount, notes: transfer.notes, pin: pin) { (response, error) in
            if let response = response {
                if response.status == 200 {
                    print(response)
                    self.interactorOutput?.authenticate(isSuccess: true, message: response.message, transfer: self.transfer, contact: self.contact)
                } else if response.status == 404 {
                    self.interactorOutput?.authenticate(isSuccess: false, message: response.message, transfer: nil, contact: nil)
                }
            }
        }
    }
    
}
