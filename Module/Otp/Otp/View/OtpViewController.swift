//
//  OtpViewController.swift
//  Otp
//
//  Created by MacBook on 26/05/21.
//

import UIKit
import Core

class OtpViewController: UIViewController {

    @IBOutlet weak var fieldOtpOne: UITextField!
    @IBOutlet weak var fieldOtpTwo: UITextField!
    @IBOutlet weak var fieldOtpThree: UITextField!
    @IBOutlet weak var fieldOtpFour: UITextField!
    @IBOutlet weak var fieldOtpFive: UITextField!
    @IBOutlet weak var fieldOtpSix: UITextField!
    
    var presenter: OtpPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - Navigation
    @IBAction func confirmBtn(_ sender: Any) {
        let numOne = fieldOtpOne.text ?? ""
        let numTwo = fieldOtpTwo.text ?? ""
        let numThree = fieldOtpThree.text ?? ""
        let numFour = fieldOtpFour.text ?? ""
        let numFive = fieldOtpFive.text ?? ""
        let numSix = fieldOtpSix.text ?? ""
        
        let combine = numOne+numTwo+numThree+numFour+numFive+numSix
        let emailShared = presenter?.getEmail()
        
        if let email = emailShared {
            print(combine)
            presenter?.otp(email: email, code: combine)
        }
    }
    
}

extension OtpViewController: OtpView {
    func showSuccess(message: String) {
        let alert = UIAlertController(title: "Berhasil", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (alert) in
            self.presenter?.showLogin()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showError() {
        func showError() {
            let alert = UIAlertController(title: "Peringatan", message: "Kode OTP tidak valid", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
