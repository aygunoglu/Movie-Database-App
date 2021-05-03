//
//  MovieCell.swift
//  Movie Database App
//
//  Created by Hasan Aygünoglu on 1.05.2021.
//

import UIKit

struct MovieData: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let genreIDs: [Int]
    let id: Int
    let overview: String
    let releaseDate: String
    let title: String
    let rating: Float
    let posterURL: String
    
    enum CodingKeys: String, CodingKey {
        case genreIDs = "genre_ids"
        case id
        case overview
        case title
        case releaseDate = "release_date"
        case rating = "vote_average"
        case posterURL = "poster_path"
    }
}

