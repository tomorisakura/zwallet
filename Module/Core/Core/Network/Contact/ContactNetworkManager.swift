//
//  ContactNetworkManager.swift
//  Core
//
//  Created by MacBook on 27/05/21.
//

import Foundation

public protocol ContactNetworkManager {
    func getContact(completion: @escaping (ContactResponse?, Error?) -> ())
}
