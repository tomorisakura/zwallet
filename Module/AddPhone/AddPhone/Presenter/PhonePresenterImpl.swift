//
//  PhonePresenterImpl.swift
//  AddPhone
//
//  Created by MacBook on 31/05/21.
//

import Foundation
import Core
import UIKit

class PhonePresenterImpl: PhonePresenter {
    
    let view: PhoneView
    var interactor: PhoneInteractor
    var route: PhoneRouter
    
    init(view: PhoneView, interactor: PhoneInteractor, route: PhoneRouter) {
        self.view = view
        self.interactor = interactor
        self.route = route
    }
    
    func showbackToProfile(viewController: UIViewController) {
        self.route.navigateToProfile(viewController: viewController)
    }
    
    func showUserProfile() {
        self.interactor.getProfile()
    }
    
}

extension PhonePresenterImpl: PhoneInteractorOutput {
    func loadedUserProfileData(userProfile: UserProfileEntity) {
        self.view.showProfile(profile: userProfile)
    }
}
