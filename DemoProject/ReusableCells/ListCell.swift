//
//  ListCell.swift
//  DemoProject
//
//  Created by sowmya P on 12/09/21.
//

import UIKit

class ListCell: UITableViewCell {

    @IBOutlet weak var listText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
