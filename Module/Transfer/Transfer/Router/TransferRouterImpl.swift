//
//  TransferRouterImpl.swift
//  Transfer
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import UIKit
import Core

public class TransferRouterImpl {
    public static func navigateToModule(contact: ContactEntity, viewController: UIViewController) {
        print("transfer: \(contact.name)")
        
        let bundle = Bundle(identifier: "com.grevi.msx.Transfer")
        let view = TransferViewController(nibName: "TransferViewController", bundle: bundle)
        
        let balanceNetworkManager = BalanceNetworkManagerImpl()
        
        let router = TransferRouterImpl()
        let interactor = TransferInteractorImpl(balanceNetworkManager: balanceNetworkManager)
        let presenter = TransferPresenterImpl(view: view, interactor: interactor, router: router, contact: contact)
        
        interactor.interactorOutput = presenter
        
        view.presenter = presenter
        
        viewController.navigationController?.pushViewController(view, animated: true)
    }
}

extension TransferRouterImpl: TransferRouter {
    func navigateToTransferDetail(amount: String, notes: String, userBalance: Int, contact: ContactEntity, viewController: UIViewController) {
        AppRouter.shared.navigateToDetailTransfer(Int(amount) ?? 0, notes, userBalance, contact, viewController)
    }
    
    func navigateToReceiver(viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
    
}
