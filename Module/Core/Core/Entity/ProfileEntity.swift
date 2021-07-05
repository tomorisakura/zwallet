//
//  ProfileEntity.swift
//  Core
//
//  Created by MacBook on 29/05/21.
//

import Foundation

public struct UserProfileEntity {
    public var name: String
    public var balance: Int
    public var phoneNumber: String
    public var imageUrl: String
    
    public init(name: String, balance: Int, phoneNumber: String, imageUrl: String) {
        self.name = name
        self.balance = balance
        self.phoneNumber = phoneNumber
        self.imageUrl = imageUrl
    }
}
