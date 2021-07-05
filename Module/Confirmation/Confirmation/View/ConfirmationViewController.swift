//
//  ConfirmationViewController.swift
//  Confirmation
//
//  Created by MacBook on 28/05/21.
//

import UIKit
import Core

class ConfirmationViewController: UIViewController {
    @IBOutlet weak var receiverImage: UIImageView!
    @IBOutlet weak var receiverName: UILabel!
    @IBOutlet weak var receiverPhone: UILabel!
    @IBOutlet weak var amountLbl: UILabel!
    @IBOutlet weak var balanceLeftLbl: UILabel!
    @IBOutlet weak var dateNowLbl: UILabel!
    @IBOutlet weak var currentTimeLbl: UILabel!
    @IBOutlet weak var notesLbl: UILabel!
    @IBOutlet weak var receiverContactView: UIView!
    @IBOutlet weak var continueBtn: UIButton!
    
    var presenter: ConfirmationPresenter?
    var amount: Int = 0
    var notes: String = ""
    var balance: Int = 0
    var contact: ContactEntity = ContactEntity(id: 0, name: "", phone: "", image: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.getObject()
        // Do any additional setup after loading the view.
        
        self.receiverContactView.layer.cornerRadius = 8
        self.continueBtn.layer.cornerRadius = 8
    }
    @IBAction func continueBtn(_ sender: Any) {
        self.presenter?.continueListener(amount: amount, notes: notes, userBalance: balance, contact: contact, viewController: self)
    }
    @IBAction func backBtn(_ sender: Any) {
        self.presenter?.backToTransfer(viewController: self)
    }
    
}

extension ConfirmationViewController: ConfirmationView {
    func showContactData(contact: ContactEntity) {
        receiverImage.kf.setImage(with: URL(string: AppConstant.baseUrl+contact.image))
        receiverName.text = contact.name
        receiverPhone.text = contact.phone
        print(contact)
        
        amountLbl.text = String(amount)
        dateNowLbl.text = DateTimeHelper.shared.generateCurrentDateTime()
        currentTimeLbl.text = DateTimeHelper.shared.generateTimeNow()
        notesLbl.text = notes
        balanceLeftLbl.text = (balance - amount).formatToId()
        
        self.contact = contact
    }
}
