//
//  PhoneInteractorImpl.swift
//  AddPhone
//
//  Created by MacBook on 31/05/21.
//

import Foundation
import Core

class PhoneInteractorImpl: PhoneInteractor {
    
    var user: UserProfileEntity
    var interactorOutput: PhoneInteractorOutput?
    
    var networkManager: BalanceNetworkManager
    
    init(user: UserProfileEntity, networkManager: BalanceNetworkManager) {
        self.user = user
        self.networkManager = networkManager
    }
    
    func getProfile() {
        self.interactorOutput?.loadedUserProfileData(userProfile: user)
    }
    
    func updateProfilePhone(profile: UserProfileEntity) {
        
    }
    
}
