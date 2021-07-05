//
//  BalanceNetworkManager.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation

public protocol BalanceNetworkManager {
    func getBalance(completion: @escaping (GetBalanceDataResponse?, Error?) -> ())
    func patchProfilePhone( username: String, firstname: String, lastname: String, email: String, phone: String, completion: @escaping (GetBalanceDataResponse?, Error?) -> ())
}
