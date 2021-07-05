//
//  SuccessTransferViewController.swift
//  SuccessTransfer
//
//  Created by MacBook on 29/05/21.
//

import UIKit
import Core

class SuccessTransferViewController: UIViewController {

    @IBOutlet weak var successBtn: UIButton!
    @IBOutlet weak var stateImageView: UIImageView!
    @IBOutlet weak var stateTransferLbl: UILabel!
    @IBOutlet weak var errorMessageLbl: UILabel!
    @IBOutlet weak var amountLbl: UILabel!
    @IBOutlet weak var balanceLeftLbl: UILabel!
    @IBOutlet weak var currentDateTimeLbl: UILabel!
    @IBOutlet weak var notesLbl: UILabel!
    
    @IBOutlet weak var receiverName: UILabel!
    @IBOutlet weak var receiverPhone: UILabel!
    @IBOutlet weak var receiverImageView: UIImageView!
    
    var presenter: SuccessTransferPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.showtransferData()
        // Do any additional setup after loading the view.
        self.successBtn.layer.cornerRadius = 8
    }
    @IBAction func successBtn(_ sender: Any) {
        self.presenter?.continueToHome()
    }
    
}

extension SuccessTransferViewController: SuccessTransferView {
    func showData(transfer: DetailTransferEntity, contact: ContactEntity) {
        amountLbl.text = transfer.amount.formatToId()
        balanceLeftLbl.text = transfer.balance.formatToId()
        currentDateTimeLbl.text = transfer.dateTime
        notesLbl.text = transfer.notes
        
        receiverName.text = contact.name
        receiverPhone.text = contact.phone
        receiverImageView.kf.setImage(with: URL(string: AppConstant.baseUrl+contact.image))
    }
}
