//
//  ConfirmationPresenter.swift
//  Confirmation
//
//  Created by MacBook on 29/05/21.
//

import Foundation
import UIKit
import Core

protocol ConfirmationPresenter {
    func getObject()
    func backToTransfer(viewController: UIViewController)
    func continueListener(amount: Int, notes: String, userBalance: Int, contact: ContactEntity, viewController: UIViewController)
}
