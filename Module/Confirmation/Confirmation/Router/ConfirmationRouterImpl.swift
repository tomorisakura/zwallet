//
//  ConfirmationRouterImpl.swift
//  Confirmation
//
//  Created by MacBook on 29/05/21.
//

import Foundation
import Core
import UIKit

public class ConfirmationRouterImpl {
    public static func navigateToModule(amount: Int, notes: String, userBalance: Int, contact: ContactEntity, viewController: UIViewController) {
        
        let bundle = Bundle(identifier: "com.grevi.msx.Confirmation")
        let view = ConfirmationViewController(nibName: "ConfirmationViewController", bundle: bundle)
        
        let router = ConfirmationRouterImpl()
        let interactor = ConfirmationDetailInteractorImpl()
        let presenter = ConfirmationPresenterImpl(view: view, interactor: interactor, router: router, contact: contact)
        
        interactor.interactorOutput = presenter
        view.presenter = presenter
    
        viewController.navigationController?.pushViewController(view, animated: true)
        view.amount = amount
        view.notes = notes
        view.balance = userBalance
    }
}

extension ConfirmationRouterImpl: ConfirmationRouter {
    func navigateToTransfer(viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
    
    func navigateToPinConfirmation(amount: Int, notes: String, userBalance: Int, contact: ContactEntity, viewController: UIViewController) {
        AppRouter.shared.navigateToPinConfirmation(amount, notes, userBalance, contact, viewController)
    }
}
