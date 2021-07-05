//
//  SuccessTransferIntreactorOutput.swift
//  SuccessTransfer
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import Core

protocol SuccessTransferInteractorOutput {
    func fetchTransferObject(transfer: DetailTransferEntity, contact: ContactEntity)
}
