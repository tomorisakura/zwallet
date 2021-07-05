//
//  ConfirmationRouter.swift
//  Confirmation
//
//  Created by MacBook on 29/05/21.
//

import Foundation
import UIKit
import Core

protocol ConfirmationRouter {
    func navigateToPinConfirmation(amount: Int, notes: String, userBalance: Int, contact: ContactEntity, viewController: UIViewController)
    func navigateToTransfer(viewController: UIViewController)
}
