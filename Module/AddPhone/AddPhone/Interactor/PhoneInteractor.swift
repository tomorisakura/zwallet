//
//  PhoneInteractor.swift
//  AddPhone
//
//  Created by MacBook on 31/05/21.
//

import Foundation
import Core

protocol PhoneInteractor {
    func getProfile()
    func updateProfilePhone(profile: UserProfileEntity)
}
