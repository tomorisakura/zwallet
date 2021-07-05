//
//  HomeDataSource.swift
//  Home
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import UIKit
import Core

class HomeDataSource: NSObject, UITableViewDataSource {
    var viewController: HomeViewController!
    var userProfile: UserProfileEntity = UserProfileEntity(name: "", balance: 0, phoneNumber: "", imageUrl: "")
    var transactions: [TransactionEntity] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            return transactions.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardCell", for: indexPath) as! DashboardCell
            cell.showData(profile: self.userProfile)
            cell.delegate = self.viewController
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionTableViewCell", for: indexPath) as! TransactionTableViewCell
            cell.showData(transaction: self.transactions[indexPath.row])
            return cell
        }
    }
}
