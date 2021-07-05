//
//  ReceiverRoute.swift
//  Receiver
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import UIKit
import Core

protocol ReceiverRouter {
    func navigateToTransaction(contact: ContactEntity, viewController: UIViewController)
    func navigateToHome(viewController: UIViewController)
}
