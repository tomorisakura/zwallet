//
//  ContactDataResponse.swift
//  Core
//
//  Created by MacBook on 27/05/21.
//

import Foundation

public struct ContactResponse: Codable {
    public var status: Int
    public var data: [ContactDataResponse]
}

public struct ContactDataResponse: Codable {
    public var id: Int
    public var name: String
    public var phone: String
    public var image: String
}
