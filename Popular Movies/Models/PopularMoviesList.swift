//
//  PopularMoviesList.swift
//  Popular Movies
//
//  Created by Álvaro Gutiérrez Jácome on 31/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import Foundation

struct PopularMoviesList: Decodable {
    let page: Int
    let results: [PopularMovie]
    let totalPages: Int
    let totalResults: Int
}
