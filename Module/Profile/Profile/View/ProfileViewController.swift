//
//  ProfileViewController.swift
//  Profile
//
//  Created by MacBook on 30/05/21.
//

import UIKit
import Core

class ProfileViewController: UIViewController {
    @IBOutlet weak var profileNameLbl: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profilePhone: UILabel!
    
    var presenter: ProfilePresenter?
    var profile: UserProfileEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadProfile()
        // Do any additional setup after loading the view.
    }
    @IBAction func logout(_ sender: Any) {
        
    }
    @IBAction func backBtn(_ sender: Any) {
        self.presenter?.backToHome(viewController: self)
    }
    @IBAction func editProfileBtn(_ sender: Any) {
        if let profile = self.profile {
            self.presenter?.showAddPhone(viewController: self, profile: profile)
        }
    }
    
}

extension ProfileViewController: ProfileView {
    func showProfile(profile: UserProfileEntity) {
        self.profileImageView.kf.setImage(with: URL(string: AppConstant.baseUrl+profile.imageUrl))
        self.profileNameLbl.text = profile.name
        self.profilePhone.text = profile.phoneNumber
        self.profile = profile
    }
}
