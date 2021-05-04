//
//  ViewController.swift
//  Movie Database App
//
//  Created by Hasan Aygünoglu on 30.04.2021.
//

import UIKit


class MoviesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies = [Movie]()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
        fetchData()
        

    }
    
    func fetchData() {

            URLSession.shared.dataTask(with: URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=63bdf0b8f2c61420c0a701743558b1bd&language=en-US&page=1")!,
                                   completionHandler: { data, response, error in
                                    
                                    guard let data = data, error == nil else {
                                        return
                                    }
                                    // Convert
                                    var result: MovieData?
                                    do {
                                        result = try JSONDecoder().decode(MovieData.self, from: data)
                                    }
                                    catch {
                                        print("error")
                                    }
                                    
                                    guard let finalResult = result else {
                                        return
                                    }
                                    // Update our movies array
                                    let newMovies = finalResult.results
                                    self.movies.append(contentsOf: newMovies)
                                    
                                    // Refresh our table
                                    DispatchQueue.main.async {
                                        self.tableView.reloadData()
                                    }
                                    
                                   }).resume()
        }

}

extension MoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! MovieCell
        cell.configure(with: movies[indexPath.row])
        
        return cell
    }
    
    
}

extension MoviesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

