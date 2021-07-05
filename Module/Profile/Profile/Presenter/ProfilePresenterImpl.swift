//
//  ProfilePresenterImpl.swift
//  Profile
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import Core
import UIKit

class ProfilePresenterImpl: ProfilePresenter {

    let interactor: ProfileInteractor?
    let router: ProfileRouter
    let view: ProfileView
    
    init(view: ProfileView, interactor: ProfileInteractor, router: ProfileRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func loadProfile() {
        self.interactor?.getProfile()
    }
    
    func backToHome(viewController: UIViewController) {
        self.router.navigateToHome(viewController: viewController)
    }
    
    func showAddPhone(viewController: UIViewController, profile: UserProfileEntity) {
        self.router.navigateToEditProfile(viewController: viewController, profile: profile)
    }
    
}

extension ProfilePresenterImpl: ProfileInteractorOutput {
    func loadedUserProfileData(userProfile: UserProfileEntity) {
        self.view.showProfile(profile: userProfile)
    }
}
