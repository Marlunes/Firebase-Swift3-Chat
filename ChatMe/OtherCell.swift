//
//  OtherCell.swift
//  ChatMe
//
//  Created by Marlon Boncodin on 18/02/2017.
//  Copyright © 2017 Marlon Boncodin. All rights reserved.
//

import UIKit

class OtherCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
