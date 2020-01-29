//
//  MenuTableViewCell.swift
//  Lesson10Task1
//
//  Created by Михаил Беленко on 24.01.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var menuItemIcon: UIImageView!
    @IBOutlet weak var menuItemName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
