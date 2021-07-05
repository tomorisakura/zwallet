//
//  HomePresenterImpl.swift
//  Home
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import UIKit
import Core

class HomePresenterImpl: HomePresenter {
    
    let view: HomeView
    let intercator: HomeInteractor
    let router: HomeRouter
    
    init(view: HomeView, interactor: HomeInteractor, router: HomeRouter) {
        self.view = view
        self.intercator = interactor
        self.router = router
    }
    
    func showHistory(viewController: UIViewController) {
        self.router.navigateToHistory(viewController: viewController)
    }
    
    func loadProfile() {
        self.intercator.getUserProfile()
    }
    
    func loadTransaction() {
        self.intercator.getTransaction()
    }
    
    func logout() {
        UserDefaultHelper.shared.remove(key: .userToken)
        UserDefaultHelper.shared.remove(key: .email)
        UserDefaultHelper.shared.remove(key: .userTokenExpired)
        UserDefaultHelper.shared.remove(key: .refreshToken)
        UserDefaultHelper.shared.remove(key: .email)
        self.router.navigateToLogin()
    }
    
    func showReceiver(viewController: UIViewController) {
        self.router.navigateToTransfer(viewController: viewController)
    }
    
    func showProfile(viewContoller: UIViewController) {
        self.router.navigateToProfile(viewController: viewContoller)
    }
}

extension HomePresenterImpl: HomeInteractorOutput {
    func loadedUserProfileData(userProfile: UserProfileEntity) {
        self.view.showUserprofileData(userProfile: userProfile)
    }
    
    func loadedTransactionData(transactions: [TransactionEntity]) {
        self.view.showTransactionData(transactions: transactions)
    }
}
