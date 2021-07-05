//
//  ReceiverDataSource.swift
//  Receiver
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import UIKit
import Core

class ReceiverDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    var viewController: ReceiverViewController!
    var contacts: [ContactEntity] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiverTableViewCell", for: indexPath) as! ReceiverTableViewCell
        cell.showData(contact: contacts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewController.showData(contact: contacts[indexPath.row])
    }
    
}
