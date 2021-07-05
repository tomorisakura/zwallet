//
//  ReceiverTableViewCell.swift
//  Receiver
//
//  Created by MacBook on 27/05/21.
//

import UIKit
import Core
import Kingfisher

class ReceiverTableViewCell: UITableViewCell {
    
    @IBOutlet weak var receiverName: UILabel!
    @IBOutlet weak var receiverImage: UIImageView!
    @IBOutlet weak var receiverPhone: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    private func initView() {
        receiverImage.layer.cornerRadius = 5
    }
    
    func showData(contact: ContactEntity) {
        let url = URL(string: AppConstant.baseUrl+contact.image)
        
        self.receiverName.text = contact.name
        self.receiverPhone.text = contact.phone
        self.receiverImage.kf.setImage(with: url)
    }
    
}
