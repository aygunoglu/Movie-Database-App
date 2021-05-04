//
//  SeriesCell.swift
//  Movie Database App
//
//  Created by Hasan Aygünoglu on 3.05.2021.
//

import UIKit

class SeriesCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = 15.0
        self.layer.borderWidth = 5.0
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.masksToBounds = true
        

    }

}
