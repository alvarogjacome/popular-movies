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
    @Published var canLoadMoreMovies: Bool = false

    private var currentPage = 1
    private let maxPage = 10

    init() {
        fetchPopularMovies()
    }

    private func fetchPopularMovies() {
        NetworkManager.shared.fetchPopularMovies { [unowned self] (response: Result<[PopularMovie], CustomError>) in
            DispatchQueue.main.async {
                switch response {
                    case .success(let movies):
                        self.movies = movies
                        self.canLoadMoreMovies = self.canLoadMorePages()
                        self.state = .loaded
                        PersistenceManager.updateWith(movies: self.movies!)
                    case .failure(let error):
                        self.fetchLocalStoredMovies(error: error)
                }
            }
        }
    }

    func fetchMorePopularMovies() {
        DispatchQueue.main.async {
            if self.canLoadMorePages() {
                self.currentPage += 1
                self.state = .loading
                NetworkManager.shared.fetchPopularMovies(with: self.currentPage) { [unowned self] (response: Result<[PopularMovie], CustomError>) in
                    DispatchQueue.main.async {
                        switch response {
                            case .success(let movies):
                                self.movies?.append(contentsOf: movies)
                                self.canLoadMoreMovies = self.canLoadMorePages()
                                self.state = .loaded
                                PersistenceManager.updateWith(movies: self.movies!)
                            case .failure(let error):
                                self.error = error
                                self.canLoadMoreMovies = false
                                self.state = .error
                        }
                    }
                }
            }
        }
    }

    private func canLoadMorePages() -> Bool {
        return currentPage < maxPage
    }

    private func fetchLocalStoredMovies(error: CustomError) {
        PersistenceManager.retrievePopuplarMovies { [unowned self] (response: Result<[PopularMovie], CustomError>) in
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

    private func sortedByPopularity(_ movies: [PopularMovie]) -> [PopularMovie] {
        movies.sorted(by: {
            $0.popularity > $1.popularity
        })
    }

    func getMovies() -> [PopularMovie]? {
        return movies?.filter {
            $0.title.lowercased().contains(self.search.lowercased()) || self.search.isEmpty
        }
    }

    func reorderButtonAction() {
//        let generator = UIImpactFeedbackGenerator(style: .heavy)
//        generator.impactOccurred()
//        movies?.reverse()
    }

    func errorButtonAction() {
        if error == .loadedFromStorage || currentPage > 1 {
            state = .loaded
            error = nil
        } else {
            fatalError()
        }
    }
}
