//
//  ReceiverViewController.swift
//  Receiver
//
//  Created by MacBook on 27/05/21.
//

import UIKit
import Core

class ReceiverViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var contactCountLbl: UILabel!
    @IBOutlet weak var searchContactField: UITextField!
    
    var dataSource = ReceiverDataSource()
    var presenter: ReceiverPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getContactData()
        self.setupTableView()
    }

    // MARK: - Init View Component
    @IBAction func backBtn(_ sender: Any) {
        self.presenter?.showNavigateToHome(viewController: self)
    }
    
    func setupTableView() {
        self.dataSource.viewController = self
        
        self.tableView.register(UINib(nibName: "ReceiverTableViewCell", bundle: Bundle(identifier: "com.grevi.msx.Receiver")), forCellReuseIdentifier: "ReceiverTableViewCell")
        
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self.dataSource
    }

    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
}

extension ReceiverViewController: ReceiverView {
    func showData(contact: ContactEntity) {
        self.presenter?.showNavigateToTransfer(contact: contact, viewController: self)
    }
    
    func showContacts(contact: [ContactEntity]) {
        self.dataSource.contacts = contact
        self.tableView.reloadData()
    }
}
