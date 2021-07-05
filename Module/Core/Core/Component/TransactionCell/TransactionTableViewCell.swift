//
//  TransactionTableViewCell.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import UIKit
import Kingfisher

public class TransactionTableViewCell: UITableViewCell {

    @IBOutlet weak var userPicture: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var noteLbl: UILabel!
    @IBOutlet weak var amountLbl: UILabel!
    
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func showData(transaction: TransactionEntity) {
        self.nameLbl.text = transaction.name
        self.noteLbl.text = transaction.notes
        
        if transaction.type == "in" {
            self.amountLbl.text = "+\(transaction.amount.formatToId())"
            self.amountLbl.textColor = .green
        }else {
            self.amountLbl.text = "-\(transaction.amount.formatToId())"
            self.amountLbl.textColor = .red
        }
        let imageUrl = AppConstant.baseUrl+transaction.imageUrl
        let url = URL(string: imageUrl)
        self.userPicture.kf.setImage(with: url)
    }
    
}
