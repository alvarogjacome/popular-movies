//
//  PersistanceManager.swift
//  Popular Movies
//
//  Created by Álvaro Gutiérrez Jácome on 02/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import Foundation

enum PersistenceManager {
    private static let defaults = UserDefaults.standard

    enum keys: String {
        case popularMovies
    }

    static func updateWith(movies: [PopularMovie], completed: @escaping (CustomError?) -> Void = { _ in }) {
        completed(savePopularMovies(movies: movies))
    }

    static func retrievePopuplarMovies(completed: @escaping (Result<[PopularMovie], CustomError>) -> Void) {
        guard let popularMovies = defaults.object(forKey: keys.popularMovies.rawValue) as? Data else {
            completed(.failure(.unableToComplete))
            return
        }
        do {
            let movies = try JSONDecoder().decode([PopularMovie].self, from: popularMovies)
            if !movies.isEmpty {
                completed(.success(movies))
            } else {
                completed(.failure(.unableToComplete))
            }
        } catch {
            completed(.failure(.unableToComplete))
        }
    }

    private static func savePopularMovies(movies: [PopularMovie]) -> CustomError? {
        removeKeyValueFromDefaults(Key: keys.popularMovies.rawValue)

        do {
            try defaults.set(JSONEncoder().encode(movies), forKey: keys.popularMovies.rawValue)
            return nil
        } catch {
            return .unableToSave
        }
    }

    private static func removeKeyValueFromDefaults(Key: String) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: Key)
        defaults.synchronize()
    }
}
