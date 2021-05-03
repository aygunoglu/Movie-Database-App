//
//  MovieCell.swift
//  Movie Database App
//
//  Created by Hasan Aygünoglu on 1.05.2021.
//

import UIKit
import Kingfisher


class MovieCell: UITableViewCell {
    @IBOutlet weak var movieBubble: UIView!
    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        movieBubble.layer.cornerRadius = movieBubble.frame.size.height / 10
        thumbImage.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func modify(with model: Movie) {
        self.titleLabel.text = model.title
        self.releaseLabel.text = String(model.releaseDate.prefix(4))
        self.ratingLabel.text = String(model.rating)
        self.genreLabel.text = ""
        
        var count = 0
        var genreList: [String] = []
        
        for id in model.genreIDs {
            genreList.append(movieGenres[id]!)
            count += 1
            if count == 3 {
                break
            }
        }
        
        self.genreLabel.text! = genreList.joined(separator: ", ")
        
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(model.posterURL)")
        thumbImage.kf.setImage(with: url)
        
    }
    
}
