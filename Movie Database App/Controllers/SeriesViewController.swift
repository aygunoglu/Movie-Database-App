//
//  SeriesViewController.swift
//  Movie Database App
//
//  Created by Hasan Aygünoglu on 1.05.2021.
//

import UIKit

class SeriesViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var series = [Series]()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "SeriesCell", bundle: nil), forCellWithReuseIdentifier: "SeriesCell")
        
        fetchData()
    }
    
    override func viewDidLayoutSubviews() {
        
    }
    
    func fetchData() {

            URLSession.shared.dataTask(with: URL(string: "https://api.themoviedb.org/3/tv/popular?api_key=63bdf0b8f2c61420c0a701743558b1bd&language=en-US&page=1")!,
                                   completionHandler: { data, response, error in
                                    
                                    guard let data = data, error == nil else {
                                        return
                                    }
                                    // Convert
                                    var result: SeriesData?
                                    do {
                                        result = try JSONDecoder().decode(SeriesData.self, from: data)
                                    }
                                    catch {
                                        print("error")
                                    }
                                    
                                    guard let finalResult = result else {
                                        return
                                    }
                                    // Update our movies array
                                    let newSeries = finalResult.results
                                    self.series.append(contentsOf: newSeries)
                                    
                                    // Refresh our table
                                    DispatchQueue.main.async {
                                        self.collectionView.reloadData()
                                    }
                                    
                                   }).resume()
        }



}

extension SeriesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return series.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeriesCell", for: indexPath) as! SeriesCell
        
        cell.configure(with: series[indexPath.row])
        //cell.modify(with: movies[indexPath.row])
        return cell
    }
}

extension SeriesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}

extension SeriesViewController: UICollectionViewDelegateFlowLayout {
    
    
    
}
