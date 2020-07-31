//
//  Movie.swift
//  Popular Movies
//
//  Created by Álvaro Gutiérrez Jácome on 31/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import Foundation

struct Movie {
    let adult: Bool
    let budget: Int
    let genres: [Genre]
    let homepage: String
    let id: Int
    let imdbID: String
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let releaseDate: String
    let revenue, runtime: Int
    let status: String
    let tagline: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
}
