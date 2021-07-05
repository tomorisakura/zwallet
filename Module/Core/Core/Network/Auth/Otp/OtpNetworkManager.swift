//
//  OtpNetworkManager.swift
//  Core
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import Moya

public protocol OtpNetworkManager {
    func otp(email:String, code: String, completion: @escaping (OtpResponse?, Error?) -> ())
}
