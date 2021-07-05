//
//  ReceiverView.swift
//  Receiver
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import Core
import UIKit

protocol ReceiverView {
    func showContacts(contact: [ContactEntity])
    func showData(contact: ContactEntity)
}
