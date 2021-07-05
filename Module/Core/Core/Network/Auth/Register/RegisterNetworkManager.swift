//
//  RegisterNetworkManager.swift
//  Core
//
//  Created by MacBook on 26/05/21.
//

import Foundation

public protocol RegisterNetworkManager {
    func register(username: String ,email: String, password: String, completion: @escaping (RegisterDataResponse?, Error?) -> ())
}
