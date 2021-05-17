//
//  DetailsCell.swift
//  Movie Database App
//
//  Created by Hasan Aygünoglu on 16.05.2021.
//

import UIKit

class DetailsCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ratingView.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureGenre(with model: [Int]) {
        self.genreLabel.text = ""
        
        var count = 0
        var genreList: [String] = []
        
        for id in model {
            genreList.append(movieGenres[id]!)
            count += 1
            if count == 3 {
                break
            }
        }
        
        self.genreLabel.text! = genreList.joined(separator: ", ")
    }
}
