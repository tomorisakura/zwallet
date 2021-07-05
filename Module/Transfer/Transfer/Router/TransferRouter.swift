//
//  TransferRouter.swift
//  Transfer
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import UIKit
import Core

protocol TransferRouter {
    func navigateToReceiver(viewController: UIViewController)
    func navigateToTransferDetail(amount: String, notes: String, userBalance: Int, contact: ContactEntity, viewController: UIViewController)
}
