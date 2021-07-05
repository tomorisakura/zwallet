//
//  TransferPresenter.swift
//  Transfer
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import UIKit
import Core

protocol TransferPresenter {
    func getContactData()
    func showConfirmation()
    func backToReceiver(viewController: UIViewController)
    func navigateToTransferDetail(viewController: UIViewController, amount: String, notes: String, userBalance: Int, contact: ContactEntity)
    func loadProfile()
}
