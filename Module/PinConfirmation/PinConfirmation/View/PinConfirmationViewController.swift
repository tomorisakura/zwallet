//
//  PinConfirmationViewController.swift
//  PinConfirmation
//
//  Created by MacBook on 29/05/21.
//

import UIKit
import Core

class PinConfirmationViewController: UIViewController {
    @IBOutlet weak var pinFieldOne: UITextField!
    @IBOutlet weak var pinFieldTwo: UITextField!
    @IBOutlet weak var pinFieldThree: UITextField!
    @IBOutlet weak var pinFieldFour: UITextField!
    @IBOutlet weak var pinFieldFive: UITextField!
    @IBOutlet weak var pinFieldSix: UITextField!
    @IBOutlet weak var transferBtn: UIButton!
    
    var presenter: PinConfirmationPresenter?
    var contact: ContactEntity = ContactEntity(id: 0, name: "", phone: "", image: "")
    var amount: Int = 0
    var notes: String = ""
    var currentBalance: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Get: \(contact)")
        // Do any additional setup after loading the view.
    }
    @IBAction func transferBtn(_ sender: Any) {
        let numOne = pinFieldOne.text ?? ""
        let numTwo = pinFieldTwo.text ?? ""
        let numThree = pinFieldThree.text ?? ""
        let numFour = pinFieldFour.text ?? ""
        let numFive = pinFieldFive.text ?? ""
        let numSix = pinFieldSix.text ?? ""
        
        let pin = numOne+numTwo+numThree+numFour+numFive+numSix
        self.presenter?.checkUserPin(pin: pin)
    }
    @IBAction func backBtn(_ sender: Any) {
        self.presenter?.backToDetailConfirmation(viewController: self)
    }
    
}

extension PinConfirmationViewController: PinConfirmationView {
    func showError(message: String) {
        let alert = UIAlertController(title: "Gagal", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (alert) in
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}
