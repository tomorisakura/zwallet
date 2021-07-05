//
//  TransferInteractor.swift
//  Transfer
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import Core

protocol TransferInteractor {
    func showUserData(contact: ContactEntity)
    func getBalance()
}
