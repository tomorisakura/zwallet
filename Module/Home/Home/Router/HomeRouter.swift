//
//  HomeRouter.swift
//  Home
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import UIKit

protocol HomeRouter {
    func navigateToHistory(viewController: UIViewController)
    func navigateToLogin()
    func navigateToTransfer(viewController: UIViewController)
    func navigateToProfile(viewController: UIViewController)
}
