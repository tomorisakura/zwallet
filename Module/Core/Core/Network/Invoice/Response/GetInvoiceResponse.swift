//
//  GetInvoiceResponse.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation

public struct GetInvoiceResponse: Codable {
    public var status: Int
    public var message: String
    public var data: [GetInvoiceDataResponse]
}

public struct GetInvoiceDataResponse: Codable {
    public var id: Int
    public var sender: Int
    public var receiver: Int
    public var name: String
    public var phone: String
    public var image: String
    public var type: String
    public var amount: Int
    public var notes: String
}
