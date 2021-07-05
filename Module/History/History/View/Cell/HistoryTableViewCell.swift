//
//  HistoryTableViewCell.swift
//  History
//
//  Created by MacBook on 25/05/21.
//

import UIKit
import Kingfisher
import Core

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var historyImage: UIImageView!
    @IBOutlet weak var historyNameLbl: UILabel!
    @IBOutlet weak var historyNoteLbl: UILabel!
    @IBOutlet weak var historyAmountLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func showData(history: TransactionEntity) {
//        self.historyNameLbl.text = history.name
//        self.historyNoteLbl.text = history.notes
//        self.historyAmountLbl.text = String(history.amount)
//        
//        self.historyImage.kf.setImage(with: URL(string: history.imageUrl))
//    }
    
}
