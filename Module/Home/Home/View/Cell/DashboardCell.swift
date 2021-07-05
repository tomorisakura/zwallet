//
//  DashboardCell.swift
//  Home
//
//  Created by MacBook on 25/05/21.
//

import UIKit
import Kingfisher
import Core

class DashboardCell: UITableViewCell {
    @IBOutlet weak var profileNameLbl: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileBalanceLbl: UILabel!
    @IBOutlet weak var phoneNumberLbl: UILabel!
    @IBOutlet weak var balanceView: UIView!
    
    @IBOutlet weak var transferView: UIView!
    @IBOutlet weak var topupView: UIView!
    
    var delegate: DashboardCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.balanceView.layer.cornerRadius = 10
        self.transferView.layer.cornerRadius = 8
        self.topupView.layer.cornerRadius = 8
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            profileImage.isUserInteractionEnabled = true
            profileImage.addGestureRecognizer(tapGestureRecognizer)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func logoutBtn(_ sender: Any) {
        self.delegate?.logout()
    }
    @IBAction func seeAllBtn(_ sender: Any) {
        self.delegate?.showAllTransaction()
    }
    @IBAction func transferBtn(_ sender: Any) {
        self.delegate?.transfer()
    }
    @IBAction func topupBtn(_ sender: Any) {
        
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        self.delegate?.showToProfile()
    }
    
    func showData(profile: UserProfileEntity) {
        self.profileNameLbl.text = profile.name
        self.profileBalanceLbl.text = profile.balance.formatToId()
        self.phoneNumberLbl.text = profile.phoneNumber
        let url = URL(string: AppConstant.baseUrl+profile.imageUrl)
        self.profileImage.kf.setImage(with: url)
    }
    
}
