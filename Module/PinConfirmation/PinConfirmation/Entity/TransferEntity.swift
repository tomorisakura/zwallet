//
//  TransferEntity.swift
//  PinConfirmation
//
//  Created by MacBook on 30/05/21.
//

import Foundation

struct TransferEntity {
    var amount: Int
    var balance: Int
    var notes: String
    
    init(amount: Int, balance: Int, notes: String) {
        self.amount = amount
        self.balance = balance
        self.notes = notes
    }
}
