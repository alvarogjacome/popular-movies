//
//  DetailScreenViewModel.swift
//  Popular Movies
//
//  Created by Álvaro Gutiérrez Jácome on 02/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import Combine
import SwiftUI

class DetailScreenViewModel: ObservableObject {
    @Published private(set) var movie: Movie?
    @Published private(set) var state: LoadingState = .loading
    @Published private(set) var error: CustomError? = nil

    private let popularMovie: PopularMovie

    init(wid movie: PopularMovie) {
        self.popularMovie = movie
    }

    func getMovieDetails() -> Movie {
        return movie!
    }

    func fetchMovieDetails() {
        NetworkManager.shared.fetchMovieDetails(with: popularMovie.id) { [unowned self] (response: Result<Movie, CustomError>) in
            DispatchQueue.main.async {
                switch response {
                    case .success(let movie):
                        self.movie = movie
                        self.state = .loaded
                    case .failure(let error):
                        self.error = error
                        self.state = .error
                }
            }
        }
    }

    func getPopularMovie() -> PopularMovie {
        popularMovie
    }
}
