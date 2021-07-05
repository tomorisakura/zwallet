//
//  TransferView.swift
//  Transfer
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import Core

protocol TransferView {
    func initContactData(contact: ContactEntity)
    func initProfileBalance(profile: UserProfileEntity)
    func showError()
}
