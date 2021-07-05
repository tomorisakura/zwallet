//
//  HistoryPresenterImpl.swift
//  History
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import UIKit
import Core

class HistoryPresenterImpl: HistoryPresenter {
    
    let view: HistoryView
    let intercator: HistoryInteractor
    let router: HistoryRouter
    
    init(view: HistoryView, interactor: HistoryInteractor, router: HistoryRouter) {
        self.view = view
        self.intercator = interactor
        self.router = router
    }
    
    func loadThisWeekHistory() {
        self.intercator.getHistorys()
    }
    
    func loadTransaction() {
        self.intercator.getAllTransactionHistory()
    }
    
    func showHome(viewController: UIViewController) {
        self.router.navigateToHome(viewController: viewController)
    }
}


extension HistoryPresenterImpl: HistoryInteractorOutput {
    func loadAllHistoryData(history: [TransactionEntity]) {
        self.view.showThisWeekHistory(transactions: history)
    }
    
    func loadedHistoryData(historys: [TransactionEntity]) {
        self.view.showThisWeekHistory(transactions: historys)
    }
}
