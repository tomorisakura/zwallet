//
//  ReceiverPresenter.swift
//  Receiver
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import Core
import UIKit

protocol ReceiverPresenter {
    func getContactData()
    func showNavigateToHome(viewController: UIViewController)
    func showNavigateToTransfer(contact: ContactEntity, viewController: UIViewController)
}
