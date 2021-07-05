//
//  AddPhoneViewController.swift
//  AddPhone
//
//  Created by MacBook on 30/05/21.
//

import UIKit
import Core

class AddPhoneViewController: UIViewController {
    @IBOutlet weak var regionCodeLbl: UILabel!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    
    var presenter: PhonePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.showUserProfile()
        // Do any additional setup after loading the view.
    }
    @IBAction func backBtn(_ sender: Any) {
        self.presenter?.showbackToProfile(viewController: self)
    }
    @IBAction func submitBtn(_ sender: Any) {
    }
    
}

extension AddPhoneViewController: PhoneView {
    func showProfile(profile: UserProfileEntity) {
        
    }
}
