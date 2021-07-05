//
//  TransferInteractorImpl.swift
//  Transfer
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import Core

class TransferInteractorImpl: TransferInteractor {
    
    var interactorOutput: TransferInteractorOutput?
    var balanceNetworkManager: BalanceNetworkManager
    
    init(balanceNetworkManager: BalanceNetworkManager) {
        self.balanceNetworkManager = balanceNetworkManager
    }
    
    func showUserData(contact: ContactEntity) {
        self.interactorOutput?.fetchContactObject(contact: contact)
    }
    
    func getBalance() {
        self.balanceNetworkManager.getBalance { (data, error) in
            if let balance = data {
                let userProfile = UserProfileEntity(name: balance.name, balance: balance.balance, phoneNumber: balance.phone, imageUrl: balance.image)
                self.interactorOutput?.loadedUserProfileData(userProfile: userProfile)
            }
        }
    }
}
