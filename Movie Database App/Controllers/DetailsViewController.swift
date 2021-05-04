//
//  DetailsViewController.swift
//  Movie Database App
//
//  Created by Hasan Aygünoglu on 4.05.2021.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var getTitle = String()
    var getReleaseDate = String()
    var getOverview = String()
    var getGenre = String()
    var getThumb = UIImage()
    
    @IBOutlet weak var detailsThumb: UIImageView!
    @IBOutlet weak var detailsTitle: UILabel!
    @IBOutlet weak var detailsGenre: UILabel!
    @IBOutlet weak var detailsReleaseDate: UILabel!
    @IBOutlet weak var overview: UILabel!
    @IBOutlet weak var ratingView: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ratingView.layer.cornerRadius = 15
        
        
//        let navBarAppearance = UINavigationBarAppearance()
//        navBarAppearance.configureWithTransparentBackground()
//        navBarAppearance.backgroundColor = UIColor.clear
//
//        UINavigationBar.appearance().standardAppearance = navBarAppearance
//        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController!.navigationBar.shadowImage = UIImage()
//        self.navigationController!.navigationBar.isTranslucent = true
//        self.navigationController?.setStatusBar(backgroundColor: UIColor.clear)
        

        
        detailsTitle.text = getTitle
        
        // Do any additional setup after loading the view.
    }
    
}

extension UINavigationController {

    func setStatusBar(backgroundColor: UIColor) {
        let statusBarFrame: CGRect
        if #available(iOS 13.0, *) {
            statusBarFrame = view.window?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
        } else {
            statusBarFrame = UIApplication.shared.statusBarFrame
        }
        let statusBarView = UIView(frame: statusBarFrame)
        statusBarView.backgroundColor = backgroundColor
        view.addSubview(statusBarView)
    }

}


