//
//  SuccessTransferRouterImpl.swift
//  SuccessTransfer
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import UIKit
import Core

public class SuccessTransferRouterImpl {
    public static func navigateToModule(amount: Int, notes: String, balance: Int, contact: ContactEntity, viewController: UIViewController) {
        
        let dateTimeNow = "\(DateTimeHelper.shared.generateCurrentDateTime()) - \(DateTimeHelper.shared.generateTimeNow())"
        
        let transfer: DetailTransferEntity = DetailTransferEntity(amount: amount, balance: balance, notes: notes, dateTime: dateTimeNow)
        let contact: ContactEntity = contact
        
        let bundle = Bundle(identifier: "com.grevi.msx.SuccessTransfer")
        let view = SuccessTransferViewController(nibName: "SuccessTransferViewController", bundle: bundle)
        
        let router = SuccessTransferRouterImpl()
        let interactor = SuccessTransferInteractorImpl()
        let presenter = SuccessTransferPresenterImpl(view: view, interactor: interactor, router: router, transfer: transfer, contact: contact)
        
        interactor.interactorOutput = presenter
        view.presenter = presenter
    
        viewController.navigationController?.pushViewController(view, animated: true)
    }
}

extension SuccessTransferRouterImpl: SuccessTransferRouter {
    func navigateToHome() {
        AppRouter.shared.navigateToHome()
    }
}
