//
//  HomeViewController.swift
//  Home
//
//  Created by MacBook on 25/05/21.
//

import UIKit
import Core

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dataSource = HomeDataSource()
    
    var presenter: HomePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.presenter?.loadProfile()
        self.presenter?.loadTransaction()
        self.setupTableView()
    }

    // MARK: - Navigation
    func setupTableView() {
        self.dataSource.viewController = self
        
        self.tableView.register(UINib(nibName: "DashboardCell", bundle: Bundle(identifier: "com.grevi.msx.Home")), forCellReuseIdentifier: "DashboardCell")
        self.tableView.register(UINib(nibName: "TransactionTableViewCell", bundle: Bundle(identifier: "com.grevi.msx.Core")), forCellReuseIdentifier: "TransactionTableViewCell")
        
        self.tableView.dataSource = self.dataSource
    }

}

extension HomeViewController: DashboardCellDelegate {
    func showToProfile() {
        self.presenter?.showProfile(viewContoller: self)
    }
    
    func transfer() {
        self.presenter?.showReceiver(viewController: self)
    }
    
    func showAllTransaction() {
        self.presenter?.showHistory(viewController: self)
    }
    
    func logout() {
        self.presenter?.logout()
    }
}

extension HomeViewController: HomeView {
    func showUserprofileData(userProfile: UserProfileEntity) {
        self.dataSource.userProfile = userProfile
        self.tableView.reloadData()
    }
    
    func showTransactionData(transactions: [TransactionEntity]) {
        self.dataSource.transactions = transactions
        self.tableView.reloadData()
    }
}
