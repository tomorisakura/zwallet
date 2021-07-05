//
//  PinConfirmationRouterImpl.swift
//  PinConfirmation
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import Core
import UIKit

public class PinConfirmationRouterImpl {
    public static func navigateToModule(amount: Int, notes: String, userBalance: Int, contact: ContactEntity, viewController: UIViewController) {
        let transfer: TransferEntity = TransferEntity(amount: amount, balance: userBalance, notes: notes)
        
        let bundle = Bundle(identifier: "com.grevi.msx.PinConfirmation")
        let view = PinConfirmationViewController(nibName: "PinConfirmationViewController", bundle: bundle)
        
        let transferNetworkManager = TransferNetworkmanagerImpl()
        
        let router = PinConfirmationRouterImpl()
        let interactor = PinConfirmationInteractorImpl(traNetwokManager: transferNetworkManager, transfer: transfer, contact: contact)
        let presenter = PinConfirmationPresenterImpl(interactor: interactor, router: router, view: view)
        presenter.viewController = view
        interactor.interactorOutput = presenter
        
        view.presenter = presenter
        
        viewController.navigationController?.pushViewController(view, animated: true)
        view.amount = amount
        view.contact = contact
        view.notes = notes
        view.currentBalance = userBalance
    }
}

extension PinConfirmationRouterImpl: PinConfirmationRouter {
    func navigateToSuccessDetail(amount: Int, notes: String, userBalance: Int, contact: ContactEntity, viewController: UIViewController) {
        let balanceLeft = (userBalance - amount)
        AppRouter.shared.navigateTosuccessTransfer(amount, notes, balanceLeft, contact, viewController)
    }
    
    func navigateToDetailConfirmation(viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
    
    
}
