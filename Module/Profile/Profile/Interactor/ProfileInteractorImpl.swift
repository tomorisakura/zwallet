//
//  ProfileInteractorImpl.swift
//  Profile
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import Core

class ProfileInteractorImpl: ProfileInteractor {
    var netwokManager: BalanceNetworkManager
    var interactorOutput: ProfileInteractorOutput?
    
    init(networkManager: BalanceNetworkManager) {
        self.netwokManager = networkManager
    }
    
    func getProfile() {
        self.netwokManager.getBalance { (data, error) in
            if let balance = data {
                let userProfile = UserProfileEntity(name: balance.name, balance: balance.balance, phoneNumber: balance.phone, imageUrl: balance.image)
                self.interactorOutput?.loadedUserProfileData(userProfile: userProfile)
            }
        }
    }

    
}
