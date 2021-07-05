//
//  PinConfirmationRouter.swift
//  PinConfirmation
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import UIKit
import Core

protocol PinConfirmationRouter {
    func navigateToSuccessDetail(amount: Int, notes: String, userBalance: Int, contact: ContactEntity, viewController: UIViewController)
    func navigateToDetailConfirmation(viewController: UIViewController)
}
