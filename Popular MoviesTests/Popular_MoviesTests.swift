//
//  Popular_MoviesTests.swift
//  Popular MoviesTests
//
//  Created by Álvaro Gutiérrez Jácome on 31/07/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

@testable import Popular_Movies
import SwiftUI
import XCTest

class Popular_MoviesTests: XCTestCase {
    let networkManager: NetworkManager = NetworkManager.shared
    let imageLoader: ImageLoader = ImageLoader.shared


    func test_fetch_popular_movies_success() {
        let moviesExpectation = expectation(description: "popularMovies")
        var moviesResponse: [PopularMovie]?
        var error: CustomError?

        networkManager.fetchPopularMovies { (response: Result<[PopularMovie], CustomError>) in
            switch response {
                case .success(let movies):
                    moviesResponse = movies
                case .failure(let responseError):
                    error = responseError
            }
            moviesExpectation.fulfill()
        }

        waitForExpectations(timeout: 1) { _ in
            XCTAssertNotNil(moviesResponse)
            XCTAssertNil(error)
        }
    }

    func test_fetch_movie_details_success() {
        let movieExpectation = expectation(description: "movieDetails")
        var movieDetails: Movie?
        var error: CustomError?

        let movieId = 64690

        networkManager.fetchMovieDetails(with: movieId) { (response: Result<Movie, CustomError>) in
            switch response {
                case .success(let movie):
                    movieDetails = movie
                case .failure(let responseError):
                    error = responseError
            }
            movieExpectation.fulfill()
        }

        waitForExpectations(timeout: 1) { _ in
            XCTAssertNotNil(movieDetails)
            XCTAssertNil(error)
        }
    }

    func test_fetch_movie_details_failure() {
        let movieExpectation = expectation(description: "movieDetails")
        var movieDetails: Movie?
        var error: CustomError?

        let movieId = 0

        networkManager.fetchMovieDetails(with: movieId) { (response: Result<Movie, CustomError>) in
            switch response {
                case .success(let movie):
                    movieDetails = movie
                case .failure(let responseError):
                    error = responseError
            }
            movieExpectation.fulfill()
        }

        waitForExpectations(timeout: 1) { _ in
            XCTAssertNil(movieDetails)
            XCTAssertNotNil(error)
            XCTAssertEqual(error, CustomError.invalidResponse)
        }
    }

    func test_image_loading_success() {
        let imageExpectation = expectation(description: "remoteMovieImage")
        var movieImage: Image?
        let moviePath = "/602vevIURmpDfzbnv5Ubi6wIkQm.jpg"

        imageLoader.fetchMovieImage(from: moviePath) { (response: Result<Image, CustomError>) in
            switch response {
                case .success(let image):
                    movieImage = image
                case .failure:
                    break
            }
            imageExpectation.fulfill()
        }

        waitForExpectations(timeout: 1) { _ in
            XCTAssertNotNil(movieImage)
        }
    }

    func test_image_loading_failure() {
        let imageExpectation = expectation(description: "remoteMovieImage")
        var movieImage: Image?
        let moviePath = ""

        imageLoader.fetchMovieImage(from: moviePath) { (response: Result<Image, CustomError>) in
            switch response {
                case .success(let image):
                    movieImage = image
                case .failure:
                    break
            }
            imageExpectation.fulfill()
        }

        waitForExpectations(timeout: 1) { _ in
            XCTAssertNil(movieImage)
        }
    }
}
