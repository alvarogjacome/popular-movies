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
                        VStack {
                            MainModuleView(movieDetails: self.$movieDetails)
                                .modifier(ModuleModifier(geometry: geometry))
                            SummaryModuleView(movieDetails: self.$movieDetails)
                                .modifier(ModuleModifier(geometry: geometry))
                            DetailsModuleView(movieDetails: self.$movieDetails)
                                .modifier(ModuleModifier(geometry: geometry))
                        }
                        .padding(.bottom)
                    }
                }
                .animation(.spring())
            }
            .background(Color(.secondarySystemBackground))
        }
        .edgesIgnoringSafeArea(.vertical)
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
