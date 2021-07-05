//
//  TransferResponse.swift
//  Core
//
//  Created by MacBook on 30/05/21.
//

import Foundation

public struct TransferResponse: Codable {
    public var status: Int
    public var message: String
    public var details: TransferDataResponse
}

public struct TransferDataResponse: Codable {
    public var sender: Int
    public var receiver: Int
    public var amount: Int
    public var notes: String
    public var type: Int
    public var createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case sender
        case receiver
        case amount
        case notes
        case type
        case createdAt = "created_at"
    }
}
