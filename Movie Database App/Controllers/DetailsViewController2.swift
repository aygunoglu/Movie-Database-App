//
//  DetailsViewController.swift
//  Movie Database App
//
//  Created by Hasan Aygünoglu on 4.05.2021.
//

import UIKit
import Kingfisher

class DetailsViewController2: UIViewController {
    
    var getMovie = Movie(genreIDs: [Int](), id: Int(), overview: String(), releaseDate: String(), title: String(), rating: Float(), posterURL: String(), backdropURL: String())
    var getSeries = Series(genreIDs: [Int](), id: Int(), overview: String(), releaseDate: String(), title: String(), rating: Float(), posterURL: String())
    
    @IBOutlet weak var detailsTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController!.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController!.navigationBar.shadowImage = nil
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
        
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height / 2))
        let imageView = UIImageView()
        let url = URL(string: "https://image.tmdb.org/t/p/original\(getMovie.backdropURL)")
        imageView.kf.setImage(with: url)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        header.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: header.frame.size.width, height: header.frame.size.height)
        detailsTableView.tableHeaderView = header
        
        detailsTableView.dataSource = self
        detailsTableView.delegate = self
        detailsTableView.register(UINib(nibName: "DetailsCell", bundle: nil), forCellReuseIdentifier: "DetailsCell")
        detailsTableView.register(UINib(nibName: "DescriptionCell", bundle: nil), forCellReuseIdentifier: "DescriptionCell")
        
//        ratingView.layer.cornerRadius = 12
//
//        detailsTitle.text = getTitle
//        ratingLabel.text = String(getRating)
//        overview.text = getOverview
//        detailsReleaseDate.text = String(getReleaseDate.prefix(4))
//
//        let url = URL(string: "https://image.tmdb.org/t/p/w500\(getThumb)")
//        detailsThumb.kf.setImage(with: url)
//
//        var count = 0
//        var genreList: [String] = []
//
//        for id in getGenre {
//            genreList.append(movieGenres[id]!)
//            count += 1
//            if count == 2 {
//                break
//            }
//        }
//
//        self.detailsGenre.text! = genreList.joined(separator: ", ")
        
        // Do any additional setup after loading the view.
    }
    
}

extension DetailsViewController2: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0.0, y: 0.0, width: view.frame.size.width, height: 50.0))

        let titleLabel = UILabel(frame: CGRect(x: 10.0, y: 0.0, width: view.frame.size.width, height: 50.0))
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        titleLabel.text = "Description"
        header.addSubview(titleLabel)
        if section == 1 {
            return header
        }else{
            return nil
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 50
        }else{
            return 0
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let detailsCell = tableView.dequeueReusableCell(withIdentifier: "DetailsCell", for: indexPath) as! DetailsCell
        let descriptionCell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCell", for: indexPath) as! DescriptionCell
        if indexPath.section == 0 {
            detailsCell.configure(with: getMovie)
            return detailsCell
        }else {
            return descriptionCell
        }
    }
    
}



