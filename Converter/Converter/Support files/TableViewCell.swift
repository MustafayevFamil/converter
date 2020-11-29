//
//  TableViewCell.swift
//  Converter
//
//  Created by Famil Mustafayev on 28.11.2020.
//  Copyright © 2020 Famil Mustafayev. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var flagContry: UIImageView!
    
    @IBOutlet weak var smallWritingContryMoney: UILabel!
    @IBOutlet weak var countryMoneyName: UILabel!
    @IBOutlet weak var converterLabel: UILabel!
    
    @IBOutlet weak var yearMountDayLabel: UILabel!
    @IBOutlet weak var replacementConverter: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func xButton(_ sender: Any) {
    }
    
}
