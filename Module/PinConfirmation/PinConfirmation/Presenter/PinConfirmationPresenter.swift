//
//  PinConfirmationPresenter.swift
//  PinConfirmation
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import UIKit
import Core

protocol PinConfirmationPresenter {
    func checkUserPin(pin: String)
    func backToDetailConfirmation(viewController: UIViewController)
}
