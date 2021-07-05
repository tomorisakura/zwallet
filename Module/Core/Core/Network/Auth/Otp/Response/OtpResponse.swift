//
//  OtpResponse.swift
//  Core
//
//  Created by MacBook on 27/05/21.
//

import Foundation

public struct OtpResponse: Codable {
    public var status: Int
    public var message: String
    public var email: String
}
