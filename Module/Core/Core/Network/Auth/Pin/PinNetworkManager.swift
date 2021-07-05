//
//  PinNetworkManager.swift
//  Core
//
//  Created by MacBook on 27/05/21.
//

import Foundation

public protocol PinNetworkManager {
    func authenticatePin(pin: String, completion: @escaping (PinDataResponse?, Error?) -> ())
    func checkPin(pin: String, completion: @escaping (PinDataResponse?, Error?) -> ())
}
