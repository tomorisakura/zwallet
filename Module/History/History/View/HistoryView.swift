//
//  HistoryView.swift
//  History
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import Core

protocol HistoryView {
    func showThisWeekHistory(transactions: [TransactionEntity])
}
