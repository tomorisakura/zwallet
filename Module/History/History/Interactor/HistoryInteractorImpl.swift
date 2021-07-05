//
//  HistoryInteractorImpl.swift
//  History
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import Core

class HistoryInteractorImpl: HistoryInteractor {
    
    var interactorOutput: HistoryInteractorOutput?
    var invoiceNetworkManager: InvoiceNetworkManager
    
    init(historyNetworkManager: InvoiceNetworkManager) {
        self.invoiceNetworkManager = historyNetworkManager
    }
    
    func getHistorys() {
        self.invoiceNetworkManager.getThisWeekInvoice { (data, error) in
            var invoice: [TransactionEntity] = []
            
            data?.forEach({ (result) in
                invoice.append(TransactionEntity(name: result.name, type: result.type, imageUrl: result.image, amount: result.amount, notes: result.notes))
            })
            
            self.interactorOutput?.loadedHistoryData(historys: invoice)
        }
    }
    
    func getAllTransactionHistory() {
        self.invoiceNetworkManager.getAllInvoice { (data, error) in
            var invoice: [TransactionEntity] = []
            
            data?.forEach({ (result) in
                invoice.append(TransactionEntity(name: result.name, type: result.type, imageUrl: result.image, amount: result.amount, notes: result.notes))
            })
            
            self.interactorOutput?.loadedHistoryData(historys: invoice)
        }
    }
}
