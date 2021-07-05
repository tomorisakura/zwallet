//
//  ProfilePresenter.swift
//  Profile
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import UIKit
import Core

protocol ProfilePresenter {
    func loadProfile()
    func backToHome(viewController: UIViewController)
    func showAddPhone(viewController: UIViewController, profile: UserProfileEntity)
}
