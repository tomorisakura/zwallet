//
//  HistoryDataSource.swift
//  History
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import UIKit
import Core

class HistoryDataSource: NSObject, UITableViewDataSource {
    var viewController: HistoryViewController!
    var transactions: [TransactionEntity] = []
    
    var transactionHeader: [String] = ["This Week", "This Month"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return transactions.count
        } else {
            return transactions.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionTableViewCell", for: indexPath) as! TransactionTableViewCell
            cell.showData(transaction: self.transactions[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionTableViewCell", for: indexPath) as! TransactionTableViewCell
            cell.showData(transaction: self.transactions[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return transactionHeader[section]
    }
}
