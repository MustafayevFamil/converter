//
//  MenyuCell.swift
//  convertor
//
//  Created by Famil Mustafayev on 5.12.2020.
//  Copyright © 2020 Famil Mustafayev. All rights reserved.
//

import UIKit

class MenyuCell: UITableViewCell {

    @IBOutlet weak var menyuImage: UIImageView!
    @IBOutlet weak var menyuManat: UILabel!
    @IBOutlet weak var menyuAzn: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
