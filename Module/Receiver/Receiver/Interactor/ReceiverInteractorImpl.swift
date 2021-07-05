//
//  ReceiverInteractorImpl.swift
//  Receiver
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import Core

class ReceiverInteractorImpl: ReceiverInteractor {
    
    var interactorOutput: ReceiverInteractorOutput?
    var networkManager: ContactNetworkManager
    
    init(networkManager: ContactNetworkManager) {
        self.networkManager = networkManager
    }
    
    func getAllContact() {
        self.networkManager.getContact { (response, error) in
            if let response = response {
                var contacts: [ContactEntity] = []
                
                response.data.forEach { (contact) in
                    contacts.append(ContactEntity(id: contact.id, name: contact.name, phone: contact.phone, image: contact.image))
                }
                self.interactorOutput?.fetchContactDatas(contact: contacts)
            }
        }
    }
}
