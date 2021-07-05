//
//  LoginViewController.swift
//  Login
//
//  Created by MacBook on 24/05/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var passwordField: UITextField!
    
    var presenter : LoginPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
    }

    // MARK: - Navigation
    @IBAction func loginBtn(_ sender: Any) {
        let email: String = emailField.text ?? ""
        let password : String = passwordField.text ?? ""
        
        self.presenter?.login(email: email, password: password)
    }
    @IBAction func SIgnUpBtn(_ sender: Any) {
        self.presenter?.showRegister()
    }
    
    private func initView() {
        loginBtn.layer.cornerRadius = 10
    }
    
}

extension LoginViewController: LoginView {
    func showError() {
        let alert = UIAlertController(title: "Peringatan", message: "username atau password salah, silahkan coba lagi", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
