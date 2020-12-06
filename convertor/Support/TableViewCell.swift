//
//  TableViewCell.swift
//  convertor
//
//  Created by Famil Mustafayev on 5.12.2020.
//  Copyright © 2020 Famil Mustafayev. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var aznLabel: UILabel!
    @IBOutlet weak var manat: UILabel!
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var dayMounthYearMenbe: UILabel!
    @IBOutlet weak var oneUSDEquealOneAZN: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func removeTextFieldText(_ sender: Any) {
        textField.placeholder = "0"
        textField.text = ""

    }
    
}
