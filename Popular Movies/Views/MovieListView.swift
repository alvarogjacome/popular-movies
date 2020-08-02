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
    let geometry: GeometryProxy

    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .center, spacing: 10) {
                ForEach(movieList

                ) { movie in
                    MovieCellView(movie: movie, geometry: self.geometry)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .padding(.bottom)
            .frame(width: UIScreen.main.bounds.width)
            .animation(.spring())
        }
    }
}
