//
//  CustomImageView.swift
//  Popular Movies
//
//  Created by Álvaro Gutiérrez Jácome on 02/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct MovieImageView<Placeholder: View, LoadingView: View>: View {
    @State private var movieImage: Image?
    @State private var loadingCompleted = false
    private let placeholder: Placeholder
    private let loadingView: LoadingView?
    private let path: String

    init(path: String, placeholder: Placeholder, loadingView: LoadingView? = nil) {
        self.path = path
        self.placeholder = placeholder
        self.loadingView = loadingView
    }

    var body: some View {
        image
            .onAppear(perform: {
                ImageLoader.shared.fetchMovieImage(from: self.path) { (response: Result<Image, CustomError>) in
                    switch response {
                        case .success(let image):
                            self.movieImage = image
                            self.loadingCompleted = true
                        case .failure:
                            self.loadingCompleted = true
                    }
                }
        })
    }

    private var image: some View {
        Group {
            if movieImage != nil {
                movieImage!
                    .resizable()
            } else if movieImage == nil && loadingCompleted {
                placeholder
            } else {
                loadingView
            }
        }.animation(.spring())
    }
}
