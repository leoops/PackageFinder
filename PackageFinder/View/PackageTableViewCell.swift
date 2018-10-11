//
//  ObjectTableViewCell.swift
//  PackageFinder
//
//  Created by Stefanini on 10/10/18.
//  Copyright © 2018 Stefanini. All rights reserved.
//

import UIKit

class PackageTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var localLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
