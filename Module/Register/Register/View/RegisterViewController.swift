//
//  RegisterViewController.swift
//  Register
//
//  Created by MacBook on 26/05/21.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var presenter: RegisterPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signupBtn(_ sender: Any) {
        let username = usernameField.text ?? ""
        let email = emailField.text ?? ""
        let password = passwordField.text ?? ""
        
        presenter?.register(username: username, email: email, password: password)
    }
    // MARK: - Navigation

    @IBAction func loginBtn(_ sender: Any) {
        presenter?.showLogin()
    }
}

extension RegisterViewController: RegisterView {
    func showError() {
        let alert = UIAlertController(title: "Peringatan", message: "Terjadi kesalahan saat registrasi, coba lagi", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
