//
//  GetBalanceResponse.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation

public struct GetBalanceResponse: Codable {
    var status: Int
    var message: String
    var data : [GetBalanceDataResponse]
}

public struct GetBalanceDataResponse: Codable {
    public var id: Int
    public var name: String
    public var phone: String
    public var balance: Int
    public var image: String
}
