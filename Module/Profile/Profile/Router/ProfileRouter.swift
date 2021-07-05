//
//  ProfileRouter.swift
//  Profile
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import UIKit
import Core

protocol ProfileRouter {
    func navigateToHome(viewController: UIViewController)
    func navigateToEditProfile(viewController: UIViewController, profile: UserProfileEntity)
}
