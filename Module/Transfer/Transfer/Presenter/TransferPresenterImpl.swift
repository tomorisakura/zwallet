//
//  TransferPresenterImpl.swift
//  Transfer
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import Core
import UIKit

class TransferPresenterImpl: TransferPresenter {
    
    let interactor: TransferInteractor?
    let router: TransferRouter
    let view: TransferView
    
    let contact: ContactEntity
    
    init(view: TransferView, interactor: TransferInteractor, router: TransferRouter, contact: ContactEntity) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.contact = contact
    }
    
    func getContactData() {
        self.interactor?.showUserData(contact: contact)
    }
    
    func showConfirmation() {
        //confirmation
    }
    
    func backToReceiver(viewController: UIViewController) {
        self.router.navigateToReceiver(viewController: viewController)
    }
    
    func navigateToTransferDetail(viewController: UIViewController,amount: String, notes: String, userBalance: Int, contact: ContactEntity) {
        self.router.navigateToTransferDetail(amount: amount, notes: notes, userBalance: userBalance, contact: contact, viewController: viewController)
    }
    
    func loadProfile() {
        self.interactor?.getBalance()
    }
    
}

extension TransferPresenterImpl: TransferInteractorOutput {
    func loadedUserProfileData(userProfile: UserProfileEntity) {
        self.view.initProfileBalance(profile: userProfile)
    }
    
    func fetchContactObject(contact: ContactEntity) {
        self.view.initContactData(contact: contact)
    }
}
