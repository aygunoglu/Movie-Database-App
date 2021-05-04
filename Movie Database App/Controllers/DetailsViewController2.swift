//
//  DetailsViewController.swift
//  Movie Database App
//
//  Created by Hasan Aygünoglu on 4.05.2021.
//

import UIKit

class DetailsViewController2: UIViewController {
    
    var getTitle = String()
    var getReleaseDate = String()
    var getOverview = String()
    var getGenre = [Int]()
    var getThumb = String()
    var getRating = Float()
    
    @IBOutlet weak var detailsThumb: UIImageView!
    @IBOutlet weak var detailsTitle: UILabel!
    @IBOutlet weak var detailsGenre: UILabel!
    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var detailsReleaseDate: UILabel!
    @IBOutlet weak var overview: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        //self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //self.tabBarController?.tabBar.isHidden = false
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
        
        
        ratingView.layer.cornerRadius = 12

        detailsTitle.text = getTitle
        ratingLabel.text = String(getRating)
        overview.text = getOverview
        detailsReleaseDate.text = String(getReleaseDate.prefix(4))

        let url = URL(string: "https://image.tmdb.org/t/p/w500\(getThumb)")
        detailsThumb.kf.setImage(with: url)

        var count = 0
        var genreList: [String] = []

        for id in getGenre {
            genreList.append(movieGenres[id]!)
            count += 1
            if count == 2 {
                break
            }
        }

        self.detailsGenre.text! = genreList.joined(separator: ", ")
        
        // Do any additional setup after loading the view.
    }
    
}



