//
//  DetailTransferEntity.swift
//  SuccessTransfer
//
//  Created by MacBook on 30/05/21.
//

import Foundation

struct DetailTransferEntity {
    var amount: Int
    var balance: Int
    var notes: String
    var dateTime: String
    
    init(amount: Int, balance: Int, notes: String, dateTime: String) {
        self.amount = amount
        self.balance = balance
        self.notes = notes
        self.dateTime = dateTime
    }
}
