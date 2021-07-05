//
//  PinInteractorImpl.swift
//  Pin
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import Core

class PinInteractorImpl: PinInteractor {

    var interactorOutput: PinInteractorOutput?
    var networkManager: PinNetworkManager
    
    init(networkManager: PinNetworkManager) {
        self.networkManager = networkManager
    }
    
    func postPin(pin: String) {
        self.networkManager.authenticatePin(pin: pin) { (data, error) in
            if let response = data {
                if response.status == 200 {
                    self.interactorOutput?.authenticate(isSuccess: true)
                } else {
                    self.interactorOutput?.authenticate(isSuccess: false)
                }
            }
        }
    }
}
