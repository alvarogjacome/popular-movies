//
//  ImageLoader.swift
//  Popular Movies
//
//  Created by Álvaro Gutiérrez Jácome on 02/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import Combine
import SwiftUI

class ImageLoader {
    static let shared = ImageLoader()
    private let cache = NSCache<NSString, UIImage>()

    func fetchMovieImage(from path: String?, completion: @escaping (Result<Image, CustomError>) -> Void) {
        guard let path = path else {
            completion(.failure(CustomError.invalidRequest))
            return
        }
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(path)") else {
            completion(.failure(CustomError.invalidRequest))
            return
        }
        let NSPath = NSString(string: path)

        if let cachedImage = cache.object(forKey: NSPath) {
            completion(.success(Image(uiImage: cachedImage)))
            return
        }

        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            if let _ = error {
                completion(.failure(.unableToComplete))
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }

            guard let image = UIImage(data: data) else {
                completion(.failure(.unableToConvertToImage))
                return
            }
            self.cache.setObject(image, forKey: NSPath)
            completion(.success(Image(uiImage: image)))
        })
            .resume()
    }
}
