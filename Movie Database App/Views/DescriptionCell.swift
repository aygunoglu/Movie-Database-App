//
//  DescriptionCell.swift
//  Movie Database App
//
//  Created by Hasan Aygünoglu on 16.05.2021.
//

import UIKit

class DescriptionCell: UITableViewCell {
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
