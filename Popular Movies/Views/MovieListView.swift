//
//  MovieListView.swift
//  Popular Movies
//
//  Created by Álvaro Gutiérrez Jácome on 02/08/2020.
//  Copyright © 2020 alvarogjacome. All rights reserved.
//

import SwiftUI

struct MoviesListView: View {
    let movieList: [PopularMovie]
    var canLoadMoreMovies: Bool
    let action: () -> Void
    let geometry: GeometryProxy

    var body: some View {
        ScrollView(.vertical) {
            ForEach(movieList

            ) { movie in
                MovieCellView(movie: movie, geometry: self.geometry)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .frame(width: ScreenSize.width)
            .animation(.spring())

            if canLoadMoreMovies {
                Button(action: action) {
                    Text("More")
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundColor(Color(.systemBackground))
                        .padding(.vertical, 15)
                        .padding(.horizontal, 40)
                }
                .background(LinearGradient(gradient: Gradient(colors: [Colors.lightGreen, Colors.lightBlue]), startPoint: .leading, endPoint: .trailing))
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                .padding(.vertical)
            }
        }
        .padding(.bottom, 30)
    }
}
