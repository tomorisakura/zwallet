//
//  HistoryViewController.swift
//  History
//
//  Created by MacBook on 25/05/21.
//

import UIKit
import Core

class HistoryViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource = HistoryDataSource()
    
    var presenter: HistoryPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.presenter?.loadThisWeekHistory()
        self.setupTableView()
    }

    @IBAction func backBtn(_ sender: Any) {
        presenter?.showHome(viewController: self)
    }
    // MARK: - Navigation
    func setupTableView() {
        self.dataSource.viewController = self
        
        self.tableView.register(UINib(nibName: "TransactionTableViewCell", bundle: Bundle(identifier: "com.grevi.msx.Core")), forCellReuseIdentifier: "TransactionTableViewCell")
        
        self.tableView.dataSource = self.dataSource
    }
    
}

extension HistoryViewController: HistoryView {
    
    func showThisWeekHistory(transactions: [TransactionEntity]) {
        self.dataSource.transactions = transactions
        self.tableView.reloadData()
    }
}
