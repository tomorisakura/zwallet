//
//  PinConfirmationInteractorOutput.swift
//  PinConfirmation
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import Core

protocol PinConfirmationInteractorOutput {
    func authenticate(isSuccess: Bool, message: String, transfer: TransferEntity?, contact: ContactEntity?)
}
