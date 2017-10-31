//
//  SinglePatientEntryTableViewCell.swift
//  Dental Account Book
//
//  Created by Apple on 10/31/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class SinglePatientEntryTableViewCell: UITableViewCell {
    
        @IBOutlet weak var dateLabel: UILabel!
        @IBOutlet weak var patientnameLabel: UILabel!
        @IBOutlet weak var opdNumberLabel: UILabel!
        @IBOutlet weak var totalInvoiceLabel: UILabel!
        @IBOutlet weak var amountPaidLabel: UILabel!
        @IBOutlet weak var datePaidLabel: UILabel!
        @IBOutlet weak var balanceLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
