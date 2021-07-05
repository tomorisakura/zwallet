//
//  TransferViewController.swift
//  Transfer
//
//  Created by MacBook on 28/05/21.
//

import UIKit
import Core
import Kingfisher

class TransferViewController: UIViewController {
    
    @IBOutlet weak var receiverName: UILabel!
    @IBOutlet weak var receiverPhone: UILabel!
    @IBOutlet weak var receiverImage: UIImageView!
    @IBOutlet weak var receiverView: UIView!
    @IBOutlet weak var receiverAmount: UITextField!
    @IBOutlet weak var currentBalance: UILabel!
    @IBOutlet weak var receiverNote: UITextField!
    @IBOutlet weak var transferBtn: UIButton!
    @IBOutlet weak var amountField: UITextField!
    
    var presenter: TransferPresenter?
    var contact: ContactEntity?
    var userBalance: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getContactData()
        presenter?.loadProfile()
        // Do any additional setup after loading the view.
        self.transferBtn.layer.cornerRadius = 8
    }
    @IBAction func backBtn(_ sender: Any) {
        presenter?.backToReceiver(viewController: self)
    }
    @IBAction func transferBtn(_ sender: Any) {
        let amount = receiverAmount.text ?? ""
        let notes = receiverNote.text ?? ""
        
        //create handler if notes null button disable
        if let contact = self.contact {
            print(contact)
            if let balance = self.userBalance {
                self.presenter?.navigateToTransferDetail(viewController: self, amount: amount, notes: notes, userBalance: balance, contact: contact)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

extension TransferViewController: TransferView {
    func initProfileBalance(profile: UserProfileEntity) {
        currentBalance.text = profile.balance.formatToId()+" Available"
        userBalance = profile.balance
    }
    
    func initContactData(contact: ContactEntity) {
        //init contact to label
        self.receiverName.text = contact.name
        self.receiverPhone.text = contact.phone
        self.receiverImage.kf.setImage(with: URL(string: AppConstant.baseUrl+contact.image))
        self.receiverView.layer.cornerRadius = 8
        self.contact = contact
    }
    
    func showError() {
        print("err")
    }

}
