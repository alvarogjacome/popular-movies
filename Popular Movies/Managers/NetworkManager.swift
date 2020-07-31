//
//  NetworkManager.swift
//  Popular Movies
//
//  Created by Álvaro Gutiérrez Jácome on 01/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

final class NetworkManager {
    static let shared = NetworkManager()

    private init() {}

    private func fetch<T: Decodable>(from url: URL, completionHandler: @escaping (Result<T, CustomError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completionHandler(.failure(.unableToComplete))
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completionHandler(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completionHandler(.failure(.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let game = try decoder.decode(T.self, from: data)
                completionHandler(.success(game))
            } catch {
                completionHandler(.failure(.invalidData))
            }
        }
        .resume()
    }

    func fetchPopularMovies(completionHandler: @escaping (Result<[PopularMovie], CustomError>) -> Void) {
        fetch(from: URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=e1f6c97b51057579112740327d618edc")!) { (response: Result<PopularMoviesList, CustomError>) in
            switch response {
                case .failure(let error):
                    completionHandler(.failure(error))
                case .success(let movieList):
                    completionHandler(.success(movieList.results))
            }
        }
    }

    func fetchMovieDetails(with id: Int, completionHandler: @escaping (Result<Movie, CustomError>) -> Void) {
        fetch(from: URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=e1f6c97b51057579112740327d618edc")!) { (response: Result<Movie, CustomError>) in
            switch response {
                case .failure(let error):
                    completionHandler(.failure(error))
                case .success(let movie):
                    completionHandler(.success(movie))
            }
        }
    }

    func fetchMovieImage(completionHandler: @escaping (Image) -> Void) {}
}
