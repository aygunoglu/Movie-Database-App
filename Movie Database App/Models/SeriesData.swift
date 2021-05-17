//
//  SeriesData.swift
//  Movie Database App
//
//  Created by Hasan Aygünoglu on 4.05.2021.
//

import Foundation

struct SeriesData: Codable {
    let results: [Series]
}

struct Series: Codable {
    let genreIDs: [Int]
    let id: Int
    let overview: String
    let releaseDate: String
    let title: String
    let rating: Float
    let posterURL: String
    let backdropURL: String
    
    enum CodingKeys: String, CodingKey {
        case genreIDs = "genre_ids"
        case id
        case overview
        case title = "name"
        case releaseDate = "first_air_date"
        case rating = "vote_average"
        case posterURL = "poster_path"
        case backdropURL = "backdrop_path"
    }
}
