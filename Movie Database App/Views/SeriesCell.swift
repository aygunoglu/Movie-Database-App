//
//  SeriesCell.swift
//  Movie Database App
//
//  Created by Hasan Aygünoglu on 3.05.2021.
//

import UIKit

class SeriesCell: UICollectionViewCell {
    @IBOutlet weak var seriesPoster: UIImageView!
    @IBOutlet weak var seriesTitle: UILabel!
    @IBOutlet weak var seriesRating: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = 15.0
        self.layer.borderWidth = 5.0
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.masksToBounds = true
        
        seriesPoster.layer.cornerRadius = 15

    }
    
    func configure(with model: Series) {
        self.seriesTitle.text = model.name
        self.seriesRating.text = String(model.rating)
        
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(model.posterURL)")
        seriesPoster.kf.setImage(with: url)
        
    }

}
