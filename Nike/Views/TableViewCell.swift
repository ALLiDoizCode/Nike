//
//  TableViewCell.swift
//  Nike
//
//  Created by Jonathan Green on 11/15/19.
//  Copyright © 2019 Jonathan Green. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var artist: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
