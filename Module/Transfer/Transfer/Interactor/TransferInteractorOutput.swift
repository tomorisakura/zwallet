//
//  TransferInteractorOutput.swift
//  Transfer
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import Core

protocol TransferInteractorOutput {
    func fetchContactObject(contact: ContactEntity)
    func loadedUserProfileData(userProfile: UserProfileEntity)
}
