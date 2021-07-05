//
//  ContactEntity.swift
//  Core
//
//  Created by MacBook on 27/05/21.
//

import Foundation

public struct ContactEntity {
    public var id: Int
    public var name: String
    public var phone: String
    public var image: String
    
    public init(id: Int, name: String, phone: String, image: String) {
        self.id = id
        self.name = name
        self.phone = phone
        self.image = image
    }
    
}
