//
//  PopularMovieListViewModel.swift
//  Popular Movies
//
//  Created by Álvaro Gutiérrez Jácome on 02/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import Foundation

import Combine
import SwiftUI

class PopularMovieListViewModel: ObservableObject {
    @Published private(set) var movies: [PopularMovie]?
    @Published private(set) var state: LoadingState = .loading
    @Published private(set) var error: CustomError? = nil
    @Published var search: String = ""

    init() {
        fetchMovieDetails()
    }

    private func fetchMovieDetails() {
        NetworkManager.shared.fetchPopularMovies { (response: Result<[PopularMovie], CustomError>) in
            DispatchQueue.main.async {
                switch response {
                    case .success(let movies):
                        PersistenceManager.updateWith(movies: movies)
                        self.movies = movies
                        self.state = .loaded
                    case .failure(let error):
                        self.fetchLocalStoredMovies(error: error)
                }
            }
        }
    }

    private func fetchLocalStoredMovies(error: CustomError) {
        PersistenceManager.retrievePopuplarMovies { (response: Result<[PopularMovie], CustomError>) in
            switch response {
                case .success(let movies):
                    self.movies = movies
                    self.state = .error
                    self.error = CustomError.loadedFromStorage
                case .failure:
                    self.error = error
                    self.state = .error
            }
        }
    }

    func getMovies() -> [PopularMovie]? {
        return movies?.filter {
            $0.title.lowercased().contains(self.search.lowercased()) || self.search.isEmpty
        }
    }

    func reorderButtonAction() {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
        movies?.reverse()
    }

    func errorButtonAction() {
        if error == .loadedFromStorage {
            state = .loaded
            error = nil
        } else {
            fatalError()
        }
    }
}
