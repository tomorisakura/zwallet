//
//  TransactionEntity.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation

public struct TransactionEntity {
    var name: String
    var type: String
    var imageUrl: String
    var amount: Int
    var notes: String
    
    public init(name: String, type: String, imageUrl: String, amount: Int, notes: String) {
        self.name = name
        self.type = type
        self.imageUrl = imageUrl
        self.amount = amount
        self.notes = notes
    }
    
}
