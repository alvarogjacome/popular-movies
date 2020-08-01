//
//  MovieDetailScreen.swift
//  Popular Movies
//
//  Created by Álvaro Gutiérrez Jácome on 01/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct MovieDetailScreen: View {
    @State private var movieDetails: Movie?

    let moviePoster: Image
    let movie: PopularMovie

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                HeaderView(moviePoster: self.moviePoster, movie: self.movie, geometry: geometry)
                ScrollView(.vertical) {
                    if self.movieDetails != nil {
                        MainModuleView(movieDetails: self.$movieDetails)
                        SummaryModuleView(movieDetails: self.$movieDetails)
                        DetailsModuleView(movieDetails: self.$movieDetails)
                    }
                }
            }
            .background(Color(.secondarySystemBackground))
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            NetworkManager.shared.fetchMovieDetails(with: self.movie.id) { (response: Result<Movie, CustomError>) in
                switch response {
                    case .failure(let error):
                        dump(error)
                    case .success(let movie):
                        self.movieDetails = movie
                }
            }
        }
    }
}
