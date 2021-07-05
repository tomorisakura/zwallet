//
//  HomeInteractorImpl.swift
//  Home
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import Core

class HomeInteractorImpl: HomeInteractor {
    
    var intercatorOutput: HomeInteractorOutput?
    
    var balanceNetwokManager: BalanceNetworkManager
    var invoiceNetworkManager: InvoiceNetworkManager
    
    init(balanceNetworkManager: BalanceNetworkManager, invoiceNetwokManager: InvoiceNetworkManager) {
        self.balanceNetwokManager = balanceNetworkManager
        self.invoiceNetworkManager = invoiceNetwokManager
    }
    
    func getUserProfile() {
        self.balanceNetwokManager.getBalance { (data, error) in
            if let balance = data {
                let userProfile = UserProfileEntity(name: balance.name, balance: balance.balance, phoneNumber: balance.phone, imageUrl: balance.image)
                self.intercatorOutput?.loadedUserProfileData(userProfile: userProfile)
            }
        }
    }
    
    func getTransaction() {
        self.invoiceNetworkManager.getThisWeekInvoice { (data, error) in
            var transactions: [TransactionEntity] = []
            
            data?.forEach({ (invoiceData) in
                transactions.append(TransactionEntity(name: invoiceData.name, type: invoiceData.type, imageUrl: invoiceData.image, amount: invoiceData.amount, notes: invoiceData.notes))
            })
            
            self.intercatorOutput?.loadedTransactionData(transactions: transactions)
        }
    }
}
