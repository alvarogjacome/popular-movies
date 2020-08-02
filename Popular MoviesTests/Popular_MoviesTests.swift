//
//  Popular_MoviesTests.swift
//  Popular MoviesTests
//
//  Created by Álvaro Gutiérrez Jácome on 31/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

@testable import Popular_Movies
import XCTest

class Popular_MoviesTests: XCTestCase {
    let networkManager = NetworkManager.shared

    func test_fetch_popular_movies_success() {
        let moviesExpectation = expectation(description: "popularMovies")
        var moviesResponse: [PopularMovie]?

        networkManager.fetchPopularMovies { (response: Result<[PopularMovie], CustomError>) in
            switch response {
                case .success(let movies):
                    moviesResponse = movies
                    moviesExpectation.fulfill()
                case .failure:
                    break
            }
        }

        waitForExpectations(timeout: 1) { _ in
            XCTAssertNotNil(moviesResponse)
        }
    }

    func test_fetch_movie_details_success() {
        let movieExpectation = expectation(description: "movieDetails")
        var movieDetails: Movie?

        let movieId = 64690

        networkManager.fetchMovieDetails(with: movieId) { (response: Result<Movie, CustomError>) in
            switch response {
                case .success(let movie):
                    movieDetails = movie
                    movieExpectation.fulfill()
                case .failure:
                    break
            }
        }

        waitForExpectations(timeout: 1) { _ in
            XCTAssertNotNil(movieDetails)
        }
    }
}
